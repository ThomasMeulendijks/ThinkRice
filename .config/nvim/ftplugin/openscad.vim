" Only do this when not done yet for this buffer
if exists("b:did_html_ftplugin")
	finish
endif
let b:did_html_ftplugian = 1
autocmd TextChanged,TextChangedI <buffer> silent write
