set nocompatible
filetype off

" let g:airline_theme='gruvbox'

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

function! CursorChar()
	return matchstr(getline('.'), '\%' . col('.') . 'c.')
endfunction

function! PrevChar()
	return matchstr(getline('.'), '\%' . (col('.') - 1) . 'c.')
endfunction

function! IsBracketBlock(c)
	let matching = ""
	if a:c == "}"
		let matching = "{"
	elseif a:c == ")"
		let matching = "("
	elseif a:c == "]"
		let matching = "["
	endif
	return matching != "" && (CursorChar() == a:c && PrevChar() == matching)
endfunction

function! IsBracketBlockAny()
	return IsBracketBlock("}") || IsBracketBlock(")") || IsBracketBlock("]")
endfunction

inoremap <expr> <Enter> IsBracketBlockAny() ? '<Enter><Enter><Esc>ki<Tab>' : '<Enter>'

tnoremap <localleader><Esc> <C-\><C-n>

augroup filetype_md
	autocmd!
	autocmd filetype markdown set wrap
	autocmd filetype markdown setlocal spell spelllang=en,el
	autocmd filetype markdown set cc=
	autocmd filetype markdown syn region math start=/\$\$/ end=/\$\$/
	autocmd filetype markdown syn match math '\$[^$].\{-}\$'
	autocmd filetype markdown hi link math Statement
	autocmd filetype markdown set shell=bash
	autocmd filetype markdown nmap <localleader>t :vertical terminal<Enter><C-W>h
augroup END

