setlocal nowrap
nnoremap <localleader>q :qa!<Enter>
setlocal shell=python
nnoremap <localleader>t :vertical terminal<Enter><C-W>h
nnoremap <localleader>r yy<C-W>l<C-W>"0<C-W>h
vmap <localleader>r y<C-W>l<C-W>"0<C-W>h
nnoremap <localleader>s :let @"=@%<Enter><C-W>lexec(open("<C-W>"0").read())<Enter><C-W>h
nnoremap <localleader>p :let @"=expand("<cword>")<Enter><C-W>l<C-W>"0<Enter><C-W>h
tnoremap <localleader><Esc> <C-\><C-n>

