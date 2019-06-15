if &compatible
	set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.local/share/dein')
	call dein#begin('~/.local/share/dein')

	call dein#add('~/.local/share/dein')
	call dein#add('Shougo/deoplete.nvim')
	call dein#add('christoomey/vim-tmux-navigator')
	" tpope plugins
	call dein#add('tpope/vim-repeat')
	call dein#add('tpope/vim-surround')
	call dein#add('tpope/vim-unimpaired')
	call dein#add('tpope/dispatch')
	" colors/display
	call dein#add('arcticicestudio/nord-vim')
	call dein#add('itchyny/lightline.vim')
	"language specific
	call dein#add('itchyny/vim-haskell-indent')
        call dein#add('elixir-editors/vim-elixir')
        call dein#add('elmcast/elm-vim')

	if !has('nvim')
		call dein#add('roxma/nvim-yarp')
		call dein#add('roxma/vim-hug-neovim-rpc')
	endif

	call dein#end()
	call dein#save_state()
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

" vim-test settings
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
let test#strategy = "dispatch"

" Leader mappings
" nnoremap <SPACE> <Nop>
let mapleader = "\<SPACE>"

" colors and purely visual things
colorscheme nord
highlight Comment cterm=italic gui=italic
highlight String cterm=italic gui=italic
let g:lightline = {'colorscheme':'nord',}
" highlight Type cterm=italic gui=italic

" Spellbad settings
highlight clear SpellBad
highlight SpellBad guifg=#FFFFFF guibg=#FF0000 ctermfg=red cterm=underline
