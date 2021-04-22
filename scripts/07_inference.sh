#!/usr/bin/env bash
source scripts/01_basic_cfg.sh

# image
python ./demo/demo.py \
    image \
    --config ${CONFIG_PATH} \
    --model ${PYTORCH_MODEL_PATH} \
    --path /home/yzh/Pictures/20200817_103256_391.jpg



# vedio
#CUDA_VISIBLE_DEVICES=0  python ./demo/webcam_demo.py \
#    ${CONFIG} \
#    ${CHECKPOINTS} \
#    --device 'cuda:0' \
#    --camera-id 0 \
#    --score-thr 0.3

# demo_ncnn
python3 demo_ncnn/python/demo_ncnn.py \
    --model_path /media/yzh/program/soure/develop/nanodet/workspace/nanodet_m/model_best/nanodet_m.param \
    --model_bin /media/yzh/program/soure/develop/nanodet/workspace/nanodet_m/model_best/nanodet_m.bin \
    --cfg_path /media/yzh/program/soure/develop/nanodet/config/nanodet-m_tobo.yml \
    --img_fold /home/yzh/Pictures/shop_pic \
    --result_fold /home/yzh/Pictures/shop_pic \
    --input_shape 320 320 \
    --backend ncnn

