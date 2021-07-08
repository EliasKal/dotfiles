setlocal nowrap
nnoremap <localleader>q :qa!<Enter>
setlocal shell=bash
nnoremap <localleader>t :vertical terminal<Enter>psql "dbname=mimic user=elias options=--search_path=mimiciii"<Enter><C-W>h
nnoremap <localleader>r yy<C-W>l<C-W>"0<C-W>h
vmap <localleader>r y<C-W>l<C-W>"0<C-W>h
nnoremap <localleader>s :let @"=@%<Enter><C-W>l\include <C-W>"0<Enter><C-W>h
nnoremap <localleader>p :let @"=expand("<cword>")<Enter><C-W>lSELECT * FROM <C-W>"0 LIMIT 10;<Enter><C-W>h

" Snippets
nnoremap <localleader>v :-1read $HOME/dotfiles/.vim/templates/sql_create_view.tmpl<CR>4w

