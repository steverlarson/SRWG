#! /bin/bash

./UNEAKpipeline.sh ../UNEAK SRWG_all.out ../data/Original_data/SRWG_GBS068.txt /home/steve/bigshare/Steve/GBS_files/links/HFM2LBGXN_0_fastq.txt.gz

# Basically this helps keep a record of the agruments that went into Matt's UNEAKpipeline.sh script.
# The first agument is the name and location  of folder for all of the output including copies of the input files specified by the 3rd and 4th arguments. It will create nine subfolders.
# The second argument file containing redirected stdout of UNEAKpipeline tassel commands, which will go into the main folder of first argument.
# The third argument is original copy of key file, which will be copied to the agrument_1/key folder
# The fourth argument is a list of the fastq files or symbolic links to the fastq files, which will be copied to he argument_1/Illumina folder