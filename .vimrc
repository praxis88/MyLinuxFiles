unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

call plug#begin('~/.vim/plugged')

Plug 'tomasiser/vim-code-dark'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'

call plug#end()


set number relativenumber
set clipboard=unnamed
set runtimepath+=~/.vim/plugged/dracula
set background=dark
set t_Co=256
set spell spelllang=en_us

syntax on
colorscheme codedark  
let g:airline_theme = 'codedark'

vnoremap <C-c> "+y :let @+=@*<CR>
map <C-v> "+P




