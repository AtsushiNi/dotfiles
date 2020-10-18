"mapping.vim

let mapleader = "\<Space>"

nnoremap ; :

nnoremap Y y$

nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

"NERDTree
nnoremap <leader>e :NERDTreeToggle<CR>

"定義ジャンプ
nmap <silent> gd <Plug>(coc-definition)
nnoremap <leader>/ :Rg<Space>
nnoremap <C-g> :exec 'Rg' expand('<cword>')<CR>
nnoremap <leader>p :GitFiles<CR>
nnoremap <leader>b :Buffers<CR>

