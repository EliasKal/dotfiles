setlocal nowrap
setlocal shell=python
nnoremap <buffer> <localleader>q :qa!<Enter>
nnoremap <buffer> <localleader>t :vertical terminal<Enter><C-W>h
nnoremap <buffer> <localleader>r yy<C-W>l<C-W>"0<C-W>h
vnoremap <buffer> <localleader>r y<C-W>l<C-W>"0<C-W>h
nnoremap <buffer> <localleader>s :let @"=@%<Enter><C-W>lexec(open("<C-W>"0").read())<Enter><C-W>h
nnoremap <buffer> <localleader>p :let @"=expand("<cword>")<Enter><C-W>l<C-W>"0<Enter><C-W>h
tnoremap <buffer> <localleader><Esc> <C-\><C-n>

