#!/bin/bash
#SBATCH --job-name=Milan.Elastase.Experiment.updated.map				# Job name
#SBATCH --mail-type=BEGIN,END,FAIL       						# Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=benjamin.wu@nyumc.org,martina.oriano@unimi.it,stefano.aliberti@unimi.it        # Where to send mail
#SBATCH --ntasks=16                    							# Run on a single CPU
#SBATCH --mem=64gb                     							# Job memory request
#SBATCH --output=serial_test_%j.log   							# Standard output and error log
#SBATCH --time=10:00:00									#time


# iconv -t UTF-8 -f ISO-8859-1 /gpfs/scratch/wub02/projects/milan.elastase.run/map/BX_sputum_convert.txt > /gpfs/scratch/wub02/projects/milan.elastase.run/map/BX_sputum_convert.txt
# file -I out.txt
# out.txt: text/plain; charset=utf-8
# qiime metadata tabulate --m-input-file out.txt --o-visualization mapping_skinABiL.qzv


### November 11, 2019 Tuesday 
### Code QIIME2 Import 
### Manifest 

#####
#####
#####

# Moving all sequences 

# Sequences come out of Illumina already de-multiplexed
# Need to put them into one folder to import in QIIME2
# (forward and reverse samples are in two samples; in individual folders) 
# This should move everything into the 

# Make the "target" folder
# mkdir ../target
# mv */* ../target/

# This should move all files "*" into "target" folder - this should be where you input the manifest 

#####
#####
#####

# Forward primers
# TCGTCGGCAGCGTCAGATGTGTATAAGAGACAG

# Reverse primers
# GTCTCGTGGGCTCGGAGATGTGTATAAGAGACAG


# CCTACGGGNGGCWGCAG
# GACTACHVGGGTATCTAATCC

# mkdir 

# mkdir QIIME2_2_import
# mkdir QIIME2_3_demux
# mkdir QIIME2_4_DADA2
# mkdir QIIME2_6_Tree
# mkdir QIIME2_7_core_metrics
# mkdir QIIME2_8_taxonomy

#####
#####
#####

module add miniconda3/4.6.14
source activate qiime2-2019.10

##### Feature classifiers ###### 
# V4 repeat 

# qiime tools import \
#   --type 'FeatureData[Sequence]' \
#   --input-path /gpfs/scratch/wub02/projects/milan.elastase.run/gg_13_8_otus/rep_set/99_otus.fasta \
#   --output-path /gpfs/scratch/wub02/projects/milan.elastase.run/greengenes/99_otus.qza

# qiime tools import \
#   --type 'FeatureData[Taxonomy]' \
#   --input-format HeaderlessTSVTaxonomyFormat \
#   --input-path /gpfs/scratch/wub02/projects/milan.elastase.run/gg_13_8_otus/taxonomy/99_otu_taxonomy.txt \
#   --output-path /gpfs/scratch/wub02/projects/milan.elastase.run/greengenes/99_ref-taxonomy.qza

# qiime feature-classifier extract-reads \
#  --i-sequences /gpfs/scratch/wub02/projects/milan.elastase.run/greengenes/99_otus.qza \
#  --p-f-primer CCTACGGGNGGCWGCAG \
#  --p-r-primer GACTACHVGGGTATCTAATCC \
#  --p-trunc-len 0 \
#  --p-min-length 30 \
#  --o-reads /gpfs/scratch/wub02/projects/milan.elastase.run/greengenes/99_ref-seqs.qza

# qiime feature-classifier fit-classifier-naive-bayes \
#   --i-reference-reads /gpfs/scratch/wub02/projects/milan.elastase.run/greengenes/99_ref-seqs.qza \
#   --i-reference-taxonomy /gpfs/scratch/wub02/projects/milan.elastase.run/greengenes/99_ref-taxonomy.qza \
#   --o-classifier /gpfs/scratch/wub02/projects/milan.elastase.run/greengenes/99_classifier.qza

# qiime feature-classifier classify-sklearn \
#   --i-classifier /gpfs/scratch/wub02/projects/milan.elastase.run/greengenes/99_classifier.qza \
#   --i-reads /gpfs/scratch/wub02/projects/milan.elastase.run/greengenes/99_ref-seqs.qza\
#   --o-classification /gpfs/scratch/wub02/projects/milan.elastase.run/greengenes/99_taxonomy.qza

# qiime tools import \
#  --type 'SampleData[PairedEndSequencesWithQuality]' \
#  --input-path /gpfs/scratch/wub02/projects/milan.elastase.run/fastq/manifest.txt \
#  --output-path /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_2_import/paired-end-demux.qza \
#  --input-format PairedEndFastqManifestPhred33V2

# qiime demux summarize \
#  --i-data /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_2_import/paired-end-demux.qza \
#  --o-visualization /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_2_import/paired-end-demux.qzv

### DADA2

# qiime dada2 denoise-paired \
#  --i-demultiplexed-seqs /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_2_import/paired-end-demux.qza \
#  --p-trim-left-f 13 \
#  --p-trim-left-r 13 \
#  --p-trunc-len-f 270 \
#  --p-trunc-len-r 270 \
#  --p-n-threads 0 \
#  --o-table /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_4_DADA2/table.qza \
#  --o-representative-sequences /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_4_DADA2/rep-seqs.qza \
#  --o-denoising-stats /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_4_DADA2/denoising-stats.qza

