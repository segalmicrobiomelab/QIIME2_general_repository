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

### cd /gpfs/scratch/wub02/projects/SRA/niosh
### mkdir merge
### cd /gpfs/scratch/wub02/projects/SRA/niosh/merge
### mkdir QIIME2_2_import
### mkdir QIIME2_3_demux
### mkdir QIIME2_4_DADA2
### mkdir QIIME2_6_Tree
### mkdir QIIME2_7_core_metrics
### mkdir QIIME2_8_taxonomy


### qiime feature-table merge \
###   --i-tables /gpfs/scratch/wub02/projects/SRA/niosh/MSQ5/QIIME2_4_DADA2/table.qza  \
###   --i-tables /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12/QIIME2_4_DADA2/table.qza \
###   --i-tables /gpfs/scratch/wub02/projects/SRA/niosh/MSQ44/QIIME2_4_DADA2/table.qza \
###   --i-tables /gpfs/scratch/wub02/projects/SRA/niosh/MSQ45/QIIME2_4_DADA2/table.qza \
###   --i-tables /gpfs/scratch/wub02/projects/SRA/niosh/MSQ46/QIIME2_4_DADA2/table.qza \
###   --i-tables /gpfs/scratch/wub02/projects/SRA/niosh/MSQ47/QIIME2_4_DADA2/table.qza \
###   --i-tables /gpfs/scratch/wub02/projects/SRA/niosh/MSQ48/QIIME2_4_DADA2/table.qza \
###   --i-tables /gpfs/scratch/wub02/projects/SRA/niosh/MSQ49/QIIME2_4_DADA2/table.qza \
###   --i-tables /gpfs/scratch/wub02/projects/SRA/niosh/MSQ50/QIIME2_4_DADA2/table.qza \
###   --o-merged-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/table.qza

### qiime feature-table merge-seqs \
###   --i-data /gpfs/scratch/wub02/projects/SRA/niosh/MSQ5/QIIME2_4_DADA2/rep-seqs.qza \
###   --i-data /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12/QIIME2_4_DADA2/rep-seqs.qza \
###   --i-data /gpfs/scratch/wub02/projects/SRA/niosh/MSQ44/QIIME2_4_DADA2/rep-seqs.qza \
###   --i-data /gpfs/scratch/wub02/projects/SRA/niosh/MSQ45/QIIME2_4_DADA2/rep-seqs.qza \
###   --i-data /gpfs/scratch/wub02/projects/SRA/niosh/MSQ46/QIIME2_4_DADA2/rep-seqs.qza \
###   --i-data /gpfs/scratch/wub02/projects/SRA/niosh/MSQ47/QIIME2_4_DADA2/rep-seqs.qza \
###   --i-data /gpfs/scratch/wub02/projects/SRA/niosh/MSQ48/QIIME2_4_DADA2/rep-seqs.qza \
###   --i-data /gpfs/scratch/wub02/projects/SRA/niosh/MSQ49/QIIME2_4_DADA2/rep-seqs.qza \
###   --i-data /gpfs/scratch/wub02/projects/SRA/niosh/MSQ50/QIIME2_4_DADA2/rep-seqs.qza \
###   --o-merged-data  /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/rep-seqs.qza

### qiime feature-table summarize \
###   --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/table.qza \
###   --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/table.qzv \
###   --m-sample-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.NIOSH.txt

### qiime feature-table tabulate-seqs \
###   --i-data /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/rep-seqs.qza \
###   --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/rep-seqs.qzv

### Quality filter 

### qiime quality-control exclude-seqs \
###    --i-query-sequences  /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/rep-seqs.qza \
###    --i-reference-sequences /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/99_otus.qza \
###    --p-method vsearch \
###    --p-perc-identity 0.99 \
###    --p-perc-query-aligned 0.99 \
###    --p-threads 16 \
###    --o-sequence-hits /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/hits_quality.qza \
###    --o-sequence-misses /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/misses_quality.qza \
###    --verbose

### qiime feature-table filter-features \
###    --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/table.qza \
###    --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/misses_quality.qza \
###    --o-filtered-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/no-miss-table.qza \
###    --p-exclude-ids

### qiime feature-table summarize \
###   --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/no-miss-table.qza \
###   --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/no-miss-table.qzv \
###   --m-sample-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.NIOSH.txt

