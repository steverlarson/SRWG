#!/bin/bash

####################################################
## THESE ARE THE PARAMETERS TO CHANGE             ##
####################################################

# naem of project
cd /home/steve/bigshare/Steve/Analysis_tools/1-TJ_SRWG/UNEAK2/hapMap

tasselPath=/usr/local/tassel-5-standalone/run_pipeline.pl 

##################################################
## MAY NOt NEED TO CHANGE ANYTHING FROM HERE ON ##
################################################## 
#LD-kNNi imputes genotypes based on l SNPS in highest LD and k individuals determined using taxi distance across l SNPs (in high LD)

## Convert from Hapmap to VCF
$tasselPath -Xms64G -Xmx128G -fork1 -h HapMap.hmp.txt -export -exportType VCF -runfork1 

java -Xmx100G -jar /usr/local/LinkImpute/LinkImpute.jar -v --verbose --ldout=ldout.txt HapMap.vcf | tee -a  impute.log

#Convert to vcf to Hapmap
$tasselPath -Xms64G -Xmx128G -fork1 \
       -vcf HapMap.vcf \
      -export HapMap_LinkImputed -exportType Hapmap 

printf "\n\nThe imputation has completed\n\n" | tee -a impute.log
