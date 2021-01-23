call plug#begin()
Plug 'morhetz/gruvbox'
call plug#end()

if &compatible
	set nocompatible
endif
filetype plugin indent on
syntax enable

" general option setting and whatnot
set expandtab
set autoindent
set backspace=2 " Backspace like a normal person
set clipboard=unnamed
set colorcolumn=79
set fo+=n
set fo+=q
set fo-=o
set fo-=r
set formatoptions+=1
set hidden
set hlsearch
set incsearch
set laststatus=2
set lbr
set linebreak
set matchtime=2
set nofoldenable
set nolist
set noshowmode
set noswapfile
set number
set shiftround
set showmatch
set showmode
set textwidth=79

" Some mappings
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap / /\v
nnoremap <Left> <C-PageUp>
nnoremap <Right> <C-PageDown>
nnoremap <Up> :tabnew<CR> 
nnoremap <Down> :tabc<CR> 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>
inoremap <Left> <C-PageUp>
inoremap <Right> <C-PageDown>
inoremap <Up> <Esc>:tabnew<CR> 
inoremap <Down> <Esc>:tabc<CR> 
vnoremap . :norm.<CR>

" Leader mappings
" nnoremap <SPACE> <Nop>
let mapleader = "\<SPACE>"

" colors and purely visual things
let g:gruvbox_italic=1
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
set termguicolors
colorscheme gruvbox
highlight Comment cterm=italic gui=italic
highlight String cterm=italic gui=italic
highlight Type cterm=italic gui=italic
highlight Normal ctermbg=NONE

" Spellbad settings
highlight clear SpellBad
highlight SpellBad guifg=#FFFFFF guibg=#FF0000 ctermfg=red cterm=underline