### qiime feature-table tabulate-seqs \
###   --i-data /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/hits_quality.qza  \
###   --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/hits_quality.qzv

##### Feature classifiers ###### 
# V4 repeat 97% Classifier Greengenes 

qiime tools import \
   --type 'FeatureData[Sequence]' \
   --input-path /gpfs/scratch/wub02/projects/milan.elastase.run/gg_13_8_otus/rep_set/97_otus.fasta \
   --output-path /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/97_otus.qza

qiime tools import \
   --type 'FeatureData[Taxonomy]' \
   --input-format HeaderlessTSVTaxonomyFormat \
   --input-path /gpfs/scratch/wub02/projects/milan.elastase.run/gg_13_8_otus/taxonomy/97_otu_taxonomy.txt \
   --output-path /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/97_ref-taxonomy.qza

qiime feature-classifier extract-reads \
  --i-sequences /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/97_otus.qza \
  --p-f-primer CCTACGGGNGGCWGCAG \
  --p-r-primer GACTACHVGGGTATCTAATCC \
  --p-trunc-len 0 \
  --p-min-length 30 \
  --o-reads /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/97_ref-seqs.qza

qiime feature-classifier fit-classifier-naive-bayes \
   --i-reference-reads /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/97_ref-seqs.qza \
   --i-reference-taxonomy /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/97_ref-taxonomy.qza \
   --o-classifier /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/97_classifier.qza

##### Feature classifiers ###### 
# V4 repeat 99% Classifier SILVA 

qiime tools import \
   --type 'FeatureData[Sequence]' \
   --input-path /gpfs/scratch/wub02/projects/SRA/niosh/SILVA/SILVA_132_QIIME_release/rep_set/rep_set_16S_only/99/silva_132_99_16S.fna \
   --output-path /gpfs/scratch/wub02/projects/SRA/niosh/SILVA/99_otus_SILVA.qza

qiime tools import \
   --type 'FeatureData[Taxonomy]' \
   --input-format HeaderlessTSVTaxonomyFormat \
   --input-path /gpfs/scratch/wub02/projects/SRA/niosh/SILVA/SILVA_132_QIIME_release/taxonomy/16S_only/99/taxonomy_7_levels.txt \
   --output-path /gpfs/scratch/wub02/projects/SRA/niosh/SILVA/99_ref-taxonomy_SILVA.qza

qiime feature-classifier extract-reads \
  --i-sequences /gpfs/scratch/wub02/projects/SRA/niosh/SILVA/99_otus_SILVA.qza \
  --p-f-primer CCTACGGGNGGCWGCAG \
  --p-r-primer GACTACHVGGGTATCTAATCC \
  --p-trunc-len 0 \
  --p-min-length 30 \
  --o-reads /gpfs/scratch/wub02/projects/SRA/niosh/SILVA/99_ref-seqs_SILVA.qza

qiime feature-classifier fit-classifier-naive-bayes \
   --i-reference-reads /gpfs/scratch/wub02/projects/SRA/niosh/SILVA/99_ref-seqs_SILVA.qza \
   --i-reference-taxonomy /gpfs/scratch/wub02/projects/SRA/niosh/SILVA/99_ref-taxonomy_SILVA.qza \
   --o-classifier /gpfs/scratch/wub02/projects/SRA/niosh/SILVA/99_classifier_SILVA.qza

##### Feature classifiers ###### 
# V4 repeat 97% Classifier SILVA 

qiime tools import \
   --type 'FeatureData[Sequence]' \
   --input-path /gpfs/scratch/wub02/projects/SRA/niosh/SILVA/SILVA_132_QIIME_release/rep_set/rep_set_16S_only/97/silva_132_97_16S.fna \
   --output-path /gpfs/scratch/wub02/projects/SRA/niosh/SILVA/97_otus_SILVA.qza

qiime tools import \
   --type 'FeatureData[Taxonomy]' \
   --input-format HeaderlessTSVTaxonomyFormat \
   --input-path /gpfs/scratch/wub02/projects/SRA/niosh/SILVA/SILVA_132_QIIME_release/taxonomy/16S_only/97/taxonomy_7_levels.txt \
   --output-path /gpfs/scratch/wub02/projects/SRA/niosh/SILVA/97_ref-taxonomy_SILVA.qza

qiime feature-classifier extract-reads \
  --i-sequences /gpfs/scratch/wub02/projects/SRA/niosh/SILVA/97_otus_SILVA.qza \
  --p-f-primer CCTACGGGNGGCWGCAG \
  --p-r-primer GACTACHVGGGTATCTAATCC \
  --p-trunc-len 0 \
  --p-min-length 30 \
  --o-reads /gpfs/scratch/wub02/projects/SRA/niosh/SILVA/97_ref-seqs_SILVA.qza

qiime feature-classifier fit-classifier-naive-bayes \
   --i-reference-reads /gpfs/scratch/wub02/projects/SRA/niosh/SILVA/97_ref-seqs_SILVA.qza \
   --i-reference-taxonomy /gpfs/scratch/wub02/projects/SRA/niosh/SILVA/97_ref-taxonomy_SILVA.qza \
   --o-classifier /gpfs/scratch/wub02/projects/SRA/niosh/SILVA/97_classifier_SILVA.qza

###
###
###

qiime feature-table filter-samples \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/no-miss-table.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt \
  --o-filtered-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.no-miss-table.qza 

qiime feature-table filter-seqs
  --i-data /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/rep-seqs.qza  \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.no-miss-table.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt \
  --o-filtered-data /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs.qza 

qiime feature-table summarize \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.no-miss-table.qza \
  --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.no-miss-table.qzv  \
  --m-sample-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt

qiime feature-table tabulate-seqs \
  --i-data /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs.qza  \
  --o-visualization  /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs.qzv

### 99% Greengenes

##### Tree

qiime phylogeny align-to-tree-mafft-fasttree \
   --i-sequences /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs.qza \
   --o-alignment /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/aligned-rep-seqs.qza \
   --o-masked-alignment /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/masked-aligned-rep-seqs.qza \
   --o-tree /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/unrooted-tree.qza \
   --o-rooted-tree /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/rooted-tree.qza

##### Metrics

qiime diversity core-metrics-phylogenetic \
   --i-phylogeny /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/rooted-tree.qza \
   --i-table  /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/no-miss-table.qza \
   --p-sampling-depth 1000 \
   --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt \
   --output-dir /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_7_core_metrics.merge

### Classifier

qiime feature-classifier classify-sklearn \
  --i-classifier /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/99_classifier.qza \
  --i-reads /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/hits_quality.qza \
  --o-classification /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_8_taxonomy/99_greengenes_taxonomy.qza

qiime taxa barplot \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.no-miss-table.qza \
  --i-taxonomy /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_8_taxonomy/99_greengenes_taxonomy.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt \
  --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_8_taxonomy/taxa-bar-plots_99_greengenes.qzv

### 97% Greengenes

### Classifier

qiime feature-classifier classify-sklearn \
  --i-classifier /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/97_classifier.qza \
  --i-reads /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/hits_quality.qza \
  --o-classification /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_8_taxonomy/97_greengenes_taxonomy.qza

qiime taxa barplot \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.no-miss-table.qza \
  --i-taxonomy /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_8_taxonomy/97_greengenes_taxonomy.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt \
  --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_8_taxonomy/taxa-bar-plots_97_greengenes.qzv

### 99% SILVA

### Classifier

qiime feature-classifier classify-sklearn \
  --i-classifier /gpfs/scratch/wub02/projects/SRA/niosh/SILVA/99_classifier_SILVA.qza \
  --i-reads /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/hits_quality.qza \
  --o-classification /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_8_taxonomy/99_SILVA_taxonomy.qza

qiime taxa barplot \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.no-miss-table.qza \
  --i-taxonomy /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_8_taxonomy/99_SILVA_taxonomy.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt \
  --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_8_taxonomy/taxa-bar-plots_99_SILVA.qzv

### 97% SILVA

### Classifier

qiime feature-classifier classify-sklearn \
  --i-classifier /gpfs/scratch/wub02/projects/SRA/niosh/SILVA/97_classifier_SILVA.qza \
  --i-reads /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/hits_quality.qza \
  --o-classification /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_8_taxonomy/97_SILVA_taxonomy.qza

qiime taxa barplot \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.no-miss-table.qza \
  --i-taxonomy /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_8_taxonomy/97_SILVA_taxonomy.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt \
  --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_8_taxonomy/taxa-bar-plots_97_SILVA.qzv

###
###
###

