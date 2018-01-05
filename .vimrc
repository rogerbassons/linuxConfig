call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'rhysd/vim-grammarous'
call plug#end()

set laststatus=2
syntax enable
colorscheme molokai
if has('gui_running')
  set guifont=Monospace\ 13
endif
set autoindent
set cindent

