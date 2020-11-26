#!/usr/bin/env bash

# エラーが出たらそこでスクリプトを終了する
set -ue

DOT_DILECTORY="${HOME}/dotfiles"
REMOTE_URL="git@github.com:AtsushiNi/dotfiles.git"

# アプリのインストール
initialize() {
  # brew install
  brew_items=(
    git
    curl
    tig
    tmux
    neovim
    cask
  )
  echo $(tput setaf 2)brew install apps...$(tput sgr0)
  for item in "${brew_items[@]}";do
    brew install $item
    echo $item
  done

  # brew cask install(GUI apps)
  cask_items=(
    iterm2
    google-chrome
    visual-studio-code
    karabiner-elements
  )
  echo $(tput setaf 2)brew cask install GUI Apps...$(tput sgr0)
  for item in "${cask_items[@]}";do
    brew cask install $item
    echo $item
  done

  echo "cleanup Homebrew..."
  brew cleanup
  echo "Cleanup Homebrew completed!"

  echo $(tput setaf 2)install apps completed!$(tput sgr0)
}

# シンボリックリンクの作成(オプションがあればdotfilesの更新も)
make_symbolic_links() {
  echo $(tput setaf 2)start making symbolic links...$(tput sgr0)

  # dotfilesがなければダウンロード
  if [ ! -d ${DOT_DILECTORY} ]; then
    echo "Downloading dotfiles..."
    rm -rf ${DOT_DILECTORY}
    mkdir ${DOT_DILECTORY}
    git clone --recursive https://github.com/AtsushiNi/dotfiles
  fi

  cd ${DOT_DILECTORY}

  for f in .??*
  do
    # 無視したいファイルを追加
    [[ ${f} = ".git" ]] && continue
    [[ ${f} = ".gitignore" ]] && continue
    [[ ${f} = ".bin" ]] && continue
    [[ ${f} = ".DS_Store" ]] && continue
    ln -snfv ${DOT_DILECTORY}/${f} ${HOME}/${f}
  done

  echo $(tput setaf 2)making symbolic links completed!$(tput sgr0)
}

# Homebrewインストール
if [ which brew >/dev/null 2>&1 ];then
  echo $(tput setaf 2)install homebrew...$(tput sgr0)
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  echo "update homebrew..."
  brew update && brew upgrade
fi

make_symbolic_links
#initialize

exit 0
