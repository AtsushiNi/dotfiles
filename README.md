# dotfiles

## Refs
- ミニマルに始めるDotfiles自動化計画
https://qiita.com/okamos/items/40966158d0271ae7198b#%E8%87%AA%E5%8B%95%E5%8C%96%E3%82%92%E3%81%BE%E3%81%A8%E3%82%81%E3%82%8B%E3%81%A8

## Setup

1. Command line tools for XCode
```
xcode-select --install
```

2. Command
```
bash -c "$(curl -fsSL https://raw.githubusercontent.com/AtsushiNi/dotfiles/master/.bin/install.sh)"
```

3. iterm
Preferences -> General -> Preferences<br>
"Load preferences from ~"にチェックを入れて、~/.itermを指定する<br>
OS再起動(itermも再起動しないといけないかも)

4. Vim
Vimを立ち上げて、:Pluginstall

5. Finder
環境設定 -> サイドバー<br>
サイドバーにホームディレクトリを表示させる

## notice
- ~/dotfilesが存在すると、そのdotfilesを元に動作します。dotfilesをgithubのものに更新したい場合はフォルダを削除してから実行してください
- 設定が反映されない場合、再起動すると良いかも？？