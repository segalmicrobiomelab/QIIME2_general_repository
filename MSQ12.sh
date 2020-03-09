#!/bin/bash
#SBATCH --job-name=MSQ12 			 # Job name
#SBATCH --mail-type=BEGIN,END,FAIL      	 # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=benjamin.wu@nyumc.org        # Where to send mail
#SBATCH --ntasks=16                   		 # Run on a single CPU
#SBATCH --mem=64gb                    		 # Job memory request
#SBATCH --time=72:05:00             		 # Time limit hrs:min:sec
#SBATCH --output=serial_test_%j.log   # Standard output and error log

module add miniconda3/4.6.14
source activate qiime2-2019.10

cd /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12/
mkdir QIIME2_2_import
mkdir QIIME2_3_demux
mkdir QIIME2_4_DADA2
mkdir QIIME2_6_Tree
mkdir QIIME2_7_core_metrics
mkdir QIIME2_8_taxonomy

qiime tools import \
  --type EMPPairedEndSequences \
  --input-path /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12/2_fastq \
  --output-path /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12/QIIME2_3_demux/emp-paired-end-sequences.qza

qiime demux emp-paired \
--i-seqs /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12/QIIME2_3_demux/emp-paired-end-sequences.qza \
--o-per-sample-sequences /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12/QIIME2_3_demux/demultiplex.qza \
--m-barcodes-file /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.12.Map.txt \
--m-barcodes-column BarcodeSequence \
--p-rev-comp-mapping-barcodes \
--verbose \
--o-error-correction-details /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12/QIIME2_3_demux/error.qza 

qiime demux summarize \
  --i-data /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12/QIIME2_3_demux/demultiplex.qza \
  --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12/QIIME2_3_demux/demultiplex.qzv

qiime dada2 denoise-paired \
  --i-demultiplexed-seqs /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12/QIIME2_3_demux/demultiplex.qza \
  --p-trim-left-f 13 \
  --p-trim-left-r 13 \
  --p-trunc-len-f 145 \
  --p-trunc-len-r 145 \
  --p-n-threads 0 \
  --o-table /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12/QIIME2_4_DADA2/table.qza \
  --o-representative-sequences /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12/QIIME2_4_DADA2/rep-seqs.qza \
  --o-denoising-stats /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12/QIIME2_4_DADA2/denoising-stats.qza