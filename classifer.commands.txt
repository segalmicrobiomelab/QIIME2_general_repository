##### Feature classifiers ###### 
################################

# Benjamin G. Wu 
# Will have to download the greengenes data set
# Can be used with all other 16S gene repository

V4 repeat 

qiime tools import \
  --type 'FeatureData[Sequence]' \
  --input-path /Volumes/homes/ben/gg_13_8_otus/rep_set/99_otus.fasta \
  --output-path /Volumes/homes/leo/Sequence.Data/190918_MSQ104/QIIME2/greengenes/99_otus.qza

qiime tools import \
  --type 'FeatureData[Taxonomy]' \
  --input-format HeaderlessTSVTaxonomyFormat \
  --input-path /Volumes/homes/ben/gg_13_8_otus/taxonomy/99_otu_taxonomy.txt \
  --output-path /Volumes/homes/leo/Sequence.Data/190918_MSQ104/QIIME2/greengenes/99_ref-taxonomy.qza

qiime feature-classifier extract-reads \
  --i-sequences /Volumes/homes/leo/Sequence.Data/190918_MSQ104/QIIME2/greengenes/99_otus.qza \
  --p-f-primer GTGYCAGCMGCCGCGGTAA \
  --p-r-primer GGACTACNVGGGTWTCTAAT \
  --p-trunc-len 0 \
  --p-min-length 30 \
  --o-reads /Volumes/homes/leo/Sequence.Data/190918_MSQ104/QIIME2/greengenes/99_ref-seqs.qza

qiime feature-classifier fit-classifier-naive-bayes \
  --i-reference-reads /Volumes/homes/leo/Sequence.Data/190918_MSQ104/QIIME2/greengenes/99_ref-seqs.qza \
  --i-reference-taxonomy /Volumes/homes/leo/Sequence.Data/190918_MSQ104/QIIME2/greengenes/99_ref-taxonomy.qza \
  --o-classifier /Volumes/homes/leo/Sequence.Data/190918_MSQ104/QIIME2/greengenes/99_classifier.qza

qiime feature-classifier classify-sklearn \
  --i-classifier /Volumes/homes/leo/Sequence.Data/190918_MSQ104/QIIME2/greengenes/99_classifier.qza \
  --i-reads /Volumes/homes/leo/Sequence.Data/190918_MSQ104/QIIME2/greengenes/99_ref-seqs.qza\
  --o-classification /Volumes/homes/leo/Sequence.Data/190918_MSQ104/QIIME2/greengenes/99_taxonomy.qza