# Open and Close Picking VSEARCH 


### Reference
### qiime feature-table summarize \
###   --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/table.qza \
###   --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/table.qzv \
###   --m-sample-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.NIOSH.txt

### qiime feature-table tabulate-seqs \
###   --i-data /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/rep-seqs.qza \
###   --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/rep-seqs.qzv

### Greengeness 

qiime vsearch cluster-features-closed-reference \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/table.qza \
  --i-sequences /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/rep-seqs.qza \
  --i-reference-sequences /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/99_otus.qza \
  --p-perc-identity 0.99 \
  --o-clustered-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/table-closed-99-greengenes.qza \
  --o-clustered-sequences /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/rep-seqs-closed-99-greengenes.qza \
  --o-unmatched-sequences /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/unmatched-closed-99-greengenes.qza

qiime vsearch cluster-features-closed-reference \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/table.qza \
  --i-sequences /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/rep-seqs.qza \
  --i-reference-sequences /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/97_otus.qza \
  --p-perc-identity 0.97 \
  --o-clustered-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/table-closed-97-greengenes.qza \
  --o-clustered-sequences /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/rep-seqs-closed-97-greengenes.qza \
  --o-unmatched-sequences /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/unmatched-closed-97-greengenes.qza

qiime vsearch cluster-features-open-reference \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/table.qza \
  --i-sequences /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/rep-seqs.qza \
  --i-reference-sequences /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/99_otus.qza \
  --p-perc-identity 0.99 \
  --o-clustered-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/table-open-99-greengenes.qza \
  --o-clustered-sequences /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/rep-seqs-open-99-greengenes.qza \
  --o-unmatched-sequences /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/unmatched-open-99-greengenes.qza

qiime vsearch cluster-features-open-reference \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/table.qza \
  --i-sequences /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/rep-seqs.qza \
  --i-reference-sequences /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/97_otus.qza \
  --p-perc-identity 0.97 \
  --o-clustered-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/table-open-97-greengenes.qza \
  --o-clustered-sequences /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/rep-seqs-open-97-greengenes.qza \
  --o-unmatched-sequences /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/unmatched-open-97-greengenes.qza

### SILVA - /gpfs/scratch/wub02/projects/SRA/niosh/SILVA/99_otus_SILVA.qza

qiime vsearch cluster-features-closed-reference \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/table.qza \
  --i-sequences /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/rep-seqs.qza \
  --i-reference-sequences /gpfs/scratch/wub02/projects/SRA/niosh/SILVA/99_otus_SILVA.qza \
  --p-perc-identity 0.99 \
  --o-clustered-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/table-closed-99-SILVA.qza \
  --o-clustered-sequences /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/rep-seqs-closed-99-SILVA.qza \
  --o-unmatched-sequences /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/unmatched-closed-99-SILVA.qza

qiime vsearch cluster-features-closed-reference \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/table.qza \
  --i-sequences /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/rep-seqs.qza \
  --i-reference-sequences /gpfs/scratch/wub02/projects/SRA/niosh/SILVA/97_otus_SILVA.qza \
  --p-perc-identity 0.97 \
  --o-clustered-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/table-closed-97-SILVA.qza \
  --o-clustered-sequences /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/rep-seqs-closed-97-SILVA.qza \
  --o-unmatched-sequences /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/unmatched-closed-97-SILVA.qza

qiime vsearch cluster-features-open-reference \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/table.qza \
  --i-sequences /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/rep-seqs.qza \
  --i-reference-sequences /gpfs/scratch/wub02/projects/SRA/niosh/SILVA/99_otus_SILVA.qza \
  --p-perc-identity 0.99 \
  --o-clustered-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/table-open-99-SILVA.qza \
  --o-clustered-sequences /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/rep-seqs-open-99-SILVA.qza \
  --o-unmatched-sequences /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/unmatched-open-99-SILVA.qza

qiime vsearch cluster-features-open-reference \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/table.qza \
  --i-sequences /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/rep-seqs.qza \
  --i-reference-sequences /gpfs/scratch/wub02/projects/SRA/niosh/SILVA/97_otus_SILVA.qza \
  --p-perc-identity 0.97 \
  --o-clustered-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/table-open-97-SILVA.qza \
  --o-clustered-sequences /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/rep-seqs-open-97-SILVA.qza \
  --o-unmatched-sequences /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/unmatched-open-97-SILVA.qza

