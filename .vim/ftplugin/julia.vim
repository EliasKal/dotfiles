setlocal shell=julia
nnoremap <buffer> <localleader>t :vertical terminal<Enter><C-W>h
nnoremap <buffer> <localleader>s :let @"=@%<Enter><C-W>linclude("<C-W>"0")<Enter><C-W>h
nnoremap <buffer> <localleader>q :qa!<Enter>

