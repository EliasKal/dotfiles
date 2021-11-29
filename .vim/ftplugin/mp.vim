setlocal nowrap
setlocal splitbelow

" Snippets
nnoremap <buffer> <localleader>fig :-1read $HOME/dotfiles/.vim/templates/mpfig.tmpl<CR>f(l

" Commands
nnoremap <buffer> <localleader>q :qa!<Enter>
nnoremap <buffer> <localleader>t :terminal<Enter><C-W>k30<C-W>_
nnoremap <buffer> <localleader>s :let @"=@%<Enter><C-W>jmptopdf <C-W>"0<Enter><C-W>k

