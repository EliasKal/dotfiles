setlocal wrap
setlocal spell spelllang=en,el
setlocal cc=
syn region math start=/\$\$/ end=/\$\$/
syn match math '\$[^$].\{-}\$'
hi link math Statement
setlocal shell=bash
noremap <buffer> <localleader>t :vertical terminal<Enter><C-W>h

