"" Automatically deletes all tralling whitespace on save.
augroup vimrc-whitespace
	autocmd!
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritePre * %s/\n\{3,}/\r\r/e
augroup END
"" Remember cursor position
augroup vimrc-remember-cursor-position
	autocmd!
	autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" check one time after 4s of inactivity in normal mode
set autoread
autocmd CursorHold * checktime
