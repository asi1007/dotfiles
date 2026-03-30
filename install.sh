#!/bin/bash
set -e

DOTFILES_DIR="$HOME/dotfiles"

echo "=============================="
echo "🧩 Installing macOS dotfiles..."
echo "=============================="

# Homebrew の確認・インストール
if ! command -v brew &> /dev/null; then
  echo "🍺 Homebrew not found. Installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "✅ Homebrew already installed"
fi

# Brewfile に基づいてパッケージをインストール
if [ -f "$DOTFILES_DIR/Brewfile" ]; then
  echo "📦 Installing Brew packages..."
  brew bundle --file="$DOTFILES_DIR/Brewfile"
fi

# シンボリックリンク作成関数
link() {
  src="$DOTFILES_DIR/$1"
  dest="$HOME/$1"

  # 既存ファイルのバックアップ
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    echo "📦 Backing up existing $dest → ${dest}.backup"
    mv "$dest" "${dest}.backup"
  fi

  # ディレクトリ作成（必要なら）
  mkdir -p "$(dirname "$dest")"

  # シンボリックリンク作成
  ln -sf "$src" "$dest"
  echo "🔗 Linked: $dest → $src"
}

# 個別ファイルのリンク
link ".zshrc"
link ".gitconfig"
link ".yabairc"
link ".skhdrc"

# config ディレクトリ配下をまとめてリンク
for file in $(find "$DOTFILES_DIR/.config" -type f); do
  rel_path="${file#$DOTFILES_DIR/}"
  link "$rel_path"
done

# .claude ディレクトリ配下をまとめてリンク
if [ -d "$DOTFILES_DIR/.claude" ]; then
  for file in $(find "$DOTFILES_DIR/.claude" -type f -not -name ".gitignore"); do
    rel_path="${file#$DOTFILES_DIR/}"
    link "$rel_path"
  done
fi

echo "✅ Dotfiles installation complete!"
echo "You may need to restart your terminal."

