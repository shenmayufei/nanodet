#!/usr/bin/env bash
source scripts/01_basic_cfg.sh
python tools/export.py --cfg_path ${CONFIG_PATH} --model_path ${PYTORCH_MODEL_PATH} --out_path ${PYTORCH_MODEL_DIR}
