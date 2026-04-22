#!/bin/zsh

set -e

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash && \
source ~/.zshrc && \
nvm install 24 && \
nvm use 24;

# Install ollama
sudo apt install -y zstd pciutils && \
if which ollama >/dev/null 2>&1; then
  echo "ollama is installed";
else
  echo "ollama not found" && \
  curl -fsSL https://ollama.com/install.sh | sh;
fi
ollama pull gemma4:26b
ollama pull gemma4:31b
ollama pull qwen3:235b

# Install openclaw
if which openclaw >/dev/null 2>&1; then
  echo "openclaw is installed";
else
  echo "openclaw not found" && \
  npm install -g openclaw@latest

