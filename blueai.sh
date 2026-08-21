#!/bin/bash
MODEL_DIR="$HOME/blueaimodels/qwen-2.5-3B-instruct"

cat > $HOME/blueai_chat.py << 'PY'
import os
from transformers import AutoModelForCausalLM, AutoTokenizer

MODEL_DIR = os.path.expanduser("~/blueaimodels/qwen-2.5-3B-instruct")
print(f"💀 BLUEAI carregando IA de {MODEL_DIR}...")

tokenizer = AutoTokenizer.from_pretrained(MODEL_DIR)
model = AutoModelForCausalLM.from_pretrained(MODEL_DIR, device_map="auto", trust_remote_code=True)

print("✅ BLUEAI PRONTO! Digita e dá enter (sair = exit)\n")

history = []
while True:
    prompt = input("tu> ")
    if prompt.lower() in ["exit", "sair", "q"]:
        break
    
    messages = [{"role": "user", "content": prompt}]
    text = tokenizer.apply_chat_template(messages, tokenize=False, add_generation_prompt=True)
    inputs = tokenizer(text, return_tensors="pt").to(model.device)
    
    outputs = model.generate(**inputs, max_new_tokens=512)
    response = tokenizer.decode(outputs[0][len(inputs.input_ids[0]):], skip_special_tokens=True)
    
    print(f"\nblueai> {response}\n")
    
    # AQUI ENTRA O EXECUTOR PA PUM
    if "cria arquivo" in response or "create_file" in prompt.lower():
        print("⚡ EXECUTANDO create_file...")
PY

python $HOME/blueai_chat.py
