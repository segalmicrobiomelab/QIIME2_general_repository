#!/bin/bash
#SBATCH --job-name=MSQ106# Job name
#SBATCH --mail-type=BEGIN,END,FAIL      	 # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=benjamin.wu@nyumc.org        # Where to send mail
#SBATCH --ntasks=16                   		 # Run on a single CPU
#SBATCH --mem=64gb                    		 # Job memory request
#SBATCH --time=72:05:00             		 # Time limit hrs:min:sec
#SBATCH --output=serial_test_%j.log   # Standard output and error log


module add miniconda2/4.5.4
conda activate qiime1

cd /gpfs/scratch/wub02/projects/SRA/niosh

mkdir MSQ5.QIIME1
mkdir MSQ12.QIIME1
mkdir MSQ44.QIIME1
mkdir MSQ45.QIIME1
mkdir MSQ46.QIIME1
mkdir MSQ47.QIIME1
mkdir MSQ48.QIIME1
mkdir MSQ49.QIIME1
mkdir MSQ50.QIIME1

mkdir MSQ5.QIIME1/Tape.station
mkdir MSQ5.QIIME1/Map
mkdir MSQ5.QIIME1/2_fastq
mkdir MSQ5.QIIME1/1_library
mkdir MSQ5.QIIME1/3_join
mkdir MSQ5.QIIME1/Open
mkdir MSQ5.QIIME1/Closed

mkdir MSQ12.QIIME1/Tape.station
mkdir MSQ12.QIIME1/Map
mkdir MSQ12.QIIME1/2_fastq
mkdir MSQ12.QIIME1/1_library
mkdir MSQ12.QIIME1/3_join
mkdir MSQ12.QIIME1/Open
mkdir MSQ12.QIIME1/Closed

mkdir MSQ44.QIIME1/Tape.station
mkdir MSQ44.QIIME1/Map
mkdir MSQ44.QIIME1/2_fastq
mkdir MSQ44.QIIME1/1_library
mkdir MSQ44.QIIME1/3_join
mkdir MSQ44.QIIME1/Open
mkdir MSQ44.QIIME1/Closed

mkdir MSQ45.QIIME1/Tape.station
mkdir MSQ45.QIIME1/Map
mkdir MSQ45.QIIME1/2_fastq
mkdir MSQ45.QIIME1/1_library
mkdir MSQ45.QIIME1/3_join
mkdir MSQ45.QIIME1/Open
mkdir MSQ45.QIIME1/Closed

mkdir MSQ46.QIIME1/Tape.station
mkdir MSQ46.QIIME1/Map
mkdir MSQ46.QIIME1/2_fastq
mkdir MSQ46.QIIME1/1_library
mkdir MSQ46.QIIME1/3_join
mkdir MSQ46.QIIME1/Open
mkdir MSQ46.QIIME1/Closed

mkdir MSQ47.QIIME1/Tape.station
mkdir MSQ47.QIIME1/Map
mkdir MSQ47.QIIME1/2_fastq
mkdir MSQ47.QIIME1/1_library
mkdir MSQ47.QIIME1/3_join
mkdir MSQ47.QIIME1/Open
mkdir MSQ47.QIIME1/Closed

mkdir MSQ48.QIIME1/Tape.station
mkdir MSQ48.QIIME1/Map
mkdir MSQ48.QIIME1/2_fastq
mkdir MSQ48.QIIME1/1_library
mkdir MSQ48.QIIME1/3_join
mkdir MSQ48.QIIME1/Open
mkdir MSQ48.QIIME1/Closed

mkdir MSQ49.QIIME1/Tape.station
mkdir MSQ49.QIIME1/Map
mkdir MSQ49.QIIME1/2_fastq
mkdir MSQ49.QIIME1/1_library
mkdir MSQ49.QIIME1/3_join
mkdir MSQ49.QIIME1/Open
mkdir MSQ49.QIIME1/Closed

