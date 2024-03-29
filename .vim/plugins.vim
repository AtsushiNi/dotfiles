" VimPlug
call plug#begin('~/.vim/plugged')

Plug 'mhinz/vim-startify'

Plug 'scrooloose/nerdtree'
" Plug 'vwxyutarooo/nerdtree-devicons-syntax'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'cohama/lexima.vim'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'simeji/winresizer'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'qpkorr/vim-bufkill'

" Plug 'zxqfl/tabnine-vim', { 'branch': 'master', 'for': ['ruby', 'go'] }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'szw/vim-tags'

Plug 'bronson/vim-trailing-whitespace'
Plug 'editorconfig/editorconfig-vim'
Plug 'sheerun/vim-polyglot'

Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'javascript.jsx', 'typescript', 'typescript.jsx'] }
Plug 'leafgarland/typescript-vim'

Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-rbenv', { 'for': 'ruby' }
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'tpope/vim-endwise', { 'for': 'ruby' }

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }

Plug 'thinca/vim-quickrun'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'haishanh/night-owl.vim'
Plug 'jpo/vim-railscasts-theme'
Plug 'tomasr/molokai'

Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'ryanoasis/vim-devicons'

Plug 'skanehira/translate.vim'

Plug 'skanehira/getpr.vim'
call plug#end()

" ==================================================================
"   night-owl.vim
" ==================================================================
colorscheme iceberg

" ==================================================================
"   lightline.vim
" ==================================================================
set showtabline=2

nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>

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

let g:lightline#bufferline#show_number = 1
let g:lightline#bufferline#enable_devicons = 1

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
function! LightlineFugitive()
  if &ft !~? 'vimfiler' && exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? '⭠ '.branch : ''
  endif
  return ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction
function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" ==================================================================
"   nerdtree
" ==================================================================
let NERDTreeShowHidden = 1
nnoremap <leader>e :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ==================================================================
"   vim-startify
"   参考: http://mjhd.hatenablog.com/entry/recommendation-of-vim-startify
" ==================================================================
let g:startify_files_number = 5
let g:startify_bookmarks = [
  \ '~/.config/nvim/basic.vim',
  \ '~/.config/nvim/plugins.vim',
  \ '~/.zshrc'
  \ ]

function! s:center(lines) abort
  let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
  let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
  return centered_lines
endfunction

let g:startify_custom_header = s:center([
  \'   __  __    _                 ____',
  \'  / /_/ /_  (_)___  ________  / / /__  _____',
  \' / __/ __ \/ / __ \/ ___/ _ \/ / / _ \/ ___/',
  \'/ /_/ / / / / / / / /__/  __/ / /  __/ /',
  \'\__/_/ /_/_/_/ /_/\___/\___/_/_/\___/_/',
  \'',
  \'             _    ___',
  \'            | |  / (_)___ ___',
  \'            | | / / / __ `__ \',
  \'            | |/ / / / / / / /',
  \'            |___/_/_/ /_/ /_/',
  \'',
  \])

" ==================================================================
"   vim-indent-guides
" ==================================================================
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'startify', 'terminal', 'fzf']

" ==================================================================
"   vim-bufkill
" ==================================================================
nnoremap <leader>q :exec 'BW'<CR>

" ==================================================================
"   vim-polyglot
" ==================================================================
let g:polyglot_disabled = ['css']

" ==================================================================
"   vim-bufkill
" ==================================================================
let g:BufKillCreateMappings = 0

" ==================================================================
"   vim-gitgutter
" ==================================================================
let g:gitgutter_map_keys = 0

" ==================================================================
"   vim-fugitive
" ==================================================================
nnoremap [fugitive] <Nop>
nmap <space>g [fugitive]

nnoremap <silent> [fugitive]s :Gstatus<CR><C-w>T
nnoremap <silent> [fugitive]a :Gwrite<CR>
nnoremap <silent> [fugitive]c :Gcommit-v<CR>
nnoremap <silent> [fugitive]b :Gblame<CR>
nnoremap <silent> [fugitive]d :Gdiff<CR>
nnoremap <silent> [fugitive]m :Gmerge<CR>

" ==================================================================
"   coc.nvim
" ==================================================================
set cmdheight=2
set updatetime=300
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" ==================================================================
"   fzf.vim
" ==================================================================
" preview
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=? -complete=dir GitFiles
  \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

nnoremap <leader>/ :Rg<Space>
nnoremap <C-g> :exec 'Rg' expand('<cword>')<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>p :GitFiles<CR>
nnoremap <leader>F :GFiles?<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>l :BLines<CR>
nnoremap <leader>h :History<CR>

" ==================================================================
"   vim-go
" ==================================================================
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet']

" ==================================================================
"   translate.vim
" ==================================================================
nnoremap <C-t> :Translate<CR>
xnoremap <C-t> :Translate<CR>
