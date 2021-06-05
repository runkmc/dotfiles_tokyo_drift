call plug#begin()
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'axvr/org.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'lervag/vimtex'
Plug 'vim-airline/vim-airline-themes'
Plug 'sainnhe/gruvbox-material'

" tpope
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

call plug#end()

if &compatible
	set nocompatible
endif
filetype plugin indent on
syntax enable
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 expandtab

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

" Some zettlekasten settings
" Go to index of notes and set working directory to my notes
nnoremap <leader>ni :e ~/notes/index.md<CR>:cd ~/notes<CR>

"Command and mapping for automatically creating new notes
let g:zettelkasten = "~/notes/"
command! -nargs=1 NewZettel :execute ":e" zettelkasten . strftime("%Y%m%d%H%M") . "-<args>.md"
nnoremap <leader>nz :NewZettel

"creating links with fzf
function! HandleFZF(file)
    let splitname = split(a:file, ':')[0]
    let filename = fnameescape(fnamemodify(splitname, ":t"))
    "why only the tail ?  I believe the whole filename must be linked unless everything is flat ...
    "let filename = fnameescape(a:file)
    let filename_wo_timestamp = fnameescape(fnamemodify(splitname, ":t:s/^[0-9]*-//"))
     " Insert the markdown link to the file in the current buffer
    let mdlink = "[ ".filename_wo_timestamp." ]( ".filename." )"
    put=mdlink
endfunction
command! -nargs=1 HandleFZF :call HandleFZF(<f-args>)

"Command and mapping for modified Ag search to insert links
command! -bang -nargs=* MAg call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'sink': 'HandleFZF'}), <bang>0)'
nnoremap <leader>nl :MAg<CR>
"
"set netrw external handler
let g:netrw_browsex_viewer="open"

"fix gx for now
nnoremap gX yaw:!open <C-R>"

" colors and purely visual things
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
set termguicolors
set background=dark
let g:gruvbox_material_background = 'soft'
colorscheme gruvbox-material
let g:airline_theme='gruvbox_material'
highlight Comment cterm=italic gui=italic
highlight String cterm=italic gui=italic
highlight Type cterm=italic gui=italic
highlight Normal ctermbg=NONE

" Spellbad settings
highlight clear SpellBad
highlight SpellBad guifg=#FFFFFF guibg=#FF0000 ctermfg=red cterm=underline
