#!/bin/bash
MODEL_DIR="$HOME/blueaimodels/qwen-2.5-3B-instruct"
mkdir -p "$HOME/blueaimodels"

echo "⬇️ Baixando Qwen 2.5 3B pelo GIT - sem pip"

pkg install git git-lfs -y -q
git lfs install

if [ -d "$MODEL_DIR" ]; then
  rm -rf "$MODEL_DIR"
fi

# baixa direto do HF pelo git, sem precisar de huggingface-cli
git clone https://huggingface.co/Qwen/Qwen2.5-3B-Instruct "$MODEL_DIR"

echo "✅ IA em $MODEL_DIR"
ls "$MODEL_DIR"
