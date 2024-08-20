#!/bin/bash

#Set some userful settings to handle errors
set -euo pipefail

#Define URLs and file paths

FASTQ_R1="subset-SRR11518889_1.fastq.gz"
FASTQ_R2="subset-SRR11518889_2.fastq.gz"
FASTQ_URL="https://raw.githubusercontent.com/AlexsLemonade/reproducible-research/main/instructor_notes/fastq_subset"

DATA_DIR=".data/raw/fastq/SRP255855"
mkdir -p $DATA_DIR

###### Process the R1 file #######

echo "Downloading the R1 file"

#Download the R1 file
# -O: keep same file anme as on internet
# -s: don't print status bar or erros
# -S: but actually i do want to print errors
curl -sSO ${FASTQ_URL}/${FASTQ_R1}

#Move the file
mv ${FASTQ_R1} ${DATA_DIR}/

# Print the number of lines in the file
gunzip -c ${DATA_DIR}/${FASTQ_R1} | wc -l

###### Process the R2 file #######
echo "Downloading the R2 file"

#Download
# -O: keep same file anme as on internet
# -s: don't print status bar or erros
# -S: but actually i do want to print errors
curl -sSO ${FASTQ_URL}/${FASTQ_R2}

#Move the file
mv ${FASTQ_R2} ${DATA_DIR}/

# Print the number of lines in the file
gunzip -c ${DATA_DIR}/${FASTQ_R2} | wc -l

#Run in Terminal 
#bash {your bash file} : to run bash file
#bash {your bash file} > log.txt : to run bash file and also save as log.txt file
#cat log.txt : to open log file in terminal