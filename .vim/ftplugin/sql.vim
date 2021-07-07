setlocal nowrap
nmap <localleader>q :qa!<Enter>
setlocal shell=bash
nmap <localleader>t :vertical terminal<Enter>psql "dbname=mimic user=elias options=--search_path=mimiciii"<Enter><C-W>h
nmap <localleader>r yy<C-W>l<C-W>"0<C-W>h
vmap <localleader>r y<C-W>l<C-W>"0<C-W>h
nmap <localleader>s :let @"=@%<Enter><C-W>l\include <C-W>"0<Enter><C-W>h
nmap <localleader>p :let @"=expand("<cword>")<Enter><C-W>lSELECT * FROM <C-W>"0 LIMIT 10;<Enter><C-W>h

" Snippets
nnoremap <localleader>v :-1read $HOME/dotfiles/templates/sql_create_view.tmpl<CR>4w

