set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'preservim/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox'
Plugin 'preservim/nerdcommenter'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

call vundle#end()
filetype plugin indent on

" NERDTree
nmap <Leader>n :NERDTreeToggle<CR>

" NERDCommenter
let g:NERDSpaceDelims=1
let NERDTreeShowHidden=1

syntax on
set number
" set relativenumber
set tabstop=4
set shiftwidth=4
" set textwidth=80
set autoindent
" set smartindent
set nowrap
set linebreak
set cursorline
set colorcolumn=81
set noswapfile
set hlsearch
set incsearch
set ignorecase
set scrolloff=7

" Code folding
set foldmethod=indent
set foldlevel=99

" Move in wrapped lines
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$

" Color theme
let g:gruvbox_italic=1
let g:gruvbox_invert_selection=0
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_color_column='bg1'
let g:gruvbox_guisp_fallback='bg'	" enable spell check highlight
colorscheme gruvbox
set background=dark
set termguicolors

" " highlight! Normal guibg=NONE ctermbg=NONE
" " highlight! NonText guibg=NONE ctermbg=NONE

" let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 1

" Window changing keys
nmap <C-H> <C-W>h
nmap <C-L> <C-W>l
nmap <C-K> <C-W>k
nmap <C-J> <C-W>j
tnoremap <C-H> <C-W>h
tnoremap <C-L> <C-W>l
tnoremap <C-K> <C-W>k
tnoremap <C-J> <C-W>j

" Map Ctrl plus arrows to resize split
" From: https://github.com/alepapadop/vimrc/blob/master/vimrc
nnoremap <C-LEFT> <C-w>2<
nnoremap <C-RIGHT> <C-w>2>
nnoremap <C-UP> <C-w>2+
nnoremap <C-DOWN> <C-w>2-

set splitright

autocmd BufWinEnter * if &buftype == 'terminal' | setlocal bufhidden=hide | endif

nnoremap <Leader>v :source ~/.vimrc<CR>

" function! CursorChar()
	" return matchstr(getline('.'), '\%' . col('.') . 'c.')
" endfunction

" function! PrevChar()
	" return matchstr(getline('.'), '\%' . (col('.') - 1) . 'c.')
" endfunction

" function! IsBracketBlock(c)
	" let matching = ""
	" if a:c == "}"
		" let matching = "{"
	" elseif a:c == ")"
		" let matching = "("
	" elseif a:c == "]"
		" let matching = "["
	" endif
	" return matching != "" && (CursorChar() == a:c && PrevChar() == matching)
" endfunction

" function! IsBracketBlockAny()
	" return IsBracketBlock("}") || IsBracketBlock(")") || IsBracketBlock("]")
" endfunction

" inoremap <expr> <Enter> IsBracketBlockAny() ? '<Enter><Enter><Esc>ki<Tab>' : '<Enter>'

tnoremap <localleader><Esc> <C-\><C-n>

