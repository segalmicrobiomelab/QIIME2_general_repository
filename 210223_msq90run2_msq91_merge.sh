#!/bin/bash
#SBATCH --job-name=MSQ112_MSQ113							# Job name
#SBATCH --mail-type=BEGIN,END,FAIL       						# Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=benjamin.wu@nyumc.org					        # Where to send mail
#SBATCH --ntasks=32                    							# Run on a single CPU
#SBATCH --mem=64gb            	         						# Job memory request
#SBATCH --output=serial_test_%j.log   							# Standard output and error log
#SBATCH --time=72:00:00									#time


### August 25, 2020 
### MSQ 112
### QIIME2.2020.02 
### Code QIIME2 Import 
### Manifest 

module purge; module load anaconda3/cpu/5.3.1
unset PYTHONPATH; source activate qiime2-2020.2
module load slurm

### Merge Tables/Sequences

### mkdir /gpfs/scratch/wub02/projects/msq90.msq91.run
### mkdir /gpfs/scratch/wub02/projects/msq90.msq91.run
### mkdir /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_2_import
### mkdir /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_3_demux
### mkdir /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_4_DADA2
### mkdir /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_6_Tree
### mkdir /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_7_core_metrics
### mkdir /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_8_taxonomy

qiime feature-table merge \
    --i-tables /gpfs/scratch/wub02/projects/msq90.run2/QIIME2_4_DADA2/table.qza \
    --i-tables /gpfs/scratch/wub02/projects/msq91.run/QIIME2_4_DADA2/table.qza \
    --o-merged-table /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_4_DADA2/table.qza

qiime feature-table merge-seqs \
    --i-data /gpfs/scratch/wub02/projects/msq91.run/QIIME2_4_DADA2/rep-seqs.qza \
    --i-data /gpfs/scratch/wub02/projects/msq90.run2/QIIME2_4_DADA2/rep-seqs.qza \
    --o-merged-data  /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_4_DADA2/rep-seqs.qza

qiime feature-table summarize \
    --i-table /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_4_DADA2/table.qza \
    --o-visualization /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_4_DADA2/table.qzv \
    --m-sample-metadata-file /gpfs/scratch/wub02/projects/msq90.msq91.run/map/MSQ.90.MSQ.91.Map.qiime2.txt

qiime feature-table tabulate-seqs \
    --i-data /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_4_DADA2/rep-seqs.qza \
    --o-visualization /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_4_DADA2/rep-seqs.qzv

qiime feature-table filter-samples \
    --i-table /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_4_DADA2/table.qza \
    --m-metadata-file /gpfs/scratch/wub02/projects/msq90.msq91.run/map/MSQ.90.MSQ.91.Map.qiime2.txt \
    --o-filtered-table /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_4_DADA2/table.filter.qza 

qiime feature-table filter-seqs \
    --i-data /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_4_DADA2/rep-seqs.qza   \
    --i-table /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_4_DADA2/table.filter.qza \
    --o-filtered-data /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_4_DADA2/rep-seqs.filter.qza 

qiime feature-table summarize \
    --i-table /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_4_DADA2/table.filter.qza \
    --o-visualization /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_4_DADA2/table.filter.qzv \
    --m-sample-metadata-file /gpfs/scratch/wub02/projects/msq90.msq91.run/map/MSQ.90.MSQ.91.Map.qiime2.txt

qiime feature-table tabulate-seqs \
    --i-data /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_4_DADA2/rep-seqs.filter.qza  \
   --o-visualization /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_4_DADA2/rep-seqs.filter.qzv

### DADA2

### qiime dada2 denoise-paired \
###    --i-demultiplexed-seqs /gpfs/scratch/wub02/projects/msq113.run/QIIME2_3_demux/emp-paired-end-sequences.qza \
###    --p-trim-left-f 13 \
###    --p-trim-left-r 13 \
###    --p-trunc-len-f 145 \
###    --p-trunc-len-r 145 \
###    --p-n-threads 0 \
###    --o-table /gpfs/scratch/wub02/projects/msq113.run/QIIME2_4_DADA2/table.qza \
###    --o-representative-sequences /gpfs/scratch/wub02/projects/msq113.run/QIIME2_4_DADA2/rep-seqs.qza \
###    --o-denoising-stats /gpfs/scratch/wub02/projects/msq113.run/QIIME2_4_DADA2/denoising-stats.qza

### qiime feature-table summarize \
###    --i-table /gpfs/scratch/wub02/projects/msq113.run/QIIME2_4_DADA2/table.qza \
###    --o-visualization /gpfs/scratch/wub02/projects/msq113.run/QIIME2_4_DADA2/table.qzv \
###    --m-sample-metadata-file /gpfs/scratch/wub02/projects/msq113.run/map/MSQ.113.Map.a1.txt

### qiime feature-table tabulate-seqs \
###    --i-data /gpfs/scratch/wub02/projects/msq113.run/QIIME2_4_DADA2/rep-seqs.qza \
###    --o-visualization /gpfs/scratch/wub02/projects/msq113.run/QIIME2_4_DADA2/rep-seqs.qzv

