" Snippets
nnoremap <buffer> <localleader>cl :-1read $HOME/dotfiles/.vim/templates/console_log.tmpl<CR>f)i
nnoremap <buffer> <localleader>d3 :-1read $HOME/dotfiles/.vim/templates/d3.tmpl<CR>24Gmd30Gmc43Gms61Gmm66Gmagg
nnoremap <buffer> <localleader>re :-1read $HOME/dotfiles/.vim/templates/d3_reusable.tmpl<CR>
nnoremap <buffer> <localleader>gl :-1read $HOME/dotfiles/.vim/templates/d3_glyph.tmpl<CR>
nnoremap <buffer> <localleader>ent :-1read $HOME/dotfiles/.vim/templates/d3_enter.tmpl<CR>=2jw
nnoremap <buffer> <localleader>ci :-1read $HOME/dotfiles/.vim/templates/d3_circle.tmpl<CR>=6jj>5jt)
nnoremap <buffer> <localleader>te :-1read $HOME/dotfiles/.vim/templates/d3_text.tmpl<CR>=6jj>5jf"w
nnoremap <buffer> <localleader>ax :-1read $HOME/dotfiles/.vim/templates/d3_axis.tmpl<CR>=4j2j>2j2kb

" Commands
nnoremap <buffer> <localleader>up :call StartServer()<CR>
nnoremap <buffer> <localleader>down :call StopServer()<CR>



