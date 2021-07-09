setlocal nowrap
setlocal shell=bash
nnoremap <buffer> <localleader>q :qa!<Enter>
nnoremap <buffer> <localleader>t :vertical terminal<Enter>psql "dbname=mimic user=kalamar options=--search_path=mimiciii"<Enter><C-W>h
nnoremap <buffer> <localleader>r yy<C-W>l<C-W>"0<C-W>h
vnoremap <buffer> <localleader>r y<C-W>l<C-W>"0<C-W>h
nnoremap <buffer> <localleader>s :let @"=@%<Enter><C-W>l\include <C-W>"0<Enter><C-W>h
nnoremap <buffer> <localleader>p :let @"=expand("<cword>")<Enter><C-W>lSELECT * FROM <C-W>"0 LIMIT 10;<Enter><C-W>h

" Snippets
nnoremap <buffer> <localleader>v :-1read $HOME/dotfiles/.vim/templates/sql_create_view.tmpl<CR>4w