### qiime metadata tabulate \
###    --m-input-file /gpfs/scratch/wub02/projects/msq113.run/QIIME2_4_DADA2/denoising-stats.qza \
###    --o-visualization /gpfs/scratch/wub02/projects/msq113.run/QIIME2_4_DADA2/denoising-stats.qzv

### Quality filter 

qiime quality-control exclude-seqs \
   --i-query-sequences /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_4_DADA2/rep-seqs.filter.qza \
   --i-reference-sequences /gpfs/scratch/wub02/projects/msq90.msq91.run/greengenes/99_otus.qza \
   --p-method vsearch \
   --p-perc-identity 0.99 \
   --p-perc-query-aligned 0.99 \
   --p-threads 16 \
   --o-sequence-hits /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_4_DADA2/hits_quality.qza \
   --o-sequence-misses /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_4_DADA2/misses_quality.qza \
   --verbose

qiime feature-table filter-features \
   --i-table /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_4_DADA2/table.filter.qza \
   --m-metadata-file /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_4_DADA2/misses_quality.qza \
   --o-filtered-table /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_4_DADA2/no-miss-table-dada2.qza \
   --p-exclude-ids

qiime feature-table summarize \
   --i-table /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_4_DADA2/no-miss-table-dada2.qza \
   --o-visualization /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_4_DADA2/no-miss-table-dada2.qzv \
   --m-sample-metadata-file /gpfs/scratch/wub02/projects/msq90.msq91.run/map/MSQ.90.MSQ.91.Map.qiime2.txt

qiime feature-table tabulate-seqs \
   --i-data /gpfs/scratch/wub02/projects/merge.msq112.msq.113.run/QIIME2_4_DADA2/hits_quality.qza \
   --o-visualization /gpfs/scratch/wub02/projects/merge.msq112.msq.113.run/QIIME2_4_DADA2/hits_quality.qzv

#####
#####
#####
#####
#####

##### Tree

qiime phylogeny align-to-tree-mafft-fasttree \
   --i-sequences /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_4_DADA2/hits_quality.qza \
   --o-alignment /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_6_Tree/aligned-rep-seqs_quality.qza \
   --o-masked-alignment /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_6_Tree/masked-aligned-rep-seqs_quality.qza \
   --o-tree /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_6_Tree/unrooted-tree_quality.qza \
   --o-rooted-tree /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_6_Tree/rooted-tree_quality.qza

##### Metrics

qiime diversity core-metrics-phylogenetic \
   --i-phylogeny /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_6_Tree/rooted-tree_quality.qza \
   --i-table /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_4_DADA2/no-miss-table-dada2.qza \
   --p-sampling-depth 1000 \
   --m-metadata-file /gpfs/scratch/wub02/projects/msq90.msq91.run/map/MSQ.90.MSQ.91.Map.qiime2.txt \
   --output-dir /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_7_core_metrics

##### Taxonomy 99%

# 99% Taxanomoy from straight DADA2

qiime feature-classifier classify-sklearn \
   --i-classifier /gpfs/scratch/wub02/projects/msq90.msq91.run/greengenes/99_classifier.qza \
   --i-reads /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_4_DADA2/hits_quality.qza \
   --o-classification /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_8_taxonomy/taxonomy.qza

qiime taxa barplot \
  --i-table /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_4_DADA2/no-miss-table-dada2.qza \
  --i-taxonomy /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_8_taxonomy/taxonomy.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/msq90.msq91.run/map/MSQ.90.MSQ.91.Map.qiime2.txt \
  --o-visualization /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_8_taxonomy/taxa-bar-plots_norev_quality.qzv

#### Alpha diversity 

qiime diversity alpha-rarefaction \
  --i-table /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_4_DADA2/no-miss-table-dada2.qza \
  --i-phylogeny /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_6_Tree/rooted-tree_quality.qza \
  --p-max-depth 1000 \
  --m-metadata-file /gpfs/scratch/wub02/projects/msq90.msq91.run/map/MSQ.90.MSQ.91.Map.qiime2.txt \
  --o-visualization /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_7_core_metrics/alpha-rarefaction.qzv

qiime diversity alpha-group-significance \
  --i-alpha-diversity /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_7_core_metrics/faith_pd_vector.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/msq90.msq91.run/map/MSQ.90.MSQ.91.Map.qiime2.txt \
  --o-visualization /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_7_core_metrics/faith_pd_vector.qzv

qiime diversity alpha-group-significance \
  --i-alpha-diversity /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_7_core_metrics/evenness_vector.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/msq90.msq91.run/map/MSQ.90.MSQ.91.Map.qiime2.txt \
  --o-visualization /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_7_core_metrics/evenness_vector.qzv

qiime diversity alpha-group-significance \
  --i-alpha-diversity /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_7_core_metrics/shannon_vector.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/msq90.msq91.run/map/MSQ.90.MSQ.91.Map.qiime2.txt \
  --o-visualization /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_7_core_metrics/shannon_vector.qzv

qiime diversity alpha-group-significance \
  --i-alpha-diversity /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_7_core_metrics/observed_otus_vector.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/msq90.msq91.run/map/MSQ.90.MSQ.91.Map.qiime2.txt \
  --o-visualization /gpfs/scratch/wub02/projects/msq90.msq91.run/QIIME2_7_core_metrics/observed_otus_vector.qzv
