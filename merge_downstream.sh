#!/bin/bash
#SBATCH --job-name=merge.run.sh			 # Job name
#SBATCH --mail-type=BEGIN,END,FAIL      	 # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=benjamin.wu@nyumc.org        # Where to send mail
#SBATCH --ntasks=16                   		 # Run on a single CPU
#SBATCH --mem=64gb                    		 # Job memory request
#SBATCH --time=72:05:00             		 # Time limit hrs:min:sec
#SBATCH --output=serial_test_%j.log   # Standard output and error log

module add miniconda3/4.6.14
source activate qiime2-2019.10

cd /gpfs/scratch/wub02/projects/SRA/niosh
mkdir merge
cd /gpfs/scratch/wub02/projects/SRA/niosh/merge
mkdir QIIME2_2_import
mkdir QIIME2_3_demux
mkdir QIIME2_4_DADA2
mkdir QIIME2_6_Tree
mkdir QIIME2_7_core_metrics
mkdir QIIME2_8_taxonomy


qiime feature-table merge \
  --i-tables /gpfs/scratch/wub02/projects/SRA/niosh/MSQ5/QIIME2_4_DADA2/table.qza  \
  --i-tables /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12/QIIME2_4_DADA2/table.qza \
  --i-tables /gpfs/scratch/wub02/projects/SRA/niosh/MSQ44/QIIME2_4_DADA2/table.qza \
  --i-tables /gpfs/scratch/wub02/projects/SRA/niosh/MSQ45/QIIME2_4_DADA2/table.qza \
  --i-tables /gpfs/scratch/wub02/projects/SRA/niosh/MSQ46/QIIME2_4_DADA2/table.qza \
  --i-tables /gpfs/scratch/wub02/projects/SRA/niosh/MSQ47/QIIME2_4_DADA2/table.qza \
  --i-tables /gpfs/scratch/wub02/projects/SRA/niosh/MSQ48/QIIME2_4_DADA2/table.qza \
  --i-tables /gpfs/scratch/wub02/projects/SRA/niosh/MSQ49/QIIME2_4_DADA2/table.qza \
  --i-tables /gpfs/scratch/wub02/projects/SRA/niosh/MSQ50/QIIME2_4_DADA2/table.qza \
  --o-merged-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/table.qza

qiime feature-table merge-seqs \
  --i-data /gpfs/scratch/wub02/projects/SRA/niosh/MSQ5/QIIME2_4_DADA2/rep-seqs.qza \
  --i-data /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12/QIIME2_4_DADA2/rep-seqs.qza \
  --i-data /gpfs/scratch/wub02/projects/SRA/niosh/MSQ44/QIIME2_4_DADA2/rep-seqs.qza \
  --i-data /gpfs/scratch/wub02/projects/SRA/niosh/MSQ45/QIIME2_4_DADA2/rep-seqs.qza \
  --i-data /gpfs/scratch/wub02/projects/SRA/niosh/MSQ46/QIIME2_4_DADA2/rep-seqs.qza \
  --i-data /gpfs/scratch/wub02/projects/SRA/niosh/MSQ47/QIIME2_4_DADA2/rep-seqs.qza \
  --i-data /gpfs/scratch/wub02/projects/SRA/niosh/MSQ48/QIIME2_4_DADA2/rep-seqs.qza \
  --i-data /gpfs/scratch/wub02/projects/SRA/niosh/MSQ49/QIIME2_4_DADA2/rep-seqs.qza \
  --i-data /gpfs/scratch/wub02/projects/SRA/niosh/MSQ50/QIIME2_4_DADA2/rep-seqs.qza \
  --o-merged-data  /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/rep-seqs.qza

qiime feature-table summarize \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/table.qza \
  --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/table.qzv \
  --m-sample-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.NIOSH.txt

qiime feature-table tabulate-seqs \
  --i-data /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/rep-seqs.qza \
  --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/rep-seqs.qzv

### qiime feature-table filter-samples \
###   --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/table.qza \
###   --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.NIOSH.txt \
###   --o-filtered-table /gpfs/home/wub02/projects/lama_nazzal_renal_microbiome/QIIME2_4_DADA2.combo/table.qza/lama-table.qza

###
### 
### 

### qiime feature-table filter-seqs
### --i-data /gpfs/home/wub02/projects/lama_nazzal_renal_microbiome/QIIME2_4_DADA2.combo/rep-seqs.qza  \
### --i-table /gpfs/home/wub02/projects/lama_nazzal_renal_microbiome/QIIME2_4_DADA2.combo/table.qza/lama-table.qza \
### --m-metadata-file /gpfs/home/wub02/projects/lama_nazzal_renal_microbiome/map/Metadata_Lowenstein-2.txt \
### --o-filtered-data /gpfs/home/wub02/projects/lama_nazzal_renal_microbiome/QIIME2_4_DADA2.combo/lama-rep-seqs.qza 

### qiime feature-table summarize \
###   --i-table /gpfs/home/wub02/projects/lama_nazzal_renal_microbiome/QIIME2_4_DADA2.combo/table.qza/lama-table.qza \
###   --o-visualization /gpfs/home/wub02/projects/lama_nazzal_renal_microbiome/QIIME2_4_DADA2.combo/table.qza/lama-table.qzv \
###   --m-sample-metadata-file /gpfs/home/wub02/projects/lama_nazzal_renal_microbiome/map/Metadata_Lowenstein-2.txt

### qiime feature-table tabulate-seqs \
###   --i-data /gpfs/home/wub02/projects/lama_nazzal_renal_microbiome/QIIME2_4_DADA2.combo/lama-rep-seqs.qza \
###   --o-visualization /gpfs/home/wub02/projects/lama_nazzal_renal_microbiome/QIIME2_4_DADA2.combo/lama-rep-seqs.qzv

### Quality filter 

qiime quality-control exclude-seqs \
   --i-query-sequences  /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/rep-seqs.qza \
   --i-reference-sequences /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/99_otus.qza \
   --p-method vsearch \
   --p-perc-identity 0.99 \
   --p-perc-query-aligned 0.99 \
   --p-threads 16 \
   --o-sequence-hits /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/hits_quality.qza \
   --o-sequence-misses /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/misses_quality.qza \
   --verbose

qiime feature-table filter-features \
   --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/table.qza \
   --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/misses_quality.qza \
   --o-filtered-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/no-miss-table.qza \
   --p-exclude-ids

qiime feature-table summarize \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/no-miss-table.qza \
  --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/no-miss-table.qzv \
  --m-sample-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.NIOSH.txt

qiime feature-table tabulate-seqs \
  --i-data /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/hits_quality.qza  \
  --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/hits_quality.qzv

##### Tree

qiime phylogeny align-to-tree-mafft-fasttree \
  --i-sequences /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/rep-seqs.qza \
  --o-alignment /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/aligned-rep-seqs.qza \
  --o-masked-alignment /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/masked-aligned-rep-seqs.qza \
  --o-tree /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/unrooted-tree.qza \
  --o-rooted-tree /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/rooted-tree.qza

##### Metrics

qiime diversity core-metrics-phylogenetic \
  --i-phylogeny /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/rooted-tree.qza \
  --i-table  /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/no-miss-table.qza \
  --p-sampling-depth 1000 \
  --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.NIOSH.txt \
  --output-dir /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_7_core_metrics.merge
