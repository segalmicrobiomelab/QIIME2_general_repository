#!/bin/bash
#SBATCH --job-name=Open.closed.picking
#SBATCH --mail-type=BEGIN,END,FAIL      	 # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=benjamin.wu@nyumc.org        # Where to send mail
#SBATCH --ntasks=16                   		 # Run on a single CPU
#SBATCH --mem=64gb                    		 # Job memory request
#SBATCH --time=72:05:00             		 # Time limit hrs:min:sec
#SBATCH --output=serial_test_%j.log   # Standard output and error log


module add miniconda2/4.5.4
conda activate qiime1


### MSQ12

pick_closed_reference_otus.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12.QIIME1/1_library/seqs.fna -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12.QIIME1/Closed -t /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/taxonomy/97_otu_taxonomy.txt -r /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/rep_set/97_otus.fasta -f 

pick_open_reference_otus.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12.QIIME1/1_library/seqs.fna -o/gpfs/scratch/wub02/projects/SRA/niosh/MSQ12.QIIME1/Open -f -r /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/rep_set/97_otus.fasta