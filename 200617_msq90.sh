#!/bin/bash
#SBATCH --job-name=MSQ90.QIIME2.2020.02							# Job name
#SBATCH --mail-type=BEGIN,END,FAIL       						# Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=benjamin.wu@nyumc.org					        # Where to send mail
#SBATCH --ntasks=32                    							# Run on a single CPU
#SBATCH --mem=128gb                     						# Job memory request
#SBATCH --output=serial_test_%j.log   							# Standard output and error log
#SBATCH --time=72:00:00									#time


### June 17, 2020 
### MSQ 90 
### QIIME2.2020.02 
### Code QIIME2 Import 
### Manifest 

module purge; module load anaconda3/cpu/5.3.1
unset PYTHONPATH; source activate qiime2-2020.2
module load slurm

##### /gpfs/scratch/wub02/projects/
##### mkdir msq90.run
##### mkdir msq90.run/QIIME2_2_import
##### mkdir msq90.run/QIIME2_3_demux
##### mkdir msq90.run/QIIME2_4_DADA2
##### mkdir msq90.run/QIIME2_6_Tree
##### mkdir msq90.run/QIIME2_7_core_metrics
##### mkdir msq90.run/QIIME2_8_taxonomy
##### /gpfs/home/wub02/projects/msq90.run
##### /gpfs/scratch/wub02/projects/msq90.run/map

##### Creating Assembly/Classifiers for 2020.02
##### /gpfs/scratch/wub02/projects/milan.elastase.run/gg_13_8_otus

# cd /gpfs/scratch/wub02/projects/
# mkdir msq90.run
# mkdir msq90.run/QIIME2_2_import
# mkdir msq90.run/QIIME2_3_demux
# mkdir msq90.run/QIIME2_4_DADA2
# mkdir msq90.run/QIIME2_6_Tree
# mkdir msq90.run/QIIME2_8_taxonomy
# mkdir msq90.run/map
# mkdir msq90.run/fastq
# mkdir msq90.run/greengenes

# /gpfs/scratch/wub02/projects/msq109.run/map/MSQ.90.Map.qiime2.txt

# cp /gpfs/data/sequence/results/segallab/2019-02-01/fastq/lane1_S1_L001_I1_001.fastq.gz /gpfs/scratch/wub02/projects/msq90.run/QIIME2_2_import/barcodes.fastq.gz
# cp /gpfs/data/sequence/results/segallab/2019-02-01/fastq/lane1_S1_L001_R1_001.fastq.gz /gpfs/scratch/wub02/projects/msq90.run/QIIME2_2_import/forward.fastq.gz
# cp /gpfs/data/sequence/results/segallab/2019-02-01/fastq/lane1_S1_L001_R2_001.fastq.gz /gpfs/scratch/wub02/projects/msq90.run/QIIME2_2_import/reverse.fastq.gz

ln -s /gpfs/data/sequence/results/segallab/2019-02-01/fastq/lane1_S1_L001_I1_001.fastq.gz /gpfs/scratch/wub02/projects/msq90.run/symlink/barcodes.fastq.gz
ln -s /gpfs/data/sequence/results/segallab/2019-02-01/fastq/lane1_S1_L001_R1_001.fastq.gz /gpfs/scratch/wub02/projects/msq90.run/symlink/forward.fastq.gz
ln -s /gpfs/data/sequence/results/segallab/2019-02-01/fastq/lane1_S1_L001_R2_001.fastq.gz /gpfs/scratch/wub02/projects/msq90.run/symlink/reverse.fastq.gz


qiime tools import \
  --type EMPPairedEndSequences \
  --input-path /gpfs/scratch/wub02/projects/msq90.run/symlink \
  --output-path /gpfs/scratch/wub02/projects/msq90.run/QIIME2_3_demux/emp-paired-end-sequences.qza

qiime demux emp-paired \
  --i-seqs /gpfs/scratch/wub02/projects/msq90.run/QIIME2_3_demux/emp-paired-end-sequences.qza \
  --m-barcodes-file /gpfs/scratch/wub02/projects/msq90.run/map/MSQ.90.Map.qiime2.txt \
  --m-barcodes-column BarcodeSequence \
  --o-per-sample-sequences /gpfs/scratch/wub02/projects/msq90.run/QIIME2_3_demux/demux.qza \
  --p-rev-comp-mapping-barcodes \
  --o-error-correction-details /gpfs/scratch/wub02/projects/msq90.run/QIIME2_3_demux/demux-details.qza

qiime demux summarize \
  --i-data /gpfs/scratch/wub02/projects/msq90.run/QIIME2_3_demux/demux.qza \
  --o-visualization /gpfs/scratch/wub02/projects/msq90.run/QIIME2_3_demux/demux.qzv


### Build classifier


V4 repeat 

qiime tools import \
  --type 'FeatureData[Sequence]' \
  --input-path /gpfs/scratch/wub02/projects/milan.elastase.run/gg_13_8_otus/rep_set/99_otus.fasta \
  --output-path /gpfs/scratch/wub02/projects/msq90.run/greengenes/99_otus.qza

