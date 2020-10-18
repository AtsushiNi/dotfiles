"color.vim

if (has("termguicolors"))
  set termguicolors
endif
set background=dark

"行番号の色
autocmd ColorScheme * highlight LineNr guifg=#808080
"カーソル行の色
set cursorline

colorscheme molokai
