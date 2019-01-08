" Only do this when not done yet for this buffer
if exists("b:did_python_ftplugin")
	finish
endif
let b:did_python_ftplugin = 1

" python
" vim-python
setlocal tabstop=8
setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal formatoptions+=croq
setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class,with

