#!/bin/bash

###SBATCH --partition=gpu-a100

###SBATCH --partition=gpu-a100-short

###SBATCH --partition=feit-gpu-a100
###SBATCH --qos=feit

#SBATCH --partition=deeplearn
#SBATCH --qos=gpgpudeeplearn
#SBATCH --constraint=dlg4|dlg5|dlg6

#SBATCH --job-name="htba"
#SBATCH --account=punim1623
#SBATCH --time=0-20:00:00

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --gres=gpu:1
### "ntasks-per-node" should have same value as "res=gpu:"

#SBATCH --mem=80G

# export WORLD_SIZE=2   ### update world size: nodes x ntasks-per-node
# export MASTER_PORT=28400
# echo ">>> NODELIST="${SLURM_NODELIST}
# master_addr=$(scontrol show hostnames "$SLURM_JOB_NODELIST" | head -n 1)
# export MASTER_ADDR=$master_addr
# echo ">>> MASTER_ADDR="$MASTER_ADDR

module purge

eval "$(conda shell.bash hook)"
conda activate anogpt

cd detector

python detector.py \
  --emb 128 \
  --lr 1e-1 \
  --bs 32 \
  --epoch 1000 \
  --lam 1e-1 \
  --attack_succ_threshold 0.99 \
  --num_clusters 12 \
  --knn_sample_num 1000 \
  \
  --fname ../checkpoint/imagenet/HTBA_BYOL_Imagenet100.tar \
  --test_file_path ../data/imagenet/test_filelist.txt \
  --ratio 0.05 \
  --dataset imagenet \
  --trigger_path ../trigger_estimation_htba_byol_imagenet100

##Log this job's resource usage stats###
my-job-stats -a -n -s