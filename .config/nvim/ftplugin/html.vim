" Only do this when not done yet for this buffer
if exists("b:did_html_ftplugin")
	finish
endif
let b:did_html_ftplugian = 1

" for html files, 2 spaces wide tab
setlocal ts=2 sw=2 noexpandtab
