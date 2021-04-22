#!/usr/bin/env bash

source scripts/01_basic_cfg.sh

#####################
output_name="${MODEL_NAME}.onnx"
output_sim_name="${MODEL_NAME}_sim.onnx"



#onnx2ncnn="/media/yzh/program/software/ncnnlib/ncnn-20210124-ubuntu-1604/bin/onnx2ncnn"
#ncnn2mem="/media/yzh/program/software/ncnnlib/ncnn-20210124-ubuntu-1604/bin/ncnn2mem"
#ncnnoptimize="/media/yzh/program/software/ncnnlib/ncnn-20210124-ubuntu-1604/bin/ncnnoptimize"
onnx2ncnn="/media/yzh/program/soure/inference/ncnn/mtcnn_ncnn_inference/mtcnn_ncnn/3rdparty/ncnn/build/tools/onnx/onnx2ncnn"
ncnn2mem="/media/yzh/program/soure/inference/ncnn/mtcnn_ncnn_inference/mtcnn_ncnn/3rdparty/ncnn/build/tools/ncnn2mem"
ncnnoptimize="/media/yzh/program/soure/inference/ncnn/mtcnn_ncnn_inference/mtcnn_ncnn/3rdparty/ncnn/build/tools/ncnnoptimize"
# new
#onnx2ncnn="/media/yzh/program/soure/inference/ncnn/mtcnn_ncnn_inference/mtcnn_ncnn/3rdparty/ncnn/build_cpu_new/tools/onnx/onnx2ncnn"
#ncnn2mem="/media/yzh/program/soure/inference/ncnn/mtcnn_ncnn_inference/mtcnn_ncnn/3rdparty/ncnn/build_cpu_new/tools/ncnn2mem"
#ncnnoptimize="/media/yzh/program/soure/inference/ncnn/mtcnn_ncnn_inference/mtcnn_ncnn/3rdparty/ncnn/build_cpu_new/tools/ncnnoptimize"

cd ${WORK_DIR}
echo "the work dir is ${WORK_DIR}"

echo "begin simplified"
echo "the output name is ${output_name} ,and the output sim name is  ${output_sim_name}"
python3 -m onnxsim  ${output_name} ${output_sim_name} #--input-shape 1,3,300,300
echo "Finished simplified"

echo "begin ncnn"
echo "the model name is ${MODEL_NAME}"
${onnx2ncnn} ${output_sim_name} ${MODEL_NAME}.param ${MODEL_NAME}.bin
echo "Finished ncnn"

echo "begin ncnn2optimize"
#${ncnnoptimize} ${MODEL_NAME}.param ${MODEL_NAME}.bin ${MODEL_NAME}_opt.param ${MODEL_NAME}_opt.bin 0
echo "Finished ncnn2optimize"

echo "begin convert to mem"
#${ncnn2mem} ${MODEL_NAME}_opt.param ${MODEL_NAME}_opt.bin ${MODEL_NAME}.id.h ${MODEL_NAME}.mem.h
echo "Finished mem"

