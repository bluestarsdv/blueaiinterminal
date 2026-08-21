#!/bin/bash
MODEL_DIR="$HOME/blueaimodels/qwen-2.5-3B-instruct"
PROMPT="$*"

if [ ! -d "$MODEL_DIR" ]; then
  echo "❌ IA não encontrada em $MODEL_DIR, roda ./setup.sh primeiro"
  exit 1
fi

echo "💀 BLUEAI - usando IA de $MODEL_DIR"
echo "⚡ $PROMPT"

# AQUI TU PLUGA O EXECUTOR DEPOIS
# Por enquanto só mostra que achou a IA
ls "$MODEL_DIR" | head -5
