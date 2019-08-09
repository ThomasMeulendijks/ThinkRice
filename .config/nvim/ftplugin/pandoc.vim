" Only do this when not done yet for this buffer
if exists("b:did_pandoc_ftplugin")
	finish
endif
let b:did_pandoc_ftplugin = 1

" for html files, 2 spaces wide tab
setlocal ts=4 sw=4 noexpandtab

"" Macro to convert a file name to a link in markdown
let @a='0v$hyI+ [pa](A)j'

