#!/usr/bin/env bash
export CONFIG_PATH=config/nanodet-m_tobo.yml
export MODEL_NAME=nanodet_m
export WORK_DIR=workspace/${MODEL_NAME}/model_best
export PYTORCH_MODEL_PATH=${WORK_DIR}/model_best.pth
export PYTORCH_MODEL_DIR=${WORK_DIR}/${MODEL_NAME}.onnx
