#!/bin/bash

set -e

apt update
apt -y install curl tmux

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash && \
source ~/.bashrc && \
nvm install 24 && \
nvm use 24;

# Install ollama
apt install -y zstd pciutils && \
if which ollama >/dev/null 2>&1; then
  echo "ollama is installed";
else
  echo "ollama not found" && \
  curl -fsSL https://ollama.com/install.sh | sh;
  source ~/.bashrc;
  ollama serve 2>&1 > /dev/null &
  sleep 5
fi
ollama pull gemma4
ollama pull gemma4:26b
ollama pull gemma4:31b
ollama pull qwen3:235b

# Install homebrew
apt install -y git
curl -fsSL "https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh" | bash

# Install openclaw
if which openclaw >/dev/null 2>&1; then
  echo "openclaw is installed";
else
  echo "openclaw not found" && \
  npm install -g openclaw@latest
  npm install -g @larksuiteoapi/node-sdk
  npm install -g nostr-tools
  npm install -g @slack/web-api
  npm install -g jimp
  npm install -g @whiskeysockets/baileys
  source ~/.bashrc;
fi
