setlocal wrap
setlocal spell spelllang=en,el
setlocal cc=
syn region math start=/\$\$/ end=/\$\$/
syn match math '\$[^$].\{-}\$'
hi link math Statement
setlocal shell=bash
noremap <localleader>t :vertical terminal<Enter><C-W>h