mkdir MSQ50.QIIME1/Tape.station
mkdir MSQ50.QIIME1/Map
mkdir MSQ50.QIIME1/2_fastq
mkdir MSQ50.QIIME1/1_library
mkdir MSQ50.QIIME1/3_join
mkdir MSQ50.QIIME1/Open
mkdir MSQ50.QIIME1/Closed

# /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.05.QIIME1.Map.txt
# /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.12.QIIME1.Map.txt
# /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.44.QIIME1.Map.txt
# /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.45.QIIME1.Map.txt
# /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.46.QIIME1.Map.txt
# /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.47.QIIME1.Map.txt
# /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.48.QIIME1.Map.txt
# /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.49.QIIME1.Map.txt
# /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.50.QIIME1.Map.txt

### MSQ5

join_paired_ends.py -f /gpfs/scratch/wub02/projects/SRA/niosh/MSQ5/2_fastq/forward.fastq.gz -r /gpfs/scratch/wub02/projects/SRA/niosh/MSQ5/2_fastq/reverse.fastq.gz -b /gpfs/scratch/wub02/projects/SRA/niosh/MSQ5/2_fastq/barcodes.fastq.gz -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ5.QIIME1/3_join

split_libraries_fastq.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ5.QIIME1/3_join/fastqjoin.join.fastq -b /gpfs/scratch/wub02/projects/SRA/niosh/MSQ5.QIIME1/3_join/fastqjoin.join_barcodes.fastq -m /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.05.QIIME1.Map.txt -q 19 --rev_comp_mapping_barcodes -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ5.QIIME1/1_library --start_seq_id 0

pick_closed_reference_otus.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ5.QIIME1/1_library/seqs.fna -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ5.QIIME1/Closed -t /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/taxonomy/97_otu_taxonomy.txt -r /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/rep_set/97_otus.fasta -f 

pick_open_reference_otus.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ5.QIIME1/1_library/seqs.fna -o/gpfs/scratch/wub02/projects/SRA/niosh/MSQ5.QIIME1/Open -f -r /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/rep_set/97_otus.fasta

### MSQ12

join_paired_ends.py -f /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12/2_fastq/forward.fastq.gz -r /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12/2_fastq/reverse.fastq.gz -b /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12/2_fastq/barcodes.fastq.gz -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12.QIIME1/3_join

split_libraries_fastq.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12.QIIME1/3_join/fastqjoin.join.fastq -b /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12.QIIME1/3_join/fastqjoin.join_barcodes.fastq -m /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.12.QIIME1.Map.txt -q 19 --rev_comp_mapping_barcodes -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12.QIIME1/1_library --start_seq_id 20000000

pick_closed_reference_otus.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12.QIIME1/1_library/seqs.fna -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12.QIIME1/Closed -t /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/taxonomy/97_otu_taxonomy.txt -r /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/rep_set/97_otus.fasta -f 

pick_open_reference_otus.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ12.QIIME1/1_library/seqs.fna -o/gpfs/scratch/wub02/projects/SRA/niosh/MSQ12.QIIME1/Open -f -r /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/rep_set/97_otus.fasta

### MSQ44

join_paired_ends.py -f /gpfs/scratch/wub02/projects/SRA/niosh/MSQ44/2_fastq/forward.fastq.gz -r /gpfs/scratch/wub02/projects/SRA/niosh/MSQ44/2_fastq/reverse.fastq.gz -b /gpfs/scratch/wub02/projects/SRA/niosh/MSQ44/2_fastq/barcodes.fastq.gz -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ44.QIIME1/3_join

split_libraries_fastq.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ44.QIIME1/3_join/fastqjoin.join.fastq -b /gpfs/scratch/wub02/projects/SRA/niosh/MSQ44.QIIME1/3_join/fastqjoin.join_barcodes.fastq -m /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.44.QIIME1.Map.txt -q 19 --rev_comp_mapping_barcodes -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ44.QIIME1/1_library --start_seq_id 40000000

pick_closed_reference_otus.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ44.QIIME1/1_library/seqs.fna -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ44.QIIME1/Closed -t /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/taxonomy/97_otu_taxonomy.txt -r /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/rep_set/97_otus.fasta -f 

