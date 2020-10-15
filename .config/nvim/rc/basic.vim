"basic.vim

" ファイルエンコーディング検出設定
set fileencodings=utf-8,cp932,euc-jp,iso-20220-jp,default,latin

" tab
set tabstop=2
set shiftwidth=2

" 折り返し時のインデント
set breakindent

" 日本語の途中でも折り返す
set formatoptions+=mM

" クリップボード
set clipboard+=unnamed

" 行番号
set number

" split
set splitright

" 外部でファイルに変更があると読み込み直す
set autoread

" スペルチェックから日本語を外す
set spelllang+=cjk

" マウス
set mouse=a

" 検索結果のハイライト
set hlsearch

"ノーマルモードへの切り替えを早くする
set ttimeoutlen=50
