#!/bin/bash
#SBATCH --job-name=merge.filter.downstream				# Job name
#SBATCH --mail-type=BEGIN,END,FAIL      	 # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=benjamin.wu@nyumc.org        # Where to send mail
#SBATCH --ntasks=16                   		 # Run on a single CPU
#SBATCH --mem=64gb                    		 # Job memory request
#SBATCH --time=72:05:00             		 # Time limit hrs:min:sec
#SBATCH --output=serial_test_%j.log   # Standard output and error log


module add miniconda2/4.5.4
conda activate qiime1

# /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME1.filter.txt
# /gpfs/scratch/wub02/projects/SRA/niosh/merge.qiime1/
# /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/trees/97_otus.tree

cd /gpfs/scratch/wub02/projects/SRA/niosh/merge.qiime1/

mkdir closed
mkdir open
mkdir closed/5_otus
mkdir closed/7_bdiversity
mkdir closed/8_adiversity
mkdir closed/9_taxa_summary

mkdir open/5_otus
mkdir open/7_bdiversity
mkdir open/8_adiversity
mkdir open/9_taxa_summary

# /gpfs/scratch/wub02/projects/SRA/niosh/MSQ5.QIIME1/Open/otu_table_mc2_w_tax.biom
# /gpfs/scratch/wub02/projects/SRA/niosh/MSQ5.QIIME1/Closed/otu_table.biom

# /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12.QIIME1/Open/otu_table_mc2_w_tax.biom
# /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12.QIIME1/Closed/otu_table.biom

# /gpfs/scratch/wub02/projects/SRA/niosh/MSQ44.QIIME1/Open/otu_table_mc2_w_tax.biom
# /gpfs/scratch/wub02/projects/SRA/niosh/MSQ44.QIIME1/Closed/otu_table.biom

# /gpfs/scratch/wub02/projects/SRA/niosh/MSQ45.QIIME1/Open/otu_table_mc2_w_tax.biom
# /gpfs/scratch/wub02/projects/SRA/niosh/MSQ45.QIIME1/Closed/otu_table.biom

# /gpfs/scratch/wub02/projects/SRA/niosh/MSQ46.QIIME1/Open/otu_table_mc2_w_tax.biom
# /gpfs/scratch/wub02/projects/SRA/niosh/MSQ46.QIIME1/Closed/otu_table.biom

# /gpfs/scratch/wub02/projects/SRA/niosh/MSQ47.QIIME1/Open/otu_table_mc2_w_tax.biom
# /gpfs/scratch/wub02/projects/SRA/niosh/MSQ47.QIIME1/Closed/otu_table.biom

# /gpfs/scratch/wub02/projects/SRA/niosh/MSQ48.QIIME1/Open/otu_table_mc2_w_tax.biom
# /gpfs/scratch/wub02/projects/SRA/niosh/MSQ48.QIIME1/Closed/otu_table.biom

# /gpfs/scratch/wub02/projects/SRA/niosh/MSQ49.QIIME1/Open/otu_table_mc2_w_tax.biom
# /gpfs/scratch/wub02/projects/SRA/niosh/MSQ49.QIIME1/Closed/otu_table.biom

# /gpfs/scratch/wub02/projects/SRA/niosh/MSQ50.QIIME1/Open/otu_table_mc2_w_tax.biom
# /gpfs/scratch/wub02/projects/SRA/niosh/MSQ50.QIIME1/Closed/otu_table.biom

merge_otu_tables.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ5.QIIME1/Closed/otu_table.biom,/gpfs/scratch/wub02/projects/SRA/niosh/MSQ12.QIIME1/Closed/otu_table.biom,/gpfs/scratch/wub02/projects/SRA/niosh/MSQ44.QIIME1/Closed/otu_table.biom,/gpfs/scratch/wub02/projects/SRA/niosh/MSQ45.QIIME1/Closed/otu_table.biom,/gpfs/scratch/wub02/projects/SRA/niosh/MSQ46.QIIME1/Closed/otu_table.biom,/gpfs/scratch/wub02/projects/SRA/niosh/MSQ47.QIIME1/Closed/otu_table.biom,/gpfs/scratch/wub02/projects/SRA/niosh/MSQ48.QIIME1/Closed/otu_table.biom,/gpfs/scratch/wub02/projects/SRA/niosh/MSQ49.QIIME1/Closed/otu_table.biom,/gpfs/scratch/wub02/projects/SRA/niosh/MSQ50.QIIME1/Closed/otu_table.biom -o /gpfs/scratch/wub02/projects/SRA/niosh/merge.qiime1/closed/5_otus/niosh.closed.biom

