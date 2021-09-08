setlocal wrap
setlocal spell spelllang=en,el
setlocal shell=R
nnoremap <buffer> <localleader>q :qa!<Enter>
nnoremap <buffer> <localleader>t :vertical terminal<Enter><C-W>h
nnoremap <buffer> <localleader>s :let @"=@%<Enter><C-W>lrmarkdown::render("<C-W>"0", output_dir = "output")<Enter><C-W>h
nnoremap <buffer> <localleader>rr yy<C-W>l<C-W>"0<C-W>h
nnoremap <buffer> <localleader>rc /```<Enter>NjVnky<C-W>l<C-W>"0<C-W>h
vnoremap <buffer> <localleader>r y<C-W>l<C-W>"0<C-W>h

" Snippets
nnoremap <buffer> <localleader>rmd :-1read $HOME/dotfiles/.vim/templates/rmd.tmpl<CR>jwwa
nnoremap <buffer> <localleader>ic :-1read $HOME/dotfiles/.vim/templates/rmd_chunk.tmpl<CR>ji

