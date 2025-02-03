## 💻 System and package requirements:
* osx-64 platform
* conda
### Installing required packages
* If using an Apple Silicon (arm64) system, install the Rosetta emulator to enable compatibility with the osx-64 compiler, then create a Conda environment as shown below.
```
CONDA_SUBDIR=osx-64 conda create -n assignment1 -y
conda activate assignment1
conda install -c bioconda -c conda-forge entrez-direct sra-tools fastqc trimmomatic skesa spades pigz tree -y
conda install python=2.7 biopython -y
 ```
## 🔗 Overview
This repository contains the dataset, intermediate analysis files, and output files (including logs) from the cleaning and assembly of the smallest and largest files in our dataset.
Our pipeline conducts pre-processing of raw sample reads for Illumina short reads, visualizes quality control measures, and assembles the reads with Skesa and/or SPAdes for downstream analysis.
This repository will also contain our proposed workflow for the continuation of this project where we will be comparing different trimming methods and genome assemblers to prepare the sequence of our bacterial isolate for futher downstream analysis, so it will be updated with such code in the comeing weeks. 

## 📂 Files
* `preliminary_results_commands.sh` contains all the commands to conduct read cleaning and assembly on the largest and smallest files
* `cleaning_assembly.sh` is the script that contains the commands to conduct read cleaning and assembly on parameter files
* `raw_qc/` contains the quality visualization of the raw reads from FastQC
* `trim_qc/` contains the quality visualization of the processed reads from FastQC
* `asm/spades/` contains the associated SPAdes assembly output files
* `contig_stats/spades` contains files with information about contigs generated from assembly

## 🧬 Running the pipeline
```
mkdir raw_data # create a directory inside the directory you donwloaded this repo and move the largest and smallest files
# (A2128694_S01_L001_R1_001.fastq.gz, A2128694_S02_L001_R1_001.fastq.gz; A2128696_S01_L001_R1_001.fastq.gz, A2128696_S01_L001_R2_001.fastq.gz)

./preliminary_results_commands.sh
```
