#!/usr/bin/env bash

set -e

KEY_NAME="id_ansible"
SSH_DIR="$HOME/.ssh"
PRIVATE_KEY_PATH="$SSH_DIR/$KEY_NAME"
PUBLIC_KEY_PATH="$SSH_DIR/$KEY_NAME.pub"
PROJECT_PUBLIC_KEY_DIR="keys"
PROJECT_PUBLIC_KEY_PATH="$PROJECT_PUBLIC_KEY_DIR/$KEY_NAME.pub"

echo "🔐 Checking SSH key for Ansible..."

# Create .ssh directory if not exists
mkdir -p "$SSH_DIR"
chmod 700 "$SSH_DIR"

# Generate SSH key if not exists
if [[ -f "$PRIVATE_KEY_PATH" ]]; then
  echo "✅ SSH key already exists: $PRIVATE_KEY_PATH"
else
  echo "🚀 Generating SSH key..."
  ssh-keygen -t ed25519 -f "$PRIVATE_KEY_PATH" -C "ansible-terraform-key" -N ""
  echo "✅ SSH key generated"
fi

# Create project keys directory
mkdir -p "$PROJECT_PUBLIC_KEY_DIR"

# Copy public key to project directory
cp "$PUBLIC_KEY_PATH" "$PROJECT_PUBLIC_KEY_PATH"
chmod 644 "$PROJECT_PUBLIC_KEY_PATH"

echo "📁 Public key copied to $PROJECT_PUBLIC_KEY_PATH"

echo "🎉 SSH key setup completed!"