### filter samples 

qiime feature-table filter-samples \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/table-closed-99-greengenes.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt \
  --o-filtered-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-closed-99-greengenes.qza 

qiime feature-table filter-samples \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/table-closed-97-greengenes.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt \
  --o-filtered-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-closed-97-greengenes.qza 

qiime feature-table filter-samples \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/table-open-99-greengenes.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt \
  --o-filtered-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-open-99-greengenes.qza 

qiime feature-table filter-samples \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/table-open-97-greengenes.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt \
  --o-filtered-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-open-97-greengenes.qza 

qiime feature-table filter-samples \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/table-closed-99-SILVA.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt \
  --o-filtered-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-closed-99-SILVA.qza 

qiime feature-table filter-samples \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/table-closed-97-SILVA.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt \
  --o-filtered-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-closed-97-SILVA.qza 

qiime feature-table filter-samples \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/table-open-99-SILVA.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt \
  --o-filtered-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-open-99-SILVA.qza 

qiime feature-table filter-samples \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/table-open-97-SILVA.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt \
  --o-filtered-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-open-97-SILVA.qza 

### filter seqs

qiime feature-table filter-seqs
  --i-data /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/rep-seqs-closed-99-greengenes.qza  \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-closed-99-greengenes.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt \
  --o-filtered-data /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-closed-99-greengenes.qza

qiime feature-table filter-seqs
  --i-data /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/rep-seqs-closed-97-greengenes.qza  \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-closed-97-greengenes.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt \
  --o-filtered-data /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-closed-97-greengenes.qza

qiime feature-table filter-seqs
  --i-data /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/rep-seqs-open-99-greengenes.qza  \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-open-99-greengenes.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt \
  --o-filtered-data /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-open-99-greengenes.qza

qiime feature-table filter-seqs
  --i-data /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/rep-seqs-open-97-greengenes.qza  \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-open-97-greengenes.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt \
  --o-filtered-data /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-open-97-greengenes.qza

qiime feature-table filter-seqs
  --i-data /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/rep-seqs-closed-99-SILVA.qza  \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-closed-99-SILVA.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt \
  --o-filtered-data /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-closed-99-SILVA.qza

qiime feature-table filter-seqs
  --i-data /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/rep-seqs-closed-97-SILVA.qza  \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-closed-97-SILVA.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt \
  --o-filtered-data /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-closed-97-SILVA.qza

qiime feature-table filter-seqs
  --i-data /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/rep-seqs-open-99-SILVA.qza  \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-open-99-SILVA.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt \
  --o-filtered-data /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-open-99-SILVA.qza

qiime feature-table filter-seqs
  --i-data /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/rep-seqs-open-97-SILVA.qza  \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-open-97-SILVA.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt \
  --o-filtered-data /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-open-97-SILVA.qza

###

qiime feature-table summarize \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-closed-99-greengenes.qza  \
  --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-closed-99-greengenes.qzv  \
  --m-sample-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt

qiime feature-table summarize \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-closed-97-greengenes.qza  \
  --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-closed-97-greengenes.qzv  \
  --m-sample-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt

qiime feature-table summarize \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-open-99-greengenes.qza  \
  --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-open-99-greengenes.qzv  \
  --m-sample-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt

qiime feature-table summarize \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-open-97-greengenes.qza  \
  --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-open-97-greengenes.qzv  \
  --m-sample-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt

qiime feature-table summarize \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-closed-99-SILVA.qza  \
  --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-closed-99-SILVA.qzv  \
  --m-sample-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt

qiime feature-table summarize \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-closed-97-SILVA.qza  \
  --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-closed-97-SILVA.qzv  \
  --m-sample-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt

qiime feature-table summarize \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-open-99-SILVA.qza  \
  --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-open-99-SILVA.qzv  \
  --m-sample-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt

qiime feature-table summarize \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-open-97-SILVA.qza  \
  --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-open-97-SILVA.qzv  \
  --m-sample-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt

###

qiime feature-table tabulate-seqs \
  --i-data /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-closed-99-greengenes.qza \
  --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-closed-99-greengenes.qzv

qiime feature-table tabulate-seqs \
  --i-data /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-closed-97-greengenes.qza \
  --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-closed-97-greengenes.qzv

