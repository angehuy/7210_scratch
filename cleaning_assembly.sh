#!/bin/bash

# Usage: ./preliminary_results_commands.sh [name of forward read] [name of reverse read]
# Example usage: ./cleaning_assembly.sh A2128696_S01_L001_R1_001.fastq.gz A2128696_S01_L001_R2_001.fastq.gz
# ./cleaning_assembly.sh A2128694_S01_L001_R1_001.fastq.gz A2128694_S01_L001_R2_001.fastq.gz 
# Runs and creates directories from the current working directory

forward_file=$1
reverse_file=$2
sample_id="${forward_file%%_*}"

# Step 1: Run FastQC on raw data
mkdir -p raw_qc/$sample_id
echo "Running FastQC on raw data..."
fastqc \
  --threads 2 \
  --outdir ./raw_qc/$sample_id \
  ./raw_data/$1 \
  ./raw_data/$2


# Step 2: Visualizing the raw FastQC
# Open FastQC HTML reports in Google Chrome
echo "Opening FastQC HTML reports..."
# open -a 'google chrome' ./raw_qc/*.html

# Step 3: Trim reads using Trimmomatic
mkdir -p ./trim/$sample_id
echo "Trimming reads with Trimmomatic..."


trimmomatic PE -phred33 \
  ./raw_data/$1 \
  ./raw_data/$2 \
  ./trim/$sample_id/r1.paired.fq.gz \
  ./trim/$sample_id/r1_unpaired.fq.gz \
  ./trim/$sample_id/r2.paired.fq.gz \
  ./trim/$sample_id/r2_unpaired.fq.gz \
  HEADCROP:15 LEADING:10 TRAILING:10 SLIDINGWINDOW:4:30 AVGQUAL:30 MINLEN:50

# Step 4: Visualizing the post-trim FastQC

mkdir -p trim_qc/$sample_id
fastqc \
  --threads 2 \
  --outdir ./trim_qc/$sample_id \
  ./trim/$sample_id/r1.paired.fq.gz \
  ./trim/$sample_id/r2.paired.fq.gz

# Open FastQC HTML reports in Google Chrome
echo "Opening FastQC HTML reports..."
# open -a 'google chrome' ./trim_qc/*.html

# Step 5: Assemble with SPAdes
mkdir -p asm/spades/$sample_id
echo "Assembling with SPAdes..."

# Combine unpaired reads into a single file for SPAdes
cat ./trim/$sample_id/r1_unpaired.fq.gz ./trim/$sample_id/r2_unpaired.fq.gz > ./trim/$sample_id/singletons.fq.gz


spades.py \
  -1 ./trim/$sample_id/r1.paired.fq.gz \
  -2 ./trim/$sample_id/r2.paired.fq.gz \
  -s ./trim/$sample_id/singletons.fq.gz \
  -o ./asm/spades/$sample_id \
  --isolate \
  1> ./asm/spades/$sample_id/spades.stdout.txt 2> ./asm/spades/$sample_id/spades.stderr.txt


# Count number of contigs from genome assembly
mkdir contig_stats/$sample_id
echo "Number of contigs:"
grep -c '>' ./asm/spades/$sample_id/contigs.fasta


# Need specific python version
conda install python=2.7 biopython -y

# Generating output files of filtered contigs
./filter.contigs.py --infile ./asm/spades/$sample_id/contigs.fasta --outfile ./contig_stats/$sample_id/filtered-contigs.fa --discarded ./contig_stats/$sample_id/removed-contigs.fa 1> ./contig_stats/$sample_id/contig-filtering.stdout.log 2> ./contig_stats/$sample_id/contig-filtering.stderr.log


# ./filter.contigs.py --infile ./asm/spades/A2128696/contigs.fasta --outfile ./contig_stats/A2128696/filtered-contigs.fa --discarded ./contig_stats/A2128696/removed-contigs.fa 1> ./contig_stats/A2128696/contig-filtering.stdout.log 2> ./contig_stats/A2128696/contig-filtering.stderr.log


tail -n 20 ./contig_stats/$sample_id/contig-filtering.stderr.log


# Saving output of filtered assembly into a new file
cp ./contig_stats/$sample_id/filtered-contigs.fa ./contig_stats/$sample_id/filtered_assembly.fna

#conda install python=3.8 --yes
#conda update spades --yes

echo "preliminary_results_commands.sh script has finished running!"