pick_open_reference_otus.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ44.QIIME1/1_library/seqs.fna -o/gpfs/scratch/wub02/projects/SRA/niosh/MSQ44.QIIME1/Open -f -r /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/rep_set/97_otus.fasta

### MSQ45

join_paired_ends.py -f /gpfs/scratch/wub02/projects/SRA/niosh/MSQ45/2_fastq/forward.fastq.gz -r /gpfs/scratch/wub02/projects/SRA/niosh/MSQ45/2_fastq/reverse.fastq.gz -b /gpfs/scratch/wub02/projects/SRA/niosh/MSQ45/2_fastq/barcodes.fastq.gz -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ45.QIIME1/3_join

split_libraries_fastq.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ45.QIIME1/3_join/fastqjoin.join.fastq -b /gpfs/scratch/wub02/projects/SRA/niosh/MSQ45.QIIME1/3_join/fastqjoin.join_barcodes.fastq -m /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.45.QIIME1.Map.txt -q 19 --rev_comp_mapping_barcodes -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ45.QIIME1/1_library --start_seq_id 60000000

pick_closed_reference_otus.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ45.QIIME1/1_library/seqs.fna -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ45.QIIME1/Closed -t /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/taxonomy/97_otu_taxonomy.txt -r /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/rep_set/97_otus.fasta -f 

pick_open_reference_otus.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ45.QIIME1/1_library/seqs.fna -o/gpfs/scratch/wub02/projects/SRA/niosh/MSQ45.QIIME1/Open -f -r /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/rep_set/97_otus.fasta

### MSQ46

join_paired_ends.py -f /gpfs/scratch/wub02/projects/SRA/niosh/MSQ46/2_fastq/forward.fastq.gz -r /gpfs/scratch/wub02/projects/SRA/niosh/MSQ46/2_fastq/reverse.fastq.gz -b /gpfs/scratch/wub02/projects/SRA/niosh/MSQ46/2_fastq/barcodes.fastq.gz -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ46.QIIME1/3_join

split_libraries_fastq.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ46.QIIME1/3_join/fastqjoin.join.fastq -b /gpfs/scratch/wub02/projects/SRA/niosh/MSQ46.QIIME1/3_join/fastqjoin.join_barcodes.fastq -m /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.46.QIIME1.Map.txt -q 19 --rev_comp_mapping_barcodes -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ46.QIIME1/1_library --start_seq_id 80000000

pick_closed_reference_otus.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ46.QIIME1/1_library/seqs.fna -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ46.QIIME1/Closed -t /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/taxonomy/97_otu_taxonomy.txt -r /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/rep_set/97_otus.fasta -f 

pick_open_reference_otus.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ46.QIIME1/1_library/seqs.fna -o/gpfs/scratch/wub02/projects/SRA/niosh/MSQ46.QIIME1/Open -f -r /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/rep_set/97_otus.fasta

### MSQ47

join_paired_ends.py -f /gpfs/scratch/wub02/projects/SRA/niosh/MSQ47/2_fastq/forward.fastq.gz -r /gpfs/scratch/wub02/projects/SRA/niosh/MSQ47/2_fastq/reverse.fastq.gz -b /gpfs/scratch/wub02/projects/SRA/niosh/MSQ47/2_fastq/barcodes.fastq.gz -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ47.QIIME1/3_join

split_libraries_fastq.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ47.QIIME1/3_join/fastqjoin.join.fastq -b /gpfs/scratch/wub02/projects/SRA/niosh/MSQ47.QIIME1/3_join/fastqjoin.join_barcodes.fastq -m /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.47.QIIME1.Map.txt -q 19 --rev_comp_mapping_barcodes -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ47.QIIME1/1_library --start_seq_id 100000000

pick_closed_reference_otus.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ47.QIIME1/1_library/seqs.fna -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ47.QIIME1/Closed -t /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/taxonomy/97_otu_taxonomy.txt -r /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/rep_set/97_otus.fasta -f 

pick_open_reference_otus.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ47.QIIME1/1_library/seqs.fna -o/gpfs/scratch/wub02/projects/SRA/niosh/MSQ47.QIIME1/Open -f -r /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/rep_set/97_otus.fasta

