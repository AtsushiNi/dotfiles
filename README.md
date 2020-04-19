# dotfiles

## Refs
- ミニマルに始めるDotfiles自動化計画
https://qiita.com/okamos/items/40966158d0271ae7198b#%E8%87%AA%E5%8B%95%E5%8C%96%E3%82%92%E3%81%BE%E3%81%A8%E3%82%81%E3%82%8B%E3%81%A8

## Setup

### Command
```
bash -c "$(curl -fsSL https://raw.githubusercontent.com/AtsushiNi/dotfiles/master/.bin/install.sh)" -s initialize
```

### Arguments
-s initialize : アプリのインストール
-s deploy : dotfilesの更新とシンボリックリンクの作成
-s initialize deploy : initializeのあとdeploy

### Options
-f : dotfilesを上書きする
