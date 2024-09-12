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
  --fname ../checkpoint/cifar100/CTRL_SIMCLR_Cifar100.tar \
  --test_file_path ../data/cifar100/test_filelist.txt \
  --ratio 0.05 \
  --dataset cifar100 \
  --trigger_path ../trigger_estimation_ctrl_simclr_cifar100