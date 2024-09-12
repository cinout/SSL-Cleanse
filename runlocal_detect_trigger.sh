cd detector

python detector.py \
  --dataset imagenet --emb 128 --lr 1e-1 --bs 32 --epoch 1000 --lam 1e-1 --attack_succ_threshold 0.99 \
  --fname ../checkpoint/imagenet/HTBA_BYOL_Imagenet100.tar --test_file_path ../data/imagenet/test_filelist.txt \
  --num_clusters 12 --knn_sample_num 1000 --ratio 0.05 --trigger_path ../trigger_estimation