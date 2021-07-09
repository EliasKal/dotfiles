setlocal nowrap
setlocal shell=R
nnoremap <buffer> <localleader>q :qa!<Enter>
nnoremap <buffer> <localleader>t :vertical terminal<Enter><C-W>h
nnoremap <buffer> <localleader>r yy<C-W>l<C-W>"0<C-W>h
vnoremap <buffer> <localleader>r y<C-W>l<C-W>"0<C-W>h
nnoremap <buffer> <localleader>s :let @"=@%<Enter><C-W>lsource("<C-W>"0")<Enter><C-W>h
nnoremap <buffer> <localleader>p :let @"=expand("<cword>")<Enter><C-W>l<C-W>"0<Enter><C-W>h
nnoremap <buffer> <localleader>h :let @"=expand("<cword>")<Enter><C-W>lhead(<C-W>"0)<Enter><C-W>h
inoremap <buffer> <expr> { CursorChar() == "" ? '{}<Esc>i' : '{'
inoremap <buffer> <expr> ( CursorChar() == "" ? '()<Esc>i' : '('
inoremap <buffer> <expr> [ CursorChar() == "" ? '[]<Esc>i' : '['

