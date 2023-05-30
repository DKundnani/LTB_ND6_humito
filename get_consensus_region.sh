ref='/storage/coda1/p-fstorici3/0/kchhatlani6/hu-mito/reference/filtered_hg38-chrM.fa'
vcfpath='/storage/coda1/p-fstorici3/0/kchhatlani6/hu-mito/vcfs'
consensus_output='/storage/coda1/p-fstorici3/0/kchhatlani6/hu-mito/consensus'
ND6_cordinates='/storage/coda1/p-fstorici3/0/kchhatlani6/hu-mito/ND6.bed'

for sample in DLTB-8 TLTB-8; do
cat $ref | bcftools consensus ${vcfpath}/${sample}/${sample}_mutect.vcf.gz > ${consensus_output}/${sample}/${sample}.fa
done

## ND6.bed has co-ordinates of ND6 region of mtDNA
## chrM    4470    5511

for sample in DLTB-8 TLTB-8; do
bedtools getfasta -fi ${consensus_output}/${sample}/${sample}.fa -bed ${ND6_cordinates} -fo ${consensus_output}/${sample}/${sample}_ND6.fa
done
