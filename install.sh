#!/bin/bash

# Define the URL of the script within your repository
SCRIPT_URL="https://raw.githubusercontent.com/VictorRamosLima/repo-refresher/main/script.sh"

# Define the destination directory
DEST_DIR="/usr/local/bin"

# Verify if /usr/local/bin exists and create it if needed
if [ ! -d "$DEST_DIR" ]; then
  echo "Diretório $DEST_DIR não existe. Criando..."
  sudo mkdir -p "$DEST_DIR"
  if [ $? -ne 0 ]; then
    echo "Erro: Não foi possível criar o diretório $DEST_DIR."
    exit 1
  fi
fi

# Define the new script name
NEW_SCRIPT_NAME="repo_refresher"

echo "Downloading repo_refresher script..."
curl -o "$NEW_SCRIPT_NAME" "$SCRIPT_URL"

if [ -f "$NEW_SCRIPT_NAME" ]; then
  echo "Making script executable..."
  chmod +x "$NEW_SCRIPT_NAME"

  echo "Moving script to $DEST_DIR..."
  sudo mv "$NEW_SCRIPT_NAME" "$DEST_DIR/$NEW_SCRIPT_NAME"

  if [ -f "$DEST_DIR/$NEW_SCRIPT_NAME" ]; then
    echo "Installation successful. You can now use repo-refresher. For more information, just run 'repo_refresher --help'."
  else
    echo "Error: Installation failed."
    exit 1
  fi
else
  echo "Error: Download failed."
  exit 1
fi
