#!/usr/bin/env bash

# エラーが出たらそこでスクリプトを終了する
set -ue

DOT_DILECTORY="${HOME}/dotfiles"
REMOTE_URL="git@github.com:AtsushiNi/dotfiles.git"

# オプション処理
while getopts f opt; do
  case ${opt} in
    f) OVERWRITE=true;;
  esac
done

# アプリのインストール
initialize() {
  echo "start initialize..."

  # Homebrewインストール
  if [ which brew >/dev/null 2>&1 ];then
    echo "install homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    echo "update homebrew..."
    brew update && brew upgrade
  fi

  # brew install
  brew_items=(
    git
    curl
    tig
    tmux
    cask
  )
  echo "brew install apps..."
  for item in "${brew_items[@]}";do
    brew install $item
  done

  # brew cask install(GUI apps)
  cask_items=(
    iterm2
    google-chrome
    visual-studio-code
    karabiner-elements
  )
  echo "brew cask install GUI Apps..."
  for item in "${cask_items[@]}";do
    brew cask install $item
  done

  echo "cleanup Homebrew..."
  brew cleanup
  echo $(tput setaf 2)Cleanup Homebrew completed!$(tput sgr0)

  echo $(tput setaf 2)Deplot dotfiles completed!$(tput sgr0)
}

# シンボリックリンクの作成(オプションがあればdotfilesの更新も)
make_symbolic_links() {
  echo "start deploy..."

  # dotfilesがなければダウンロード
  if [ -n "${OVERWRITE}" -o ! -d ${DOT_DILECTORY} ]; then
    echo "Downloading dotfiles..."
    rm -rf ${DOT_DILECTORY}
    mkdir ${DOT_DILECTORY}
    git clone --recursive "${REMOTE_URL}" "${DOT_DILECTORY}"
  fi

  cd ${DOT_DILECTORY}

  for f in .??*
  do
    # 無視したいファイルを追加
    [[ ${f} = ".git" ]] && continue
    [[ ${f} = ".gitignore" ]] && continue
    ln -snfv ${DOT_DILECTORY}/${f} ${HOME}/${f}
  done

  echo $(tput setaf 2)Initialize completed!$(tpuut sgr0)
}

# 引数で場合わけ
for p in $*;do
  command=$p
  case $command in
    deploy)
      make_symbolic_links
      ;;
    init)
      initialize
      ;;
    *) echo("オプションをつけてください");;
  esac
done

exit 0
