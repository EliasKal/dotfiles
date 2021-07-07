setlocal nowrap
nnoremap <localleader>q :qa!<Enter>
setlocal shell=R
nnoremap <localleader>t :vertical terminal<Enter><C-W>h
nnoremap <localleader>r yy<C-W>l<C-W>"0<C-W>h
vnoremap <localleader>r y<C-W>l<C-W>"0<C-W>h
nnoremap <localleader>s :let @"=@%<Enter><C-W>lsource("<C-W>"0")<Enter><C-W>h
nnoremap <localleader>p :let @"=expand("<cword>")<Enter><C-W>l<C-W>"0<Enter><C-W>h
nnoremap <localleader>h :let @"=expand("<cword>")<Enter><C-W>lhead(<C-W>"0)<Enter><C-W>h
inoremap <expr> { CursorChar() == "" ? '{}<Esc>i' : '{'
inoremap <expr> ( CursorChar() == "" ? '()<Esc>i' : '('
inoremap <expr> [ CursorChar() == "" ? '[]<Esc>i' : '['

