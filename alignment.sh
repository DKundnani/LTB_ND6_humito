ref='/storage/coda1/p-fstorici3/0/kchhatlani6/hu-mito/reference/filtered_hg38-chrM.fa'
readpath='/storage/coda1/p-fstorici3/0/kchhatlani6/hu-mito/DNA-seq'
bam_output='/storage/coda1/p-fstorici3/0/kchhatlani6/hu-mito/bams'

# INEDXING REF GENOME
bwa index $ref
gatk CreateSequenceDictionary -R $ref

# ALIGNMENT
for sample in DLTB-8 TLTB-8 DLTB-P TLTB-P;
do
# mapping 2 reads with ref genome
bwa mem -R '@RG\tID:foo\tSM:bar\tLB:library1' $ref $readpath/FS25-${sample}_R1.fq  $readpath/FS25-${sample}R2.fq > ${bam_output}/${sample}/${sample}.sam
# sam to bam
samtools fixmate -O bam ${bam_output}/${sample}${sample}.sam ${bam_output}/${sample}/${sample}_fixmate.bam
# sorting bam file
samtools sort -O bam -o ${bam_output}/${sample}${sample}_sorted.bam ${bam_output}/${sample}/${sample}_fixmate.bam
# indexing bam file
samtools index ${bam_output}/${sample}${sample}_sorted.bam
done
