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
  Plug 'itchyny/lightline.vim'

  "シンタックスハイライト
  Plug 'sheerun/vim-polyglot'
  Plug 'leafgarland/typescript-vim'

  "LSPクライアント
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  "fzf
  Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
  Plug 'junegunn/fzf.vim'

  "ファイラー
  Plug 'scrooloose/nerdtree'

  "git
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

  "カッコ補完
  Plug 'cohama/lexima.vim'

  "コメント
  Plug 'tpope/vim-commentary'

  "windowリサイズ
  Plug 'simeji/winresizer'

  "インデント表示
  Plug 'nathanaelkane/vim-indent-guides'

  "行末空白をハイライト
  Plug 'bronson/vim-trailing-whitespace'
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

"lightline
let g:lightline = {
  \ 'colorscheme': 'material',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
  \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'charvaluehex', 'fileformat', 'fileencoding', 'filetype' ] ]
  \ },
  \ 'tabline': { 'left': [ [ 'buffers' ] ], 'right': [ [ 'tabs' ] ]
  \ },
  \ 'component': {
  \   'charvaluehex': '0x%B'
  \ },
  \ 'component_function': {
  \   'fugitive': 'LightlineFugitive',
  \   'filename': 'LightlineFilename',
  \   'fileformat': 'MyFileformat',
  \   'filetype': 'MyFiletype'
  \ },
  \ 'component_expand': {
  \   'buffers': 'lightline#bufferline#buffers',
  \ },
  \ 'component_type': {
  \   'buffers': 'tabsel',
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': ' ', 'right': ' ' }
  \ }

"ステータスバー
function! LightlineModified()
  return &ft =~ 'help\|vimfiler' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction
function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler' && &readonly ? '⭤' : ''
endfunction
function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
  \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
  \  &ft == 'unite' ? unite#get_status_string() :
  \  &ft == 'vimshell' ? vimshell#get_status_string() :
  \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
  \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction
