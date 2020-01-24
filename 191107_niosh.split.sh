#!/bin/bash
#SBATCH --job-name=NIOSH.split                   # Job name
#SBATCH --mail-type=BEGIN,END,FAIL      	 # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=benjamin.wu@nyumc.org        # Where to send mail
#SBATCH --ntasks=16                   		 # Run on a single CPU
#SBATCH --mem=64gb                    		 # Job memory request
#SBATCH --time=72:05:00             		 # Time limit hrs:min:sec
#SBATCH --output=serial_test_%j.txt              # Standard output and error log

module add miniconda2/4.5.4
conda info --env
conda activate qiime1


###MSQ44

### /gpfs/scratch/wub02/projects/SRA/niosh/MSQ44/forward.fastq
### /gpfs/scratch/wub02/projects/SRA/niosh/MSQ44/barcode.fastq
### /gpfs/scratch/wub02/projects/SRA/niosh/MSQ44/reverse.fastq

### /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.44.Map.txt

split_libraries_fastq.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ44/forward.fastq -b /gpfs/scratch/wub02/projects/SRA/niosh/MSQ44/barcode.fastq --rev_comp_mapping_barcodes -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ44/forward -m /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.44.Map.txt -q 19 --store_demultiplexed_fastq

split_libraries_fastq.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ44/reverse.fastq -b /gpfs/scratch/wub02/projects/SRA/niosh/MSQ44/barcode.fastq --rev_comp_mapping_barcodes -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ44/reverse -m /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.44.Map.txt -q 19 --store_demultiplexed_fastq

split_sequence_file_on_sample_ids.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ44/forward/seqs.fastq -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ44/forward/split/ --file_type fastq
split_sequence_file_on_sample_ids.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ44/reverse/seqs.fastq -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ44/reverse/split/ --file_type fastq

###MSQ45

### /gpfs/scratch/wub02/projects/SRA/niosh/MSQ45/forward.fastq
### /gpfs/scratch/wub02/projects/SRA/niosh/MSQ45/barcode.fastq
### /gpfs/scratch/wub02/projects/SRA/niosh/MSQ45/reverse.fastq

### /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.45.Map.txt

split_libraries_fastq.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ45/forward.fastq -b /gpfs/scratch/wub02/projects/SRA/niosh/MSQ45/barcode.fastq --rev_comp_mapping_barcodes -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ45/forward -m /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.45.Map.txt -q 19 --store_demultiplexed_fastq

split_libraries_fastq.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ45/reverse.fastq -b /gpfs/scratch/wub02/projects/SRA/niosh/MSQ45/barcode.fastq --rev_comp_mapping_barcodes -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ45/reverse -m /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.45.Map.txt -q 19 --store_demultiplexed_fastq

split_sequence_file_on_sample_ids.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ45/forward/seqs.fastq -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ45/forward/split/ --file_type fastq
split_sequence_file_on_sample_ids.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ45/reverse/seqs.fastq -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ45/reverse/split/ --file_type fastq

###MSQ46

### /gpfs/scratch/wub02/projects/SRA/niosh/MSQ46/forward.fastq
### /gpfs/scratch/wub02/projects/SRA/niosh/MSQ46/barcode.fastq
### /gpfs/scratch/wub02/projects/SRA/niosh/MSQ46/reverse.fastq

### /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.46.Map.txt

split_libraries_fastq.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ46/forward.fastq -b /gpfs/scratch/wub02/projects/SRA/niosh/MSQ46/barcode.fastq --rev_comp_mapping_barcodes -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ46/forward -m /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.46.Map.txt -q 19 --store_demultiplexed_fastq

split_libraries_fastq.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ46/reverse.fastq -b /gpfs/scratch/wub02/projects/SRA/niosh/MSQ46/barcode.fastq --rev_comp_mapping_barcodes -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ46/reverse -m /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.46.Map.txt -q 19 --store_demultiplexed_fastq

split_sequence_file_on_sample_ids.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ46/forward/seqs.fastq -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ46/forward/split/ --file_type fastq
split_sequence_file_on_sample_ids.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ46/reverse/seqs.fastq -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ46/reverse/split/ --file_type fastq

###MSQ47

### /gpfs/scratch/wub02/projects/SRA/niosh/MSQ47/forward.fastq
### /gpfs/scratch/wub02/projects/SRA/niosh/MSQ47/barcode.fastq
### /gpfs/scratch/wub02/projects/SRA/niosh/MSQ47/reverse.fastq

### /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.47.Map.txt