qiime tools import \
  --type 'FeatureData[Taxonomy]' \
  --input-format HeaderlessTSVTaxonomyFormat \
  --input-path /gpfs/scratch/wub02/projects/milan.elastase.run/gg_13_8_otus/taxonomy/99_otu_taxonomy.txt \
  --output-path /gpfs/scratch/wub02/projects/msq90.run/greengenes/99_ref-taxonomy.qza

qiime feature-classifier extract-reads \
  --i-sequences /gpfs/scratch/wub02/projects/msq90.run/greengenes/99_otus.qza \
  --p-f-primer GTGYCAGCMGCCGCGGTAA \
  --p-r-primer GGACTACNVGGGTWTCTAAT \
  --p-trunc-len 0 \
  --p-min-length 30 \
  --o-reads /gpfs/scratch/wub02/projects/msq90.run/greengenes/99_ref-seqs.qza

qiime feature-classifier fit-classifier-naive-bayes \
  --i-reference-reads /gpfs/scratch/wub02/projects/msq90.run/greengenes/99_ref-seqs.qza \
  --i-reference-taxonomy /gpfs/scratch/wub02/projects/msq90.run/greengenes/99_ref-taxonomy.qza \
  --o-classifier /gpfs/scratch/wub02/projects/msq90.run/greengenes/99_classifier.qza

qiime feature-classifier classify-sklearn \
  --i-classifier /gpfs/scratch/wub02/projects/msq90.run/greengenes/99_classifier.qza \
  --i-reads /gpfs/scratch/wub02/projects/msq90.run/greengenes/99_ref-seqs.qza \
  --o-classification /gpfs/scratch/wub02/projects/msq90.run/greengenes/99_taxonomy.qza

### DADA2

qiime dada2 denoise-paired \
  --i-demultiplexed-seqs /gpfs/scratch/wub02/projects/msq90.run/QIIME2_3_demux/demux.qza \
  --p-trim-left-f 13 \
  --p-trim-left-r 13 \
  --p-trunc-len-f 145 \
  --p-trunc-len-r 145 \
  --p-n-threads 0 \
  --o-table /gpfs/scratch/wub02/projects/msq90.run/QIIME2_4_DADA2/table.qza \
  --o-representative-sequences /gpfs/scratch/wub02/projects/msq90.run/QIIME2_4_DADA2/rep-seqs.qza \
  --o-denoising-stats /gpfs/scratch/wub02/projects/msq90.run/QIIME2_4_DADA2/denoising-stats.qza

qiime feature-table summarize \
  --i-table /gpfs/scratch/wub02/projects/msq90.run/QIIME2_4_DADA2/table.qza \
  --o-visualization /gpfs/scratch/wub02/projects/msq90.run/QIIME2_4_DADA2/table.qzv \
  --m-sample-metadata-file /gpfs/scratch/wub02/projects/msq90.run/map/MSQ.90.Map.qiime2.txt

qiime feature-table tabulate-seqs \
  --i-data /gpfs/scratch/wub02/projects/msq90.run/QIIME2_4_DADA2/rep-seqs.qza \
  --o-visualization /gpfs/scratch/wub02/projects/msq90.run/QIIME2_4_DADA2/rep-seqs.qzv

qiime metadata tabulate \
  --m-input-file /gpfs/scratch/wub02/projects/msq90.run/QIIME2_4_DADA2/denoising-stats.qza \
  --o-visualization /gpfs/scratch/wub02/projects/msq90.run/QIIME2_4_DADA2/denoising-stats.qzv

### Quality filter 

qiime quality-control exclude-seqs \
  --i-query-sequences  /gpfs/scratch/wub02/projects/msq90.run/QIIME2_4_DADA2/rep-seqs.qza \
  --i-reference-sequences /gpfs/scratch/wub02/projects/msq90.run/greengenes/99_otus.qza \
  --p-method vsearch \
  --p-perc-identity 0.99 \
  --p-perc-query-aligned 0.99 \
  --p-threads 16 \
  --o-sequence-hits /gpfs/scratch/wub02/projects/msq90.run/QIIME2_4_DADA2/hits_quality.qza \
  --o-sequence-misses /gpfs/scratch/wub02/projects/msq90.run/QIIME2_4_DADA2/misses_quality.qza \
  --verbose

qiime feature-table filter-features \
  --i-table /gpfs/scratch/wub02/projects/msq90.run/QIIME2_4_DADA2/table.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/msq90.run/QIIME2_4_DADA2/misses_quality.qza \
  --o-filtered-table /gpfs/scratch/wub02/projects/msq90.run/QIIME2_4_DADA2/no-miss-table-dada2.qza \
  --p-exclude-ids

qiime feature-table summarize \
  --i-table /gpfs/scratch/wub02/projects/msq90.run/QIIME2_4_DADA2/no-miss-table-dada2.qza \
  --o-visualization /gpfs/scratch/wub02/projects/msq90.run/QIIME2_4_DADA2/no-miss-table-dada2.qzv \
  --m-sample-metadata-file /gpfs/scratch/wub02/projects/msq90.run/map/MSQ.90.Map.qiime2.txt

