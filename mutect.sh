ref='/storage/coda1/p-fstorici3/0/kchhatlani6/hu-mito/reference/filtered_hg38-chrM.fa'
bam_output='/storage/coda1/p-fstorici3/0/kchhatlani6/hu-mito/bams'
vcf_output='/storage/coda1/p-fstorici3/0/kchhatlani6/hu-mito/vcfs'
DB='/storage/coda1/p-fstorici3/0/kchhatlani6/DBs'

## RUNNING MUTECT2
for sample in DLTB-8 TLTB-8 DLTB-P TLTB-P;
do
gatk Mutect2 -R $ref -I ${bam_output}/${sample}/${sample}_sorted.bam --germline-resource ${DB}/af-only-gnomad.hg38.vcf.gz --panel-of-normals ${DB}/1000g_pon.hg38.vcf.gz -O ${vcf_output}/${sample}/${sample}_mutect.vcf.gz
gunzip ${vcf_output}/${sample}/${sample}_mutect.vcf.gz
sed 's/chrM/MT/g' ${vcf_output}/${sample}/${sample}_mutect.vcf > ${vcf_output}/${sample}/${sample}_mutect_MT.vcf
bgzip ${vcf_output}/${sample}/${sample}_mutect_MT.vcf
done


## ANNOTATION USING dbSNP
for sample in DLTB-8 TLTB-8 DLTB-P TLTB-P;
do
bcftools annotate -a ${DB}/00-All.vcf.gz -c ID ${vcf_output}/${sample}/${sample}_mutect_MT.vcf.gz > ${vcf_output}/${sample}/${sample}_mutect_rsIDs.vcf.gz
## Extracting info from vcfs into tsv form
bcftools query -f '%CHROM\t%POS\t%ID\t%REF\t%ALT\t%QUAL\t%AC\t%AF\t%AN\t%BaseQRankSum\t%DP\t%ExcessHet\t%FS\t%MLEAC\t%MLEAF\t%MQ\t%MQRankSum\t%QD\t%ReadPosRankSum\t%SOR\t[%GT]:[%AD]:[%DP]:[%GQ]:[%PL]\n' ${vcf_output}/${sample}/${sample}_mutect_rsIDs.vcf > ${vcf_output}/${sample}/${sample}_mutect_temp.tsv
## Adding column names
sed '1iChr\tPOS\tID\t\tREF\tALT\tQUAL\tAC\tAF\tAN\tBQRS\tDP\tEH\tFS\tMLEAC\tMLEAF\tMQ\tMQRS\tQD\tRPRS\tSOR\t[ GT]:[ AD]:[ DP]:[ GQ]:[PL]' ${vcf_output}/${sample}/${sample}_mutect_temp.tsv > ${vcf_output}/${sample}/${sample}_mutect.tsv
done

rm *.temp.tsv
