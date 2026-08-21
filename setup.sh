#!/bin/bash
MODEL_DIR="$HOME/blueaimodels/qwen-2.5-3B-instruct"
mkdir -p "$MODEL_DIR"

echo "⬇️ Baixando Qwen 2.5 3B pra Termux (sem XET)"

# desativa o XET que quebra no Termux
export HF_HUB_DISABLE_XET=1
export HF_HUB_DISABLE_TELEMETRY=1

pip install -U "huggingface_hub[cli]" --no-build-isolation -q
# se ainda falhar, usa esse:
# pip install huggingface_hub --no-deps -q

~/.local/bin/huggingface-cli download Qwen/Qwen2.5-3B-Instruct --local-dir "$MODEL_DIR" --local-dir-use-symlinks False

echo "✅ IA em $MODEL_DIR"
ls "$MODEL_DIR" | head -10
