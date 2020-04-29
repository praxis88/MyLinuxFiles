
call plug#begin('~/.config/nvim/plugged')
Plug 'tomasiser/vim-code-dark'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
call plug#end()

set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum

set number relativenumber
set clipboard+=unnamedplus
set background=dark
"set t_Co=256
set nospell spelllang=en_us
set wrap linebreak nolist
set mouse=a
set cursorline

syntax on
colorscheme codedark
let g:airline_theme = 'codedark'

set termguicolors
let g:Hexokinase_highlighters = ['backgroundfull']
let g:Hexokinase_optInPatterns = 'full_hex,triple_hex,rgb,rgba,hsl,hsla,colour_names'
let g:airline_powerline_fonts = 1

vnoremap <C-c> "+y 
map <C-v> "+P

" air-line

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