augroup filetype_r
	autocmd!
	autocmd filetype r set nowrap
	autocmd filetype r nnoremap <localleader>q :qa!<Enter>
	autocmd filetype r set shell=R
	autocmd filetype r nnoremap <localleader>t :vertical terminal<Enter><C-W>h
	autocmd filetype r nnoremap <localleader>r yy<C-W>l<C-W>"0<C-W>h
	autocmd filetype r vnoremap <localleader>r y<C-W>l<C-W>"0<C-W>h
	autocmd filetype r nnoremap <localleader>s :let @"=@%<Enter><C-W>lsource("<C-W>"0")<Enter><C-W>h
	autocmd filetype r nnoremap <localleader>p :let @"=expand("<cword>")<Enter><C-W>l<C-W>"0<Enter><C-W>h
	autocmd filetype r nnoremap <localleader>h :let @"=expand("<cword>")<Enter><C-W>lhead(<C-W>"0)<Enter><C-W>h
	" autocmd filetype r imap { {}<Esc>i
	autocmd filetype r inoremap <expr> { CursorChar() == "" ? '{}<Esc>i' : '{'
	autocmd filetype r inoremap <expr> ( CursorChar() == "" ? '()<Esc>i' : '('
	autocmd filetype r inoremap <expr> [ CursorChar() == "" ? '[]<Esc>i' : '['
	" autocmd filetype r tnoremap <localleader><Esc> <C-\><C-n>
augroup END

" nnoremap <Leader>r 0"ay$:exe "silent !tmux send-keys -t right '" . @a . "' 'Enter'" \| redraw!<CR>


function! TmuxSendKeys(cmd)
	execute "silent !tmux send-keys -t right " . a:cmd | redraw!
endfunction

function! CurrentLineToTmux() 
	let l:cmd .= "'" . getline(".") . "' 'Enter' "
	call TmuxSendKeys(l:cmd)
endfunction

function! VisualToTmux()
	let l:cmd = ""
	for l:line in getline(line("'<"), line("'>"))
		let l:cmd .= "'" . l:line . "' 'Enter' "
	endfor
	call TmuxSendKeys(l:cmd)
endfunction

function! TmuxSourceR()
	call TmuxSendKeys("'source(\"" . @% . "\")' 'Enter'")
endfunction

" augroup filetype_r
	" autocmd!
	" autocmd filetype r set nowrap
	" autocmd filetype r nnoremap <localleader>r :<C-U>call CurrentLineToTmux()<CR>
	" autocmd filetype r vnoremap <localleader>r :<C-U>call VisualToTmux()<CR>
	" " autocmd filetype r nmap <localleader>s :let @"=@%<Enter><C-W>lsource("<C-W>"0")<Enter><C-W>h
	" " autocmd filetype r nmap <localleader>p :let @"=expand("<cword>")<Enter><C-W>l<C-W>"0<Enter><C-W>h
	" " autocmd filetype r nmap <localleader>h :let @"=expand("<cword>")<Enter><C-W>lhead(<C-W>"0)<Enter><C-W>h
	" " " autocmd filetype r imap { {}<Esc>i
	" " autocmd filetype r imap <expr> { CursorChar() == "" ? '{}<Esc>i' : '{'
	" " autocmd filetype r imap <expr> ( CursorChar() == "" ? '()<Esc>i' : '('
	" " autocmd filetype r imap <expr> [ CursorChar() == "" ? '[]<Esc>i' : '['
	" " " autocmd filetype r tnoremap <localleader><Esc> <C-\><C-n>
" augroup END

" vnoremap <Leader>r :<C-U>call VisualToTmux()<CR>
" nnoremap <Leader>s :<C-U>call TmuxSourceR()<CR>

augroup filetype_rmd
	autocmd!
	autocmd filetype rmd set wrap
	autocmd filetype rmd setlocal spell spelllang=en,el
	autocmd filetype rmd nmap <localleader>q :qa!<Enter>
	autocmd filetype rmd set shell=R
	autocmd filetype rmd nmap <localleader>t :vertical terminal<Enter><C-W>h
	autocmd filetype rmd nnoremap <localleader>rmd :-1read $HOME/dotfiles/templates/rmd.tmpl<CR>jwwa
	autocmd filetype rmd nmap <localleader>s :let @"=@%<Enter><C-W>lrmarkdown::render("<C-W>"0", output_dir = "output")<Enter><C-W>h
	autocmd filetype rmd nmap <localleader>rr yy<C-W>l<C-W>"0<C-W>h
	autocmd filetype rmd nmap <localleader>rc /```<Enter>NjVnky<C-W>l<C-W>"0<C-W>h
	autocmd filetype rmd vmap <localleader>r y<C-W>l<C-W>"0<C-W>h
	autocmd filetype rmd nnoremap <localleader>ic :-1read $HOME/dotfiles/templates/rmd_chunk.tmpl<CR>ji
augroup END

augroup filetype_sql
	autocmd!
	autocmd filetype sql set nowrap
	autocmd filetype sql nmap <localleader>q :qa!<Enter>
	autocmd filetype sql set shell=bash
	autocmd filetype sql nmap <localleader>t :vertical terminal<Enter>psql "dbname=mimic user=elias options=--search_path=mimiciii"<Enter><C-W>h
	autocmd filetype sql nmap <localleader>r yy<C-W>l<C-W>"0<C-W>h
	autocmd filetype sql vmap <localleader>r y<C-W>l<C-W>"0<C-W>h
	autocmd filetype sql nmap <localleader>s :let @"=@%<Enter><C-W>l\include <C-W>"0<Enter><C-W>h
	autocmd filetype sql nmap <localleader>p :let @"=expand("<cword>")<Enter><C-W>lSELECT * FROM <C-W>"0 LIMIT 10;<Enter><C-W>h
	autocmd filetype sql nnoremap <localleader>v :-1read $HOME/dotfiles/templates/sql_create_view.tmpl<CR>4w
augroup END

augroup filetype_python
	autocmd!
	autocmd filetype python set nowrap
	autocmd filetype python nmap <localleader>q :qa!<Enter>
	autocmd filetype python set shell=python
	autocmd filetype python nmap <localleader>t :vertical terminal<Enter><C-W>h
	autocmd filetype python nmap <localleader>r yy<C-W>l<C-W>"0<C-W>h
	autocmd filetype python vmap <localleader>r y<C-W>l<C-W>"0<C-W>h
	autocmd filetype python nmap <localleader>s :let @"=@%<Enter><C-W>lexec(open("<C-W>"0").read())<Enter><C-W>h
	autocmd filetype python nmap <localleader>p :let @"=expand("<cword>")<Enter><C-W>l<C-W>"0<Enter><C-W>h
augroup END

augroup filetype_julia
	autocmd!
	autocmd filetype julia set shell=julia
	autocmd filetype julia nmap <localleader>t :vertical terminal<Enter><C-W>h
	autocmd filetype julia nmap <localleader>s :let @"=@%<Enter><C-W>linclude("<C-W>"0")<Enter><C-W>h
	autocmd filetype julia nmap <localleader>q :qa!<Enter>
augroup END

augroup filetype_html
	autocmd!
	autocmd filetype html nnoremap <localleader>html :-1read $HOME/dotfiles/templates/html.tmpl<CR>3jwf>a
augroup END

augroup filetype_js
	autocmd!
	autocmd filetype javascript nnoremap <localleader>d3 :-1read $HOME/dotfiles/templates/d3js.tmpl<CR>3jmd6jms7jmc'd
augroup END

