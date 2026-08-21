#!/bin/bash
MODEL_DIR="$HOME/blueaimodels/qwen-2.5-3B-instruct"
mkdir -p "$HOME/blueaimodels"

echo "⬇️ Baixando Qwen 2.5 3B - FIX LFS"

pkg install git git-lfs -y
git lfs install --force

rm -rf "$MODEL_DIR"

git clone https://huggingface.co/Qwen/Qwen2.5-3B-Instruct "$MODEL_DIR"
cd "$MODEL_DIR"
git lfs pull

echo "--- Verificando ---"
ls -lh "$MODEL_DIR" | head -20
du -sh "$MODEL_DIR"

# Se ainda tiver arquivo pequeno, é ponteiro, força download com curl
if [ ! -f "$MODEL_DIR/config.json" ]; then
  echo "❌ Ainda ponteiro, baixando na mão..."
  curl -L https://huggingface.co/Qwen/Qwen2.5-3B-Instruct/resolve/main/config.json -o "$MODEL_DIR/config.json"
fi
