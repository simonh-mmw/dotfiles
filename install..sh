#!/bin/bash
set -e

echo "🔧 Setting up tmux config..."

# Install correct conf
    HOST=$(hostname -s)
    if [[ "$HOST" == "WEB-0018-LT" ]]; then
        echo "💻 Detected local machine ($HOST) — using local config"
        ln -sf "$HOME/dotfiles/tmux.local.conf" "$HOME/.tmux.conf"
    else
        echo "🌐 Detected server ($HOST) — using server config"
        ln -sf "$HOME/dotfiles/tmux.server.conf" "$HOME/.tmux.conf"
    fi
fi

# Install TPM (tmux plugin manager)
TPM_DIR="$HOME/.tmux/plugins/tpm"
if [ ! -d "$TPM_DIR" ]; then
    echo "⬇️ Installing TPM..."
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
else
    echo "✅ TPM already installed."
fi

echo "👉 Start tmux with: tmux -f ~/dotfiles/.tmux.conf"
echo "🎉 Then press Ctrl-a then I to install plugins."
