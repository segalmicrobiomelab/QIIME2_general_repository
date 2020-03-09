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


### MSQ5

pick_closed_reference_otus.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ5.QIIME1/1_library/seqs.fna -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ5.QIIME1/Closed -t /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/taxonomy/97_otu_taxonomy.txt -r /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/rep_set/97_otus.fasta -f 

pick_open_reference_otus.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ5.QIIME1/1_library/seqs.fna -o/gpfs/scratch/wub02/projects/SRA/niosh/MSQ5.QIIME1/Open -f -r /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/rep_set/97_otus.fasta

### MSQ12

pick_closed_reference_otus.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12.QIIME1/1_library/seqs.fna -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12.QIIME1/Closed -t /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/taxonomy/97_otu_taxonomy.txt -r /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/rep_set/97_otus.fasta -f 

pick_open_reference_otus.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12.QIIME1/1_library/seqs.fna -o/gpfs/scratch/wub02/projects/SRA/niosh/MSQ12.QIIME1/Open -f -r /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/rep_set/97_otus.fasta

### MSQ44

pick_closed_reference_otus.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ44.QIIME1/1_library/seqs.fna -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ44.QIIME1/Closed -t /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/taxonomy/97_otu_taxonomy.txt -r /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/rep_set/97_otus.fasta -f 

pick_open_reference_otus.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ44.QIIME1/1_library/seqs.fna -o/gpfs/scratch/wub02/projects/SRA/niosh/MSQ44.QIIME1/Open -f -r /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/rep_set/97_otus.fasta

### MSQ45

pick_closed_reference_otus.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ45.QIIME1/1_library/seqs.fna -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ45.QIIME1/Closed -t /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/taxonomy/97_otu_taxonomy.txt -r /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/rep_set/97_otus.fasta -f 

pick_open_reference_otus.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ45.QIIME1/1_library/seqs.fna -o/gpfs/scratch/wub02/projects/SRA/niosh/MSQ45.QIIME1/Open -f -r /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/rep_set/97_otus.fasta

### MSQ46

pick_closed_reference_otus.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ46.QIIME1/1_library/seqs.fna -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ46.QIIME1/Closed -t /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/taxonomy/97_otu_taxonomy.txt -r /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/rep_set/97_otus.fasta -f 

pick_open_reference_otus.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ46.QIIME1/1_library/seqs.fna -o/gpfs/scratch/wub02/projects/SRA/niosh/MSQ46.QIIME1/Open -f -r /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/rep_set/97_otus.fasta

### MSQ47

pick_closed_reference_otus.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ47.QIIME1/1_library/seqs.fna -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ47.QIIME1/Closed -t /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/taxonomy/97_otu_taxonomy.txt -r /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/rep_set/97_otus.fasta -f 

pick_open_reference_otus.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ47.QIIME1/1_library/seqs.fna -o/gpfs/scratch/wub02/projects/SRA/niosh/MSQ47.QIIME1/Open -f -r /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/rep_set/97_otus.fasta

### MSQ48

pick_closed_reference_otus.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ48.QIIME1/1_library/seqs.fna -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ48.QIIME1/Closed -t /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/taxonomy/97_otu_taxonomy.txt -r /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/rep_set/97_otus.fasta -f 

pick_open_reference_otus.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ48.QIIME1/1_library/seqs.fna -o/gpfs/scratch/wub02/projects/SRA/niosh/MSQ48.QIIME1/Open -f -r /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/rep_set/97_otus.fasta

### MSQ49

pick_closed_reference_otus.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ49.QIIME1/1_library/seqs.fna -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ49.QIIME1/Closed -t /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/taxonomy/97_otu_taxonomy.txt -r /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/rep_set/97_otus.fasta -f 

pick_open_reference_otus.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ49.QIIME1/1_library/seqs.fna -o/gpfs/scratch/wub02/projects/SRA/niosh/MSQ49.QIIME1/Open -f -r /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/rep_set/97_otus.fasta

### MSQ50


pick_closed_reference_otus.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ50.QIIME1/1_library/seqs.fna -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ50.QIIME1/Closed -t /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/taxonomy/97_otu_taxonomy.txt -r /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/rep_set/97_otus.fasta -f 

pick_open_reference_otus.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ50.QIIME1/1_library/seqs.fna -o/gpfs/scratch/wub02/projects/SRA/niosh/MSQ50.QIIME1/Open -f -r /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/rep_set/97_otus.fasta


