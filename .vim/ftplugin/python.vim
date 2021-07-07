setlocal nowrap
nmap <localleader>q :qa!<Enter>
setlocal shell=python
nmap <localleader>t :vertical terminal<Enter><C-W>h
nmap <localleader>r yy<C-W>l<C-W>"0<C-W>h
vmap <localleader>r y<C-W>l<C-W>"0<C-W>h
nmap <localleader>s :let @"=@%<Enter><C-W>lexec(open("<C-W>"0").read())<Enter><C-W>h
nmap <localleader>p :let @"=expand("<cword>")<Enter><C-W>l<C-W>"0<Enter><C-W>h
tnoremap <localleader><Esc> <C-\><C-n>

