setlocal nowrap
setlocal shell=bash
nnoremap <buffer> <localleader>t :vertical terminal<Enter>julia<Enter><C-W>h
" nnoremap <buffer> <localleader>s :let @"=@%<Enter><C-W>linclude("<C-W>"0")<Enter><C-W>h
nnoremap <buffer> <localleader>s :let @"=@%<Enter><C-W>l<C-D><C-W>h<C-W>ljulia<Enter>include("<C-W>"0")<Enter><C-W>h
nnoremap <buffer> <localleader>r yy<C-W>l<C-W>"0<C-W>h
vnoremap <buffer> <localleader>r y<C-W>l<C-W>"0<C-W>h
nnoremap <buffer> <localleader>q :qa!<Enter>