qiime feature-table tabulate-seqs \
  --i-data /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-open-99-greengenes.qza \
  --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-open-99-greengenes.qzv

qiime feature-table tabulate-seqs \
  --i-data /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-open-97-greengenes.qza \
  --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-open-97-greengenes.qzv

qiime feature-table tabulate-seqs \
  --i-data /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-closed-99-SILVA.qza \
  --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-closed-99-SILVA.qzv

qiime feature-table tabulate-seqs \
  --i-data /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-closed-97-SILVA.qza \
  --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-closed-97-SILVA.qzv

qiime feature-table tabulate-seqs \
  --i-data /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-open-99-SILVA.qza \
  --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-open-99-SILVA.qzv

qiime feature-table tabulate-seqs \
  --i-data /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-open-97-SILVA.qza \
  --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-open-97-SILVA.qzv

### 99% Greengenes

##### Tree

qiime phylogeny align-to-tree-mafft-fasttree \
   --i-sequences /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-closed-99-greengenes.qza \
   --o-alignment /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/greengenes-closed-99-aligned-rep-seqs.qza \
   --o-masked-alignment /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/greengenes-closed-99-masked-aligned-rep-seqs.qza \
   --o-tree /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/greengenes-closed-99-unrooted-tree.qza \
   --o-rooted-tree /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/greengenes-closed-99-rooted-tree.qza

qiime phylogeny align-to-tree-mafft-fasttree \
   --i-sequences /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-closed-97-greengenes.qza \
   --o-alignment /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/greengenes-closed-97-aligned-rep-seqs.qza \
   --o-masked-alignment /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/greengenes-closed-97-masked-aligned-rep-seqs.qza \
   --o-tree /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/greengenes-closed-97-unrooted-tree.qza \
   --o-rooted-tree /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/greengenes-closed-97-rooted-tree.qza

qiime phylogeny align-to-tree-mafft-fasttree \
   --i-sequences /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-open-99-greengenes.qza \
   --o-alignment /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/greengenes-open-99-aligned-rep-seqs.qza \
   --o-masked-alignment /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/greengenes-open-99-masked-aligned-rep-seqs.qza \
   --o-tree /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/greengenes-open-99-unrooted-tree.qza \
   --o-rooted-tree /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/greengenes-open-99-rooted-tree.qza

qiime phylogeny align-to-tree-mafft-fasttree \
   --i-sequences /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-open-97-greengenes.qza \
   --o-alignment /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/greengenes-open-97-aligned-rep-seqs.qza \
   --o-masked-alignment /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/greengenes-open-97-masked-aligned-rep-seqs.qza \
   --o-tree /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/greengenes-open-97-unrooted-tree.qza \
   --o-rooted-tree /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/greengenes-open-97-rooted-tree.qza

qiime phylogeny align-to-tree-mafft-fasttree \
   --i-sequences /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-closed-99-SILVA.qza \
   --o-alignment /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/SILVA-closed-99-aligned-rep-seqs.qza \
   --o-masked-alignment /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/SILVA-closed-99-masked-aligned-rep-seqs.qza \
   --o-tree /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/SILVA-closed-99-unrooted-tree.qza \
   --o-rooted-tree /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/SILVA-closed-99-rooted-tree.qza

qiime phylogeny align-to-tree-mafft-fasttree \
   --i-sequences /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-closed-97-SILVA.qza \
   --o-alignment /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/SILVA-closed-97-aligned-rep-seqs.qza \
   --o-masked-alignment /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/SILVA-closed-97-masked-aligned-rep-seqs.qza \
   --o-tree /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/SILVA-closed-97-unrooted-tree.qza \
   --o-rooted-tree /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/SILVA-closed-97-rooted-tree.qza

qiime phylogeny align-to-tree-mafft-fasttree \
   --i-sequences /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-open-99-SILVA.qza \
   --o-alignment /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/SILVA-open-99-aligned-rep-seqs.qza \
   --o-masked-alignment /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/SILVA-open-99-masked-aligned-rep-seqs.qza \
   --o-tree /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/SILVA-open-99-unrooted-tree.qza \
   --o-rooted-tree /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/SILVA-open-99-rooted-tree.qza

