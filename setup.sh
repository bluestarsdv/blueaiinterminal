#!/bin/bash
MODEL_DIR="$HOME/blueaimodels/qwen-2.5-3B-instruct"
mkdir -p "$MODEL_DIR"

echo "⬇️ Baixando Qwen 2.5 3B pra Termux - FIX sem XET"

# mata o XET
export HF_HUB_DISABLE_XET=1
export HF_HUB_DISABLE_TELEMETRY=1

# versão 0.25 não tem hf-xet, então instala no Termux
pip install "huggingface_hub==0.25.2" -q

echo "📥 Iniciando download..."
python -m huggingface_hub.cli.hf_api download Qwen/Qwen2.5-3B-Instruct --local-dir "$MODEL_DIR" --local-dir-use-symlinks False

echo "✅ IA em $MODEL_DIR"
ls "$MODEL_DIR" | head -20