split_libraries_fastq.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ47/forward.fastq -b /gpfs/scratch/wub02/projects/SRA/niosh/MSQ47/barcode.fastq --rev_comp_mapping_barcodes -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ47/forward -m /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.47.Map.txt -q 19 --store_demultiplexed_fastq

split_libraries_fastq.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ47/reverse.fastq -b /gpfs/scratch/wub02/projects/SRA/niosh/MSQ47/barcode.fastq --rev_comp_mapping_barcodes -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ47/reverse -m /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.47.Map.txt -q 19 --store_demultiplexed_fastq

split_sequence_file_on_sample_ids.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ47/forward/seqs.fastq -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ47/forward/split/ --file_type fastq
split_sequence_file_on_sample_ids.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ47/reverse/seqs.fastq -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ47/reverse/split/ --file_type fastq

###MSQ48

### /gpfs/scratch/wub02/projects/SRA/niosh/MSQ48/forward.fastq
### /gpfs/scratch/wub02/projects/SRA/niosh/MSQ48/barcode.fastq
### /gpfs/scratch/wub02/projects/SRA/niosh/MSQ48/reverse.fastq

### /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.48.Map.txt

split_libraries_fastq.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ48/forward.fastq -b /gpfs/scratch/wub02/projects/SRA/niosh/MSQ48/barcode.fastq --rev_comp_mapping_barcodes -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ48/forward -m /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.48.Map.txt -q 19 --store_demultiplexed_fastq

split_libraries_fastq.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ48/reverse.fastq -b /gpfs/scratch/wub02/projects/SRA/niosh/MSQ48/barcode.fastq --rev_comp_mapping_barcodes -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ48/reverse -m /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.48.Map.txt -q 19 --store_demultiplexed_fastq

split_sequence_file_on_sample_ids.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ48/forward/seqs.fastq -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ48/forward/split/ --file_type fastq
split_sequence_file_on_sample_ids.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ48/reverse/seqs.fastq -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ48/reverse/split/ --file_type fastq

###MSQ49

### /gpfs/scratch/wub02/projects/SRA/niosh/MSQ49/forward.fastq
### /gpfs/scratch/wub02/projects/SRA/niosh/MSQ49/barcode.fastq
### /gpfs/scratch/wub02/projects/SRA/niosh/MSQ49/reverse.fastq

### /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.49.Map.txt

split_libraries_fastq.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ49/forward.fastq -b /gpfs/scratch/wub02/projects/SRA/niosh/MSQ49/barcode.fastq --rev_comp_mapping_barcodes -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ49/forward -m /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.49.Map.txt -q 19 --store_demultiplexed_fastq

split_libraries_fastq.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ49/reverse.fastq -b /gpfs/scratch/wub02/projects/SRA/niosh/MSQ49/barcode.fastq --rev_comp_mapping_barcodes -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ49/reverse -m /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.49.Map.txt -q 19 --store_demultiplexed_fastq

split_sequence_file_on_sample_ids.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ49/forward/seqs.fastq -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ49/forward/split/ --file_type fastq
split_sequence_file_on_sample_ids.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ49/reverse/seqs.fastq -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ49/reverse/split/ --file_type fastq

###MSQ50

### /gpfs/scratch/wub02/projects/SRA/niosh/MSQ50/forward.fastq
### /gpfs/scratch/wub02/projects/SRA/niosh/MSQ50/barcode.fastq
### /gpfs/scratch/wub02/projects/SRA/niosh/MSQ50/reverse.fastq

### /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.50.Map.txt

split_libraries_fastq.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ50/forward.fastq -b /gpfs/scratch/wub02/projects/SRA/niosh/MSQ50/barcode.fastq --rev_comp_mapping_barcodes -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ50/forward -m /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.50.Map.txt -q 19 --store_demultiplexed_fastq

split_libraries_fastq.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ50/reverse.fastq -b /gpfs/scratch/wub02/projects/SRA/niosh/MSQ50/barcode.fastq --rev_comp_mapping_barcodes -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ50/reverse -m /gpfs/scratch/wub02/projects/SRA/niosh/map/MSQ.50.Map.txt -q 19 --store_demultiplexed_fastq

split_sequence_file_on_sample_ids.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ50/forward/seqs.fastq -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ50/forward/split/ --file_type fastq
split_sequence_file_on_sample_ids.py -i /gpfs/scratch/wub02/projects/SRA/niosh/MSQ50/reverse/seqs.fastq -o /gpfs/scratch/wub02/projects/SRA/niosh/MSQ50/reverse/split/ --file_type fastq
