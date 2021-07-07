setlocal shell=julia
nnoremap <localleader>t :vertical terminal<Enter><C-W>h
nnoremap <localleader>s :let @"=@%<Enter><C-W>linclude("<C-W>"0")<Enter><C-W>h
nnoremap <localleader>q :qa!<Enter>

