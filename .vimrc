unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

call plug#begin('~/.vim/plugged')

Plug 'tomasiser/vim-code-dark'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


set number relativenumber
set clipboard=unnamed
set runtimepath+=~/.vim/plugged/dracula
set background=dark

set t_Co=256
syntax on
colorscheme codedark  

vnoremap <C-c> "+y :let @+=@*<CR>
map <C-v> "+P




