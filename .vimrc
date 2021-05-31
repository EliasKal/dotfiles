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

call vundle#end()
filetype plugin indent on

" NERDTree
" autocmd vimenter * NERDTree
nmap <Leader>n :NERDTreeToggle<CR>

" NERDCommenter
let g:NERDSpaceDelims = 1
let NERDTreeShowHidden=1

syntax on
set number
set relativenumber
set tabstop=4
set shiftwidth=4
" set textwidth=80
set autoindent
" set smartindent
set nowrap
set linebreak
set cursorline
" let &colorcolumn=join(range(81,999), ",")
" highlight ColorColumn ctermbg=236
set colorcolumn=81
set noswapfile
set hlsearch
set incsearch
set ignorecase

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
"autocmd vimenter * colorscheme gruvbox
colorscheme gruvbox
set background=dark
set termguicolors

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Window changing keys
nmap <C-H> <C-W>h
nmap <C-L> <C-W>l
nmap <C-K> <C-W>k
nmap <C-J> <C-W>j
tnoremap <C-H> <C-W>h
tnoremap <C-L> <C-W>l
tnoremap <C-K> <C-W>k
tnoremap <C-J> <C-W>j

set splitright

nnoremap <Leader>v :source ~/.vimrc<CR>

" augroup filetype_r
	" autocmd!
	" autocmd filetype r set nowrap
	" autocmd filetype r nnoremap <localleader>q :qa!<Enter>
	" autocmd filetype r set shell=R
	" autocmd filetype r nnoremap <localleader>t :vertical terminal<Enter><C-W>h
	" autocmd filetype r nnoremap <localleader>r yy<C-W>l<C-W>"0<C-W>h
	" autocmd filetype r vnoremap <localleader>r y<C-W>l<C-W>"0<C-W>h
	" autocmd filetype r nnoremap <localleader>s :let @"=@%<Enter><C-W>lsource("<C-W>"0")<Enter><C-W>h
	" autocmd filetype r nnoremap <localleader>p :let @"=expand("<cword>")<Enter><C-W>l<C-W>"0<Enter><C-W>h
	" autocmd filetype r nnoremap <localleader>h :let @"=expand("<cword>")<Enter><C-W>lhead(<C-W>"0)<Enter><C-W>h
	" " autocmd filetype r imap { {}<Esc>i
	" autocmd filetype r inoremap <expr> { CursorChar() == "" ? '{}<Esc>i' : '{'
	" autocmd filetype r inoremap <expr> ( CursorChar() == "" ? '()<Esc>i' : '('
	" autocmd filetype r inoremap <expr> [ CursorChar() == "" ? '[]<Esc>i' : '['
	" " autocmd filetype r tnoremap <localleader><Esc> <C-\><C-n>
" augroup END

function! TmuxSendKeys(cmd)
	" execute "silent !tmux send-keys -t right -l \"" . a:cmd . "\" \\; send-keys -t right Enter"
	execute "silent !tmux send-keys -t right " . a:cmd
	redraw!
endfunction

function! CurrentLineToTmux() 
	let l:cmd = "'" . getline(".") . "' 'Enter' "
	call TmuxSendKeys(l:cmd)
endfunction

function! VisualToTmux()
	let l:cmd = ""
	for l:line in getline(line("'<"), line("'>"))
		let l:cmd .= "'" . l:line . "' 'Enter' "
	endfor
	call TmuxSendKeys(l:cmd)
endfunction



" ==============================================================================
" R support
" ==============================================================================

function! TmuxSourceR()
	call TmuxSendKeys("'source(\"" . @% . "\")' 'Enter'")
endfunction

function! TmuxPrintR()
	call TmuxSendKeys("'print(" . expand("<cword>") . ")' 'Enter'")
endfunction

augroup filetype_r
	autocmd!
	autocmd filetype r set nowrap
	autocmd filetype r nnoremap <localleader>s :call TmuxSourceR()<CR>
	autocmd filetype r nnoremap <localleader>r :call CurrentLineToTmux()<CR>
	autocmd filetype r vnoremap <localleader>r :<C-U>call VisualToTmux()<CR>
	autocmd filetype r nnoremap <localleader>p :call TmuxPrintR()<CR>
augroup END


" nnoremap <localleader>r :call CurrentLineToTmux()<CR>
" vnoremap <localleader>r :<C-U>call VisualToTmux()<CR>






