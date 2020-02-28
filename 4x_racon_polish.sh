set -o errexit

#iteration 1
echo "starting minimap_1" >> shell_log
minimap2 -d ../flye_out/assembly.fasta.mmi ../flye_out/assembly.fasta
minimap2 -ax map-ont ../flye_out/assembly.fasta ./all_pass.fastq.gz > reads.minimap1.sam
echo "starting racon_1" >> shell_log
racon -m 8 -x -6 -g -8 -w 500 -c 1 ./all_pass.fastq.gz ./reads.minimap1.sam ../flye_out/assembly.fasta > assembly.racon1.fasta

#iteration 2
echo "starting minimap_2" >> shell_log
minimap2 -d ./assembly.racon1.fasta.mmi ./assembly.racon1.fasta
minimap2 -ax map-ont ./assembly.racon1.fasta ./all_pass.fastq.gz > reads.minimap2.sam
echo "starting racon_2" >> shell_log
racon -m 8 -x -6 -g -8 -w 500 -c 1 ./all_pass.fastq.gz ./reads.minimap2.sam ./assembly.racon1.fasta > assembly.racon2.fasta

#iteration 3
echo "starting minimap_3" >> shell_log
minimap2 -d ./assembly.racon2.fasta.mmi ./assembly.racon2.fasta
minimap2 -ax map-ont ./assembly.racon2.fasta ./all_pass.fastq.gz > reads.minimap3.sam
echo "starting racon_3" >> shell_log
racon -m 8 -x -6 -g -8 -w 500 -c 1 ./all_pass.fastq.gz ./reads.minimap3.sam ./assembly.racon2.fasta > assembly.racon3.fasta

#iteration 4
echo "starting minimap_4" >> shell_log
minimap2 -d ./assembly.racon3.fasta.mmi ./assembly.racon3.fasta
minimap2 -ax map-ont ./assembly.racon3.fasta ./all_pass.fastq.gz > reads.minimap4.sam
echo "starting racon_4" >> shell_log
racon -m 8 -x -6 -g -8 -w 500 -c 1 ./all_pass.fastq.gz ./reads.minimap4.sam ./assembly.racon3.fasta > assembly.racon4.fasta
