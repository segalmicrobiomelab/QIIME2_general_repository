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

qiime feature-table summarize \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12/QIIME2_4_DADA2/table.qza \
  --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12/QIIME2_4_DADA2/table.qzv \
  --m-sample-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.12.Map.txt

qiime feature-table tabulate-seqs \
  --i-data /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12/QIIME2_4_DADA2/rep-seqs.qza \
  --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12/QIIME2_4_DADA2/rep-seqs.qzv

qiime metadata tabulate \
  --m-input-file /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12/QIIME2_4_DADA2/denoising-stats.qza \
  --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12/QIIME2_4_DADA2/denoising-stats.qzv