qiime feature-table tabulate-seqs \
  --i-data /gpfs/scratch/wub02/projects/msq90.run/QIIME2_4_DADA2/hits_quality.qza \
  --o-visualization /gpfs/scratch/wub02/projects/msq90.run/QIIME2_4_DADA2/hits_quality.qzv

#####
#####
#####
#####
#####

##### Tree

qiime phylogeny align-to-tree-mafft-fasttree \
  --i-sequences /gpfs/scratch/wub02/projects/msq90.run/QIIME2_4_DADA2/hits_quality.qza \
  --o-alignment /gpfs/scratch/wub02/projects/msq90.run/QIIME2_6_Tree/aligned-rep-seqs_quality.qza \
  --o-masked-alignment /gpfs/scratch/wub02/projects/msq90.run/QIIME2_6_Tree/masked-aligned-rep-seqs_quality.qza \
  --o-tree /gpfs/scratch/wub02/projects/msq90.run/QIIME2_6_Tree/unrooted-tree_quality.qza \
  --o-rooted-tree /gpfs/scratch/wub02/projects/msq90.run/QIIME2_6_Tree/rooted-tree_quality.qza

##### Metrics

qiime diversity core-metrics-phylogenetic \
  --i-phylogeny /gpfs/scratch/wub02/projects/msq90.run/QIIME2_6_Tree/rooted-tree_quality.qza \
  --i-table /gpfs/scratch/wub02/projects/msq90.run/QIIME2_4_DADA2/no-miss-table-dada2.qza \
  --p-sampling-depth 1000 \
  --m-metadata-file /gpfs/scratch/wub02/projects/msq90.run/map/MSQ.90.Map.qiime2.txt \
  --output-dir /gpfs/scratch/wub02/projects/msq90.run/QIIME2_7_core_metrics

##### Taxonomy 99%

# 99% Taxanomoy from straight DADA2

qiime feature-classifier classify-sklearn \
  --i-classifier /gpfs/scratch/wub02/projects/msq90.run/greengenes/99_classifier.qza \
  --i-reads /gpfs/scratch/wub02/projects/msq90.run/QIIME2_4_DADA2/hits_quality.qza \
  --o-classification /gpfs/scratch/wub02/projects/msq90.run/QIIME2_8_taxonomy/taxonomy.qza

qiime taxa barplot \
  --i-table /gpfs/scratch/wub02/projects/msq90.run/QIIME2_4_DADA2/no-miss-table-dada2.qza \
  --i-taxonomy /gpfs/scratch/wub02/projects/msq90.run/QIIME2_8_taxonomy/taxonomy.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/msq90.run/map/MSQ.109.Map.txt \
  --o-visualization /gpfs/scratch/wub02/projects/msq90.run/QIIME2_8_taxonomy/taxa-bar-plots_norev_quality.qzv

#### Alpha diversity 

qiime diversity alpha-rarefaction \
  --i-table /gpfs/scratch/wub02/projects/msq90.run/QIIME2_4_DADA2/no-miss-table-dada2.qza \
  --i-phylogeny /gpfs/scratch/wub02/projects/msq90.run/QIIME2_6_Tree/rooted-tree_quality.qza \
  --p-max-depth 1000 \
  --m-metadata-file /gpfs/scratch/wub02/projects/msq90.run/map/MSQ.109.Map.txt \
  --o-visualization /gpfs/scratch/wub02/projects/msq90.run/QIIME2_7_core_metrics/alpha-rarefaction.qzv

qiime diversity alpha-group-significance \
  --i-alpha-diversity /gpfs/scratch/wub02/projects/msq90.run/QIIME2_7_core_metrics/faith_pd_vector.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/msq90.run/map/MSQ.109.Map.txt \
  --o-visualization /gpfs/scratch/wub02/projects/msq90.run/QIIME2_7_core_metrics/faith_pd_vector.qzv

qiime diversity alpha-group-significance \
  --i-alpha-diversity /gpfs/scratch/wub02/projects/msq90.run/QIIME2_7_core_metrics/evenness_vector.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/msq90.run/map/MSQ.109.Map.txt \
  --o-visualization /gpfs/scratch/wub02/projects/msq90.run/QIIME2_7_core_metrics/evenness_vector.qzv

qiime diversity alpha-group-significance \
  --i-alpha-diversity /gpfs/scratch/wub02/projects/msq90.run/QIIME2_7_core_metrics/shannon_vector.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/msq90.run/map/MSQ.109.Map.txt \
  --o-visualization /gpfs/scratch/wub02/projects/msq90.run/QIIME2_7_core_metrics/shannon_vector.qzv

qiime diversity alpha-group-significance \
  --i-alpha-diversity /gpfs/scratch/wub02/projects/msq90.run/QIIME2_7_core_metrics/observed_otus_vector.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/msq90.run/map/MSQ.109.Map.txt \
  --o-visualization /gpfs/scratch/wub02/projects/msq90.run/QIIME2_7_core_metrics/observed_otus_vector.qzv
