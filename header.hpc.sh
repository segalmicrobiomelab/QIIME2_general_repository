#!/bin/bash
#SBATCH --job-name=MSQ106# Job name
#SBATCH --mail-type=BEGIN,END,FAIL      	 # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=benjamin.wu@nyumc.org        # Where to send mail
#SBATCH --ntasks=16                   		 # Run on a single CPU
#SBATCH --mem=64gb                    		 # Job memory request
#SBATCH --time=72:05:00             		 # Time limit hrs:min:sec
#SBATCH --output=serial_test_%j.log   # Standard output and error log