### MSQ48

join_paired_ends.py -f /gpfs/scratch/wub02/projects/SRA/niosh/MSQ48/2_fastq/forward.fastq.gz -r /gpfs/scratch/wub02/projects/SRA/niosh/MSQ48/2_fastq/reverse.fastq.gz -b /gpfs/scratch/wub02/projects/SRA/niosh/MSQ48/2_fastq/barcodes.fastq.gz -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ48.QIIME1/3_join

split_libraries_fastq.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ48.QIIME1/3_join/fastqjoin.join.fastq -b /gpfs/scratch/wub02/projects/SRA/niosh/MSQ48.QIIME1/3_join/fastqjoin.join_barcodes.fastq -m /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.48.QIIME1.Map.txt -q 19 --rev_comp_mapping_barcodes -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ48.QIIME1/1_library --start_seq_id 120000000

pick_closed_reference_otus.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ48.QIIME1/1_library/seqs.fna -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ48.QIIME1/Closed -t /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/taxonomy/97_otu_taxonomy.txt -r /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/rep_set/97_otus.fasta -f 

pick_open_reference_otus.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ48.QIIME1/1_library/seqs.fna -o/gpfs/scratch/wub02/projects/SRA/niosh/MSQ48.QIIME1/Open -f -r /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/rep_set/97_otus.fasta

### MSQ49

join_paired_ends.py -f /gpfs/scratch/wub02/projects/SRA/niosh/MSQ49/2_fastq/forward.fastq.gz -r /gpfs/scratch/wub02/projects/SRA/niosh/MSQ49/2_fastq/reverse.fastq.gz -b /gpfs/scratch/wub02/projects/SRA/niosh/MSQ49/2_fastq/barcodes.fastq.gz -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ49.QIIME1/3_join

split_libraries_fastq.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ49.QIIME1/3_join/fastqjoin.join.fastq -b /gpfs/scratch/wub02/projects/SRA/niosh/MSQ49.QIIME1/3_join/fastqjoin.join_barcodes.fastq -m /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.49.QIIME1.Map.txt -q 19 --rev_comp_mapping_barcodes -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ49.QIIME1/1_library --start_seq_id 140000000

pick_closed_reference_otus.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ49.QIIME1/1_library/seqs.fna -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ49.QIIME1/Closed -t /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/taxonomy/97_otu_taxonomy.txt -r /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/rep_set/97_otus.fasta -f 

pick_open_reference_otus.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ49.QIIME1/1_library/seqs.fna -o/gpfs/scratch/wub02/projects/SRA/niosh/MSQ49.QIIME1/Open -f -r /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/rep_set/97_otus.fasta

### MSQ50

join_paired_ends.py -f /gpfs/scratch/wub02/projects/SRA/niosh/MSQ50/2_fastq/forward.fastq.gz -r /gpfs/scratch/wub02/projects/SRA/niosh/MSQ50/2_fastq/reverse.fastq.gz -b /gpfs/scratch/wub02/projects/SRA/niosh/MSQ50/2_fastq/barcodes.fastq.gz -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ50.QIIME1/3_join

split_libraries_fastq.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ50.QIIME1/3_join/fastqjoin.join.fastq -b /gpfs/scratch/wub02/projects/SRA/niosh/MSQ50.QIIME1/3_join/fastqjoin.join_barcodes.fastq -m /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.50.QIIME1.Map.txt -q 19 --rev_comp_mapping_barcodes -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ50.QIIME1/1_library --start_seq_id 160000000

pick_closed_reference_otus.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ50.QIIME1/1_library/seqs.fna -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ50.QIIME1/Closed -t /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/taxonomy/97_otu_taxonomy.txt -r /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/rep_set/97_otus.fasta -f 

pick_open_reference_otus.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ50.QIIME1/1_library/seqs.fna -o/gpfs/scratch/wub02/projects/SRA/niosh/MSQ50.QIIME1/Open -f -r /gpfs/scratch/wub02/projects/SRA/niosh/greengenes/gg_13_8_otus/rep_set/97_otus.fasta


