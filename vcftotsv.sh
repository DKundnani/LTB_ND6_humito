#! usr/bin/env bash

#Selecting columns
## add for loop for zipping
bgzip ${1}
file=${1}.gz
bcftools query -f '%CHROM\t%POS\t%ID\t%REF\t%ALT\t[%AD]\n' ${file} > $(dirname ${file})/$(basename ${file} .fq.gz)_alt_percent.temp1

#Splitting the AD column
awk '{split($NF, arr, ","); print $1, $2, $3, $4, $5, arr[1], arr[2]}' $(dirname ${file})/$(basename ${file} .fq.gz)_alt_percent.temp1 > $(dirname ${file})/$(basename ${file} .fq.gz)_alt_percent.temp2

#Adding the percentage alt reads column
awk '{split($NF, arr, ","); new_val = ($(NF-1) / (arr[1] + $(NF-1))) * 100; print $0, new_val}' $(dirname ${file})/$(basename ${file} .fq.gz)_alt_percent.temp2 > $(dirname ${file})/$(basename ${file} .fq.gz)_alt_percent.temp3

awk '{print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $6 "\t" $7 "\t" $8}' $(dirname ${file})/$(basename ${file} .fq.gz)_alt_percent.temp3 > $(dirname ${file})/$(basename ${file} .fq.gz)_alt_percent.temp4

awk 'BEGIN {print "#CHROM\tPOS\tID\tREF\tALT\tREF_READS\tALT_READS\tALT_READS_PERCENT"} {print $0}' $(dirname ${file})/$(basename ${file} .fq.gz)_alt_percent.temp4 > $(dirname ${file})/$(basename ${file} .fq.gz)_alt_percent.tsv

rm $(dirname ${file})/$(basename ${file} .fq.gz)_alt_percent.temp*
