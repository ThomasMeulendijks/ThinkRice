" Only do this when not done yet for this buffer
if exists("b:did__javascript_ftplugin")
	finish
endif
let b:did_javascript_ftplugin = 1
" javascript
let g:javascript_enable_domhtmlcss = 1

setlocal tabstop=4
setlocal noexpandtab
setlocal shiftwidth=4
setlocal softtabstop=0
