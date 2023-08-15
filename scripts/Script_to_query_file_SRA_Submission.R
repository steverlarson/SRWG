#SRA Key Submission
####STEP 1 ############
#Get Data from MySQL database using Navicat query 'NCBI_keyfile_SRWG':

 # SELECT dna.sample_name as 'FullSampleName', 
 # barcodes.barcode as 'Barcode', 
 # gbs.gbs_id as 'LibraryPlateID'
 # FROM dna LEFT JOIN gbs ON gbs.dna_id = dna.plate_id
 # INNER JOIN barcodes ON dna.well_A01 = barcodes.well_A01 AND gbs.plexing LIKE barcodes.`set` 
 # WHERE gbs.gbs_name LIKE 'TJ-SnakeRiverWhtGrass'
 # ORDER BY gbs.gbs_id, dna.well_01A ASC
# Export the keyfile from NaviCat to Desktop and move it to 

# Import keyfile
key <- read.csv(file = '~/bigshare/Steve/Analysis_tools/1-TJ_SRWG/data/Original_data/NCBI_keyfile_SRWG.csv', header = TRUE, stringsAsFactors = FALSE, check.names = FALSE)



#########STEP 2 ##################3
#Format files
require(plyr)

key$LibraryPlateID <- substr(key$LibraryPlateID, 1, 6) #process each library by itself

table(key$LibraryPlateID)
1 == length(unique(key$LibraryPlateID)) #check should have 1 fastq file (GBS068)

key$id <- paste('(', key$FullSampleName, ',', key$Barcode, ')', sep = '') #make id (for am panel completed in excel)

out_df <- as.data.frame(matrix(data = NA, nrow = 21, ncol = 2))
colnames(out_df) <- c('gbs', 'seq')

for(i in 1:length(unique(key$LibraryPlateID))){ #loop over each plate_id
  gbs_id <- unique(key$LibraryPlateID)[i] #get library prep to work with
  x <- key[key$LibraryPlateID == gbs_id, 4] #get key
  x <- paste(x,  collapse = '')
  out_df$gbs[i] <- gbs_id
  
  x <- paste('Method: See Poland JA, Rife TW: Genotyping-by-sequencing for plant breeding and genetics. Plant Genome 2012, 5:92–102. Barcodes: (Sample_id,Barcode)', x, sep = '') #add information
  x <- toString(x)
  out_df$seq[i] <- x
  
}

#write out
write.table(out_df, file = '~/bigshare/Steve/Analysis_tools/1-TJ_SRWG/data/Original_data/SRWG_GBS068_SRA_to_Upload.txt', col.names = FALSE, sep = '', quote = FALSE, row.names = FALSE)

#clean up
rm(key, i, gbs_id, x, out, out_df)