qiime phylogeny align-to-tree-mafft-fasttree \
   --i-sequences /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-open-97-SILVA.qza \
   --o-alignment /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/SILVA-open-97-aligned-rep-seqs.qza \
   --o-masked-alignment /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/SILVA-open-97-masked-aligned-rep-seqs.qza \
   --o-tree /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/SILVA-open-97-unrooted-tree.qza \
   --o-rooted-tree /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/SILVA-open-97-rooted-tree.qza

##### Metrics

qiime diversity core-metrics-phylogenetic \
   --i-phylogeny /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/greengenes-closed-99-rooted-tree.qza \
   --i-table  /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-closed-99-greengenes.qza \
   --p-sampling-depth 1000 \
   --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt \
   --output-dir /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_7_core_metrics.merge.99.closed.greengenes

qiime diversity core-metrics-phylogenetic \
   --i-phylogeny /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/greengenes-closed-97-rooted-tree.qza \
   --i-table  /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-closed-97-greengenes.qza \
   --p-sampling-depth 1000 \
   --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt \
   --output-dir /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_7_core_metrics.merge.97.closed.greengenes

qiime diversity core-metrics-phylogenetic \
   --i-phylogeny /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/greengenes-open-99-rooted-tree.qza \
   --i-table  /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-open-99-greengenes.qza \
   --p-sampling-depth 1000 \
   --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt \
   --output-dir /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_7_core_metrics.merge.99.open.greengenes

qiime diversity core-metrics-phylogenetic \
   --i-phylogeny /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/greengenes-open-97-rooted-tree.qza \
   --i-table  /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-open-97-greengenes.qza \
   --p-sampling-depth 1000 \
   --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt \
   --output-dir /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_7_core_metrics.merge.97.open.greengenes

qiime diversity core-metrics-phylogenetic \
   --i-phylogeny /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/SILVA-closed-99-rooted-tree.qza \
   --i-table  /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-closed-99-SILVA.qza \
   --p-sampling-depth 1000 \
   --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt \
   --output-dir /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_7_core_metrics.merge.99.closed.SILVA

qiime diversity core-metrics-phylogenetic \
   --i-phylogeny /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/SILVA-closed-97-rooted-tree.qza \
   --i-table  /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-closed-97-SILVA.qza \
   --p-sampling-depth 1000 \
   --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt \
   --output-dir /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_7_core_metrics.merge.97.closed.SILVA

qiime diversity core-metrics-phylogenetic \
   --i-phylogeny /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/SILVA-open-99-rooted-tree.qza \
   --i-table  /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-open-99-SILVA.qza \
   --p-sampling-depth 1000 \
   --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt \
   --output-dir /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_7_core_metrics.merge.99.open.SILVA

qiime diversity core-metrics-phylogenetic \
   --i-phylogeny /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_6_Tree/SILVA-open-97-rooted-tree.qza \
   --i-table  /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-open-97-SILVA.qza \
   --p-sampling-depth 1000 \
   --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt \
   --output-dir /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_7_core_metrics.merge.97.open.SILVA

### Classifier
###  /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/99_classifier.qza
###  /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/97_classifier.qza
###  /gpfs/scratch/wub02/projects/SRA/niosh/SILVA/99_classifier_SILVA.qza
###  /gpfs/scratch/wub02/projects/SRA/niosh/SILVA/97_classifier_SILVA.qza

###  /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-closed-99-greengenes.qza
###  /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-closed-97-greengenes.qza
###  /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-open-99-greengenes.qza
###  /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-open-97-greengenes.qza
###  /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-closed-99-SILVA.qza
###  /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-closed-97-SILVA.qza
###  /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-open-99-SILVA.qza
###  /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-open-97-SILVA.qza

###  /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-closed-99-greengenes.qza
###  /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-closed-97-greengenes.qza
###  /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-open-99-greengenes.qza
###  /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-open-97-greengenes.qza
###  /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-closed-99-SILVA.qza
###  /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-closed-97-SILVA.qza
###  /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-open-99-SILVA.qza
###  /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-open-97-SILVA.qza

### Taxonomy assignment Greengenes and SILVA

qiime feature-classifier classify-sklearn \
  --i-classifier /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/99_classifier.qza \
  --i-reads /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-closed-99-greengenes.qza \
  --o-classification /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_8_taxonomy/99_closed_greengenes_taxonomy.qza

