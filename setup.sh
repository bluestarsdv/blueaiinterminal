#!/bin/bash
MODEL_DIR="$HOME/blueaimodels/qwen-2.5-3B-instruct"
mkdir -p "$MODEL_DIR"
echo "⬇️ Baixando Qwen 2.5 3B para $MODEL_DIR"
pip install -q huggingface_hub
huggingface-cli download Qwen/Qwen2.5-3B-Instruct --local-dir "$MODEL_DIR" --local-dir-use-symlinks False
echo "✅ IA em $MODEL_DIR"
