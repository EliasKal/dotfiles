setlocal wrap
setlocal spell spelllang=en,el
nmap <localleader>q :qa!<Enter>
setlocal shell=R
nmap <localleader>t :vertical terminal<Enter><C-W>h
nmap <localleader>s :let @"=@%<Enter><C-W>lrmarkdown::render("<C-W>"0", output_dir = "output")<Enter><C-W>h
nmap <localleader>rr yy<C-W>l<C-W>"0<C-W>h
nmap <localleader>rc /```<Enter>NjVnky<C-W>l<C-W>"0<C-W>h
vmap <localleader>r y<C-W>l<C-W>"0<C-W>h

" Snippets
nnoremap <localleader>rmd :-1read $HOME/dotfiles/templates/rmd.tmpl<CR>jwwa
nnoremap <localleader>ic :-1read $HOME/dotfiles/templates/rmd_chunk.tmpl<CR>ji

