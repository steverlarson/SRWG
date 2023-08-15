#! /bin/bash


USAGE="  USAGE: UNEAKpipeline.sh <location(output folder)> <output_file_name(must end .out)> <path_to_UNEAK_barcode_file> [path_to_fastq_file1] [fastqfile2] [fastqfile3] [fastqfilen]"
EXAMPLE="EXAMPLE: UNEAKpipeline.sh ~/projects/og_gbs/batch2 OG_GBS2nd48.out ~/Documents/somewhere/barcodes.txt ~/projects/og_gbs/code_flowcell_s_lane_fastq.txt.gz"

# check if help was requested
for arg in "$@"
do
	if [ "$arg" == "-h" ] || [ "$arg" == "-help" ] || [ "$arg" == "--help" ]
	then
		printf "\n${USAGE}\n${EXAMPLE}\n\n"
		exit 0
	fi
done

# check if correct number of arguments provided
expected_args=4
if [ $# -lt $expected_args ]
then
	printf "${RED}\n  ERROR: Expected %u args, %u provided.\n\n${USAGE}\n${EXAMPLE}${NC}\n\n" ${expected_args} $#
	exit 1
fi

location=$1
shift
output=$1
output=${location}/${output}
shift
barcode=$1
shift

# create directory structure
mkdir -p ${location}
/usr/local/tassel3-standalone/run_pipeline.pl -fork1 \
	-UCreatWorkingDirPlugin -w ${location} -endPlugin \
	-runfork1 > ${output}
printf "${LBLUE}Finished UCreateWorkingDirPlugin\n${NC}" 1>&2

# LINK fastqs into the illumina directory
for fastqfile in "$@"
do
	# just in case they don't supply an absolute path...
	if [ "${fastqfile:0:1}" != '/' ]
	then
		fastqfile=${PWD}/${fastqfile}
	fi

	# actually perform the linking
	ln -s ${fastqfile} ${location}/Illumina
done
printf "${LBLUE}Finished linking fastq files into \`Illumina' directory\n${NC}" 1>&2

# COPY barcode file into key directory
cp $barcode ${location}/key
printf "${LBLUE}Finished copying barcode file into \`key' directory\n${NC}" 1>&2

# Tag count from fastq
/usr/local/tassel3-standalone/run_pipeline.pl -Xmx100g -fork1 \
	-UFastqToTagCountPlugin -w ${location} -e PstI-MspI -s 1000000000 -endPlugin \
	-runfork1 >> ${output}
printf "${LBLUE}Finished UFastqToTagCountPlugin\n${NC}" 1>&2

# Merge taxa
/usr/local/tassel3-standalone/run_pipeline.pl -Xmx100g -fork1 \
	-UMergeTaxaTagCountPlugin -w ${location} -c 5 -m 1000000000 -endPlugin \
	-runfork1 >> ${output}
printf "${LBLUE}Finished UMergeTaxaTagCountPlugin\n${NC}" 1>&2

# make tag pairs from merged tag counts
/usr/local/tassel3-standalone/run_pipeline.pl -Xmx100g -fork1 \
	-UTagCountToTagPairPlugin -w ${location} -e 0.05 -endPlugin \
	-runfork1 >> ${output}
printf "${LBLUE}Finished UTagCountToTagPairPlugin\n${NC}" 1>&2

# make TBT from tag pairs
/usr/local/tassel3-standalone/run_pipeline.pl -Xmx100g -fork1 \
	-UTagPairToTBTPlugin -w ${location} -endPlugin \
	-runfork1 >> ${output}
printf "${LBLUE}Finished UTagPairToTBTPlugin\n${NC}" 1>&2

# make map info from TBT
/usr/local/tassel3-standalone/run_pipeline.pl -Xmx100g -fork1 \
	-UTBTToMapInfoPlugin -w ${location} -endPlugin \
	-runfork1 >> ${output}
printf "${LBLUE}Finished UTBTToMapInfoPlugin\n${NC}" 1>&2

# make hapmap info from map info 
/usr/local/tassel3-standalone/run_pipeline.pl -Xmx100g -fork1 \
	-UMapInfoToHapMapPlugin -w ${location} -mnMAF 0.05 -mxMAF 0.5 -mnC 0 -mxC 1 -endPlugin \
	-runfork1 >> ${output}
printf "${LBLUE}Finished UMapInfoToHapMapPlugin\n${NC}" 1>&2

# print final message and exit
printf "${LGREEN}Finished pipeline\n${NC}" 1>&2
exit 0