qiime feature-table summarize \
  --i-table /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_4_DADA2/table.qza \
  --o-visualization /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_4_DADA2/table.qzv \
  --m-sample-metadata-file /gpfs/scratch/wub02/projects/milan.elastase.run/map/BX_Sputum_convert.txt

qiime feature-table tabulate-seqs \
  --i-data /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_4_DADA2/rep-seqs.qza \
  --o-visualization /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_4_DADA2/rep-seqs.qzv

qiime metadata tabulate \
  --m-input-file /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_4_DADA2/denoising-stats.qza \
  --o-visualization /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_4_DADA2/denoising-stats.qzv

### Quality filter 

# qiime quality-control exclude-seqs \
#  --i-query-sequences  /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_4_DADA2/rep-seqs_norev.qza \
#  --i-reference-sequences /gpfs/scratch/wub02/projects/milan.elastase.run/greengenes/99_otus.qza \
#  --p-method vsearch \
#  --p-perc-identity 0.99 \
#  --p-perc-query-aligned 0.99 \
#  --p-threads 16 \
#  --o-sequence-hits /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_4_DADA2/hits_quality.qza \
#  --o-sequence-misses /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_4_DADA2/misses_quality.qza \
#  --verbose

# qiime feature-table filter-features \
#  --i-table /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_4_DADA2/table.qza \
#  --m-metadata-file /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_4_DADA2/misses_quality.qza \
#  --o-filtered-table /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_4_DADA2/no-miss-table-dada2.qza \
#  --p-exclude-ids

qiime feature-table summarize \
  --i-table /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_4_DADA2/no-miss-table-dada2.qza \
  --o-visualization /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_4_DADA2/no-miss-table-dada2.qzv \
  --m-sample-metadata-file /gpfs/scratch/wub02/projects/milan.elastase.run/map/BX_Sputum_convert.txt

qiime feature-table tabulate-seqs \
  --i-data /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_4_DADA2/hits_quality.qza \
  --o-visualization /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_4_DADA2/hits_quality.qzv

#####
#####
#####
#####
#####

##### Tree

qiime phylogeny align-to-tree-mafft-fasttree \
  --i-sequences /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_4_DADA2/hits_quality.qza \
  --o-alignment /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_6_Tree/aligned-rep-seqs_quality.qza \
  --o-masked-alignment /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_6_Tree/masked-aligned-rep-seqs_quality.qza \
  --o-tree /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_6_Tree/unrooted-tree_quality.qza \
  --o-rooted-tree /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_6_Tree/rooted-tree_quality.qza

##### Metrics

qiime diversity core-metrics-phylogenetic \
  --i-phylogeny /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_6_Tree/rooted-tree_quality.qza \
  --i-table /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_4_DADA2/no-miss-table-dada2_norev.qza \
  --p-sampling-depth 1000 \
  --m-metadata-file /gpfs/scratch/wub02/projects/milan.elastase.run/map/BX_Sputum_convert.txt  \
  --output-dir /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_7_core_metrics

##### Taxonomy 99%

# 99% Taxanomoy from straight DADA2

qiime feature-classifier classify-sklearn \
  --i-classifier /gpfs/scratch/wub02/projects/milan.elastase.run/greengenes/99_classifier.qza \
  --i-reads /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_4_DADA2/hits_quality.qza \
  --o-classification /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_8_taxonomy/taxonomy.qza

qiime taxa barplot \
  --i-table /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_4_DADA2/no-miss-table-dada2.qza \
  --i-taxonomy /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_8_taxonomy/taxonomy.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/milan.elastase.run/map/BX_Sputum_convert.txt \
  --o-visualization /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_8_taxonomy/taxa-bar-plots_norev_quality.qzv

#### Alpha diversity 

qiime diversity alpha-rarefaction \
  --i-table /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_4_DADA2/no-miss-table-dada2.qza \
  --i-phylogeny /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_6_Tree/rooted-tree_quality.qza \
  --p-max-depth 1000 \
  --m-metadata-file /gpfs/scratch/wub02/projects/milan.elastase.run/map/BX_Sputum_convert.txt \
  --o-visualization /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_7_core_metrics/alpha-rarefaction.qzv

qiime diversity alpha-group-significance \
  --i-alpha-diversity /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_7_core_metrics_norev_qualitys/faith_pd_vector.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/milan.elastase.run/map/BX_Sputum_convert.txt \
  --o-visualization /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_7_core_metrics/faith_pd_vector.qzv

qiime diversity alpha-group-significance \
  --i-alpha-diversity /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_7_core_metrics_norev_quality/evenness_vector.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/milan.elastase.run/map/BX_Sputum_convert.txt \
  --o-visualization /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_7_core_metrics/evenness_vector.qzv

qiime diversity alpha-group-significance \
  --i-alpha-diversity /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_7_core_metrics_norev_quality/shannon_vector.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/milan.elastase.run/map/BX_Sputum_convert.txt \
  --o-visualization /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_7_core_metrics/shannon_vector.qzv

qiime diversity alpha-group-significance \
  --i-alpha-diversity /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_7_core_metrics_norev_quality/observed_otus_vector.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/milan.elastase.run/map/BX_Sputum_convert.txt \
  --o-visualization /gpfs/scratch/wub02/projects/milan.elastase.run/QIIME2_7_core_metrics/observed_otus_vector.qzv