qiime feature-classifier classify-sklearn \
  --i-classifier /gpfs/scratch/wub02/projects/SRA/niosh/greengages/97_classifier.qza \
  --i-reads /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-closed-97-greengenes.qza \
  --o-classification /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_8_taxonomy/97_closed_greengenes_taxonomy.qza

qiime feature-classifier classify-sklearn \
  --i-classifier /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/99_classifier.qza \
  --i-reads /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-open-99-greengenes.qza \
  --o-classification /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_8_taxonomy/99_open_greengenes_taxonomy.qza

qiime feature-classifier classify-sklearn \
  --i-classifier /gpfs/scratch/wub02/projects/SRA/niosh/greengages/97_classifier.qza \
  --i-reads /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-open-97-greengenes.qza \
  --o-classification /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_8_taxonomy/97_open_greengenes_taxonomy.qza

qiime feature-classifier classify-sklearn \
  --i-classifier /gpfs/scratch/wub02/projects/SRA/niosh/SILVA/99_classifier_SILVA.qza \
  --i-reads /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-closed-99-SILVA.qza \
  --o-classification /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_8_taxonomy/99_closed_SILVA_taxonomy.qza

qiime feature-classifier classify-sklearn \
  --i-classifier /gpfs/scratch/wub02/projects/SRA/niosh/SILVA/97_classifier_SILVA.qza \
  --i-reads /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-closed-97-SILVA.qza \
  --o-classification /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_8_taxonomy/97_closed_SILVA_taxonomy.qza

qiime feature-classifier classify-sklearn \
  --i-classifier /gpfs/scratch/wub02/projects/SRA/niosh/SILVA/99_classifier_SILVA.qza \
  --i-reads /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-open-99-SILVA.qza \
  --o-classification /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_8_taxonomy/99_open_SILVA_taxonomy.qza

qiime feature-classifier classify-sklearn \
  --i-classifier /gpfs/scratch/wub02/projects/SRA/niosh/SILVA/97_classifier_SILVA.qza \
  --i-reads /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.rep-seqs-open-97-SILVA.qza \
  --o-classification /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_8_taxonomy/97_open_SILVA_taxonomy.qza

### Taxa bar plots 

qiime taxa barplot \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-closed-99-greengenes.qza \
  --i-taxonomy /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_8_taxonomy/99_closed_greengenes_taxonomy.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt \
  --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_8_taxonomy/taxa-bar-plots_99_closed_greengenes.qzv

qiime taxa barplot \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-closed-97-greengenes.qza \
  --i-taxonomy /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_8_taxonomy/97_closed_greengenes_taxonomy.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt \
  --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_8_taxonomy/taxa-bar-plots_97_closed_greengenes.qzv

qiime taxa barplot \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-open-99-greengenes.qza \
  --i-taxonomy /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_8_taxonomy/99_open_greengenes_taxonomy.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt \
  --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_8_taxonomy/taxa-bar-plots_99_open_greengenes.qzv

qiime taxa barplot \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-open-97-greengenes.qza \
  --i-taxonomy /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_8_taxonomy/97_open_greengenes_taxonomy.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt \
  --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_8_taxonomy/taxa-bar-plots_97_open_greengenes.qzv

qiime taxa barplot \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-closed-99-SILVA.qza \
  --i-taxonomy /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_8_taxonomy/99_closed_SILVA_taxonomy.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt \
  --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_8_taxonomy/taxa-bar-plots_99_closed_SILVA.qzv

qiime taxa barplot \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-closed-97-SILVA.qza \
  --i-taxonomy /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_8_taxonomy/97_closed_SILVA_taxonomy.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt \
  --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_8_taxonomy/taxa-bar-plots_97_closed_SILVA.qzv

qiime taxa barplot \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-open-99-SILVA.qza \
  --i-taxonomy /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_8_taxonomy/99_open_SILVA_taxonomy.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt \
  --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_8_taxonomy/taxa-bar-plots_99_open_SILVA.qzv

qiime taxa barplot \
  --i-table /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_4_DADA2/filter.table-open-97-SILVA.qza \
  --i-taxonomy /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_8_taxonomy/97_open_SILVA_taxonomy.qza \
  --m-metadata-file /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME2.filter.txt \
  --o-visualization /gpfs/scratch/wub02/projects/SRA/niosh/merge/QIIME2_8_taxonomy/taxa-bar-plots_97_open_SILVA.qzv