merge_otu_tables.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ5.QIIME1/Open/otu_table_mc2_w_tax.biom,/gpfs/scratch/wub02/projects/SRA/niosh/MSQ12.QIIME1/Open/otu_table_mc2_w_tax.biom,/gpfs/scratch/wub02/projects/SRA/niosh/MSQ44.QIIME1/Open/otu_table_mc2_w_tax.biom,/gpfs/scratch/wub02/projects/SRA/niosh/MSQ45.QIIME1/Open/otu_table_mc2_w_tax.biom,/gpfs/scratch/wub02/projects/SRA/niosh/MSQ46.QIIME1/Open/otu_table_mc2_w_tax.biom,/gpfs/scratch/wub02/projects/SRA/niosh/MSQ47.QIIME1/Open/otu_table_mc2_w_tax.biom,/gpfs/scratch/wub02/projects/SRA/niosh/MSQ48.QIIME1/Open/otu_table_mc2_w_tax.biom,/gpfs/scratch/wub02/projects/SRA/niosh/MSQ49.QIIME1/Open/otu_table_mc2_w_tax.biom,/gpfs/scratch/wub02/projects/SRA/niosh/MSQ50.QIIME1/Open/otu_table_mc2_w_tax.biom -o /gpfs/scratch/wub02/projects/SRA/niosh/merge.qiime1/open/5_otus/niosh.open.biom

filter_samples_from_otu_table.py -i /gpfs/scratch/wub02/projects/SRA/niosh/merge.qiime1/closed/5_otus/niosh.closed.biom -o /gpfs/scratch/wub02/projects/SRA/niosh/merge.qiime1/closed/5_otus/niosh.closed.filter.biom --sample_id /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME1.filter.txt

filter_samples_from_otu_table.py -i /gpfs/scratch/wub02/projects/SRA/niosh/merge.qiime1/open/5_otus/niosh.open.biom -o /gpfs/scratch/wub02/projects/SRA/niosh/merge.qiime1/open/5_otus/niosh.open.filter.biom --sample_id /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME1.filter.txt

beta_diversity_through_plots.py -i /gpfs/scratch/wub02/projects/SRA/niosh/merge.qiime1/open/5_otus/niosh.open.biom -m /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME1.filter.txt -o /gpfs/scratch/wub02/projects/SRA/niosh/merge.qiime1/open/7_bdiversity/ -t /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/trees/97_otus.tree -e 1000 -f

beta_diversity_through_plots.py -i /gpfs/scratch/wub02/projects/SRA/niosh/merge.qiime1/closed/5_otus/niosh.closed.biom -m /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME1.filter.txt -o /gpfs/scratch/wub02/projects/SRA/niosh/merge.qiime1/closed/7_bdiversity/ -t /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/trees/97_otus.tree -e 1000 -f

alpha_rarefaction.py -i /gpfs/scratch/wub02/projects/SRA/niosh/merge.qiime1/open/5_otus/niosh.open.biom -m /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME1.filter.txt  -o /gpfs/scratch/wub02/projects/SRA/niosh/merge.qiime1/open/8_adiversity/ -t /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/trees/97_otus.tree -e 1000 -f 

alpha_rarefaction.py -i /gpfs/scratch/wub02/projects/SRA/niosh/merge.qiime1/closed/5_otus/niosh.closed.biom -m /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME1.filter.txt -o /gpfs/scratch/wub02/projects/SRA/niosh/merge.qiime1/closed/8_adiversity/ -t /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/trees/97_otus.tree -e 1000 -f 

summarize_taxa_through_plots.py -i /gpfs/scratch/wub02/projects/SRA/niosh/merge.qiime1/open/5_otus/niosh.open.biom -m /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME1.filter.txt -o /gpfs/scratch/wub02/projects/SRA/niosh/merge.qiime1/open/9_taxa_summary -f

summarize_taxa_through_plots.py -i /gpfs/scratch/wub02/projects/SRA/niosh/merge.qiime1/closed/5_otus/niosh.closed.biom -m /gpfs/scratch/wub02/projects/SRA/niosh/map/Map.master.QIIME1.filter.txt -o /gpfs/scratch/wub02/projects/SRA/niosh/merge.qiime1/closed/9_taxa_summary -f
