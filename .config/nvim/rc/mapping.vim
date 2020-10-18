"mapping.vim

let mapleader = "\<Space>"

nnoremap ; :

nnoremap Y y$

nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

"NERDTree
nnoremap <leader>e :NERDTreeToggle<CR>

"定義ジャンプ
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
nmap <silent> gd <Plug>(coc-definition)
nnoremap <leader>/ :Rg<Space>
nnoremap <C-g> :exec 'Rg' expand('<cword>')<CR>
nnoremap <leader>p :GitFiles<CR>
nnoremap <leader>b :Buffers<CR>

