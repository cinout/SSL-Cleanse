#!/bin/bash

#SBATCH --partition=sapphire

#SBATCH --job-name="eval_bb"
#SBATCH --account=punim1623
#SBATCH --time=0-01:00:00

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1

#SBATCH --cpus-per-task=1
#SBATCH --mem=60G

### SBATCH --mail-user=haitianh@student.unimelb.edu.au
### SBATCH --mail-type=BEGIN

module purge

eval "$(conda shell.bash hook)"
conda activate anogpt

cd data
python make_data.py --data_root ./imagenet --output_file_root ./imagenet --data_name imagenet

##Log this job's resource usage stats### 
my-job-stats -a -n -s
##