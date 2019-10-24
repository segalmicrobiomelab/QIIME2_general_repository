module add miniconda2/4.5.4
source activate qiime2-2019.7

qiime tools import \
--type EMPPairedEndSequences \
  --input-path /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/2_fastq \
  --output-path /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/QIIME2_3_demux/emp-paired-end-sequences.qza

qiime demux emp-paired \
  --i-seqs /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/QIIME2_3_demux/emp-paired-end-sequences.qza \
  --m-barcodes-file /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/map/MSQ.map.107.QIIME2.txt \
  --m-barcodes-column BarcodeSequence \
  --o-per-sample-sequences /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/QIIME2_3_demux/demux.qza \
  --p-rev-comp-barcodes \
  --p-rev-comp-mapping-barcodes \
  --o-error-correction-details demux-details.qza

qiime demux summarize \
  --i-data /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/QIIME2_3_demux/demux.qza \
  --o-visualization /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/QIIME2_3_demux/demux.qzv

### DADA2

qiime dada2 denoise-paired \
  --i-demultiplexed-seqs /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/QIIME2_3_demux/demux.qza \
  --p-trim-left-f 13 \
  --p-trim-left-r 13 \
  --p-trunc-len-f 150 \
  --p-trunc-len-r 150 \
  --p-n-threads 0 \
  --o-table /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/QIIME2_4_DADA2/table.qza \
  --o-representative-sequences /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/QIIME2_4_DADA2/rep-seqs.qza \
  --o-denoising-stats /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/denoising-stats.qza

qiime feature-table summarize \
  --i-table /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/QIIME2_4_DADA2/table.qza \
  --o-visualization /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/QIIME2_4_DADA2/table.qzv \
  --m-sample-metadata-file /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/map/MSQ.map.107.QIIME2.txt

qiime feature-table tabulate-seqs \
  --i-data /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/QIIME2_4_DADA2/rep-seqs.qza \
  --o-visualization /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/QIIME2_4_DADA2/rep-seqs.qzv

qiime metadata tabulate \
  --m-input-file /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/denoising-stats.qza \
  --o-visualization /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/denoising-stats.qzv

##### Quality Control 

qiime quality-control exclude-seqs \
  --i-query-sequences /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/QIIME2_4_DADA2/rep-seqs.qza \
  --i-reference-sequences /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/greengenes/99_otus.qza \
  --p-method vsearch \
  --p-perc-identity 0.99 \
  --p-perc-query-aligned 0.99 \
  --p-threads 16 \
  --o-sequence-hits /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/QIIME2_4_DADA2/hits_quality.qza \
  --o-sequence-misses /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/QIIME2_4_DADA2/misses_quality.qza \
  --verbose

qiime feature-table filter-features \
  --i-table /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/QIIME2_4_DADA2/table.qza \
  --m-metadata-file /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/QIIME2_4_DADA2/misses_quality.qza \
  --o-filtered-table /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/QIIME2_4_DADA2/no-miss-table.qza \
  --p-exclude-ids

qiime feature-table summarize \
  --i-table /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/QIIME2_4_DADA2/no-miss-table.qza \
  --o-visualization /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/QIIME2_4_DADA2/no-miss-table.qzv \
  --m-sample-metadata-file /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/map/MSQ.map.107.QIIME2.txt 

qiime feature-table tabulate-seqs \
  --i-data /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/QIIME2_4_DADA2/hits_quality.qza \
  --o-visualization /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/QIIME2_4_DADA2/hits_quality.qzv


##### Tree

qiime phylogeny align-to-tree-mafft-fasttree \
  --i-sequences /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/QIIME2_4_DADA2/hits_quality.qza \
  --o-alignment /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/QIIME2_6_Tree/aligned-rep-seqs.qza \
  --o-masked-alignment /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/QIIME2_6_Tree/masked-aligned-rep-seqs.qza \
  --o-tree /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/QIIME2_6_Tree/unrooted-tree.qza \
  --o-rooted-tree /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/QIIME2_6_Tree/rooted-tree.qza

##### Metrics

qiime diversity core-metrics-phylogenetic \
  --i-phylogeny /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/QIIME2_6_Tree/rooted-tree.qza \
  --i-table /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/QIIME2_4_DADA2/no-miss-table.qza \
  --p-sampling-depth 1000 \
  --m-metadata-file /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/map/MSQ.map.107.QIIME2.txt \
  --output-dir /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/QIIME2_7_core_metrics

##### Taxonomy 99%

#####


99% Taxanomoy from straight DADA2

qiime feature-classifier classify-sklearn \
  --i-classifier /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/greengenes/99_classifier.qza \
  --i-reads /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/QIIME2_4_DADA2/hits_quality.qza \
  --o-classification /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/QIIME2_8_taxonomy/taxonomy_DADA2_99.qza

qiime taxa barplot \
  --i-table  /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/QIIME2_4_DADA2/no-miss-table.qza \
  --i-taxonomy /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/QIIME2_8_taxonomy/taxonomy_DADA2_99.qza \
  --m-metadata-file /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/map/MSQ.map.107.QIIME2.txt \
  --o-visualization /Users/benjaminwu/Dropbox/Home.mouse.work/191021_MSQ107/QIIME2/QIIME2_8_taxonomy/taxa-bar-plots_DADA2_99.qzv

