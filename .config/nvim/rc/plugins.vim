"plugins.vim

let g:polyglot_disabled = ['csv', 'styled-components']

"vim-plug
if has('vim_starting')
  set rtp+=~/.vim/plugged/vim-plug
  if !isdirectory(expand('~/.vim/plugged/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -p ~/.vim/plugged/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
  end
endif

call plug#begin('~/.config/nvim/plugged')
        "カラースキーム
        Plug 'cocopon/iceberg.vim', {'do': 'cp colors/* ~/.config/nvim/colors/'}
        Plug 'tomasr/molokai', {'do': 'cp colors/* ~/.config/nvim/colors/'}

        "start up
        Plug 'mhinz/vim-startify'

        "ステータスバー
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'

        "ハイライト
        Plug 'sheerun/vim-polyglot'

        "LSPクライアント
        Plug 'neoclide/coc.nvim', {'branch': 'release'}

        "fzf
        Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
        Plug 'junegunn/fzf.vim'

        "ファイラー
        Plug 'scrooloose/nerdtree'
call plug#end()

"startify
let s:startify_ascii_header = [
 \ '                                        ▟▙            ',
 \ '                                        ▝▘            ',
 \ '██▃▅▇█▆▖  ▗▟████▙▖   ▄████▄   ██▄  ▄██  ██  ▗▟█▆▄▄▆█▙▖',
 \ '██▛▔ ▝██  ██▄▄▄▄██  ██▛▔▔▜██  ▝██  ██▘  ██  ██▛▜██▛▜██',
 \ '██    ██  ██▀▀▀▀▀▘  ██▖  ▗██   ▜█▙▟█▛   ██  ██  ██  ██',
 \ '██    ██  ▜█▙▄▄▄▟▊  ▀██▙▟██▀   ▝████▘   ██  ██  ██  ██',
 \ '▀▀    ▀▀   ▝▀▀▀▀▀     ▀▀▀▀       ▀▀     ▀▀  ▀▀  ▀▀  ▀▀',
 \ '',
 \]

let g:startify_custom_header = map(s:startify_ascii_header +
        \ startify#fortune#quote(), '"   ".v:val')

" スタート時にgitのルートディレクトリを探す
let g:startify_change_to_vcs_root = 1

"NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1
