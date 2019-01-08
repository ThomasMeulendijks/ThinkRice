" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
			\ 'java': ['/usr/bin/jdtls'],
			\ }

" Rename - rn => rename
noremap ,rn :call LanguageClient#textDocument_rename()<CR>
" Rename - rc => rename camelCase
noremap ,rc :call LanguageClient#textDocument_rename(
			\ {'newName': Abolish.camelcase(expand('<cword>'))})<CR>
" Rename - rs => rename snake_case
noremap ,rs :call LanguageClient#textDocument_rename(
			\ {'newName': Abolish.snakecase(expand('<cword>'))})<CR>
" Rename - ru => rename UPPERCASE
noremap ,ru :call LanguageClient#textDocument_rename(
			\ {'newName': Abolish.uppercase(expand('<cword>'))})<CR>

noremap ,h :call LanguageClient#textDocument_hover()<cr>
noremap ,d :call LanguageClient#textDocument_definition()<CR>

noremap ,gd :call LanguageClient#textDocument_definition()<CR>
noremap ,gt :call LanguageClient#textDocument_typeDefinition()<CR>
noremap ,gi :call LanguageClient#textDocument_implementation()<CR>

"nnoremap <buffer> <silent> ,m :call LanguageClient#contextMenu()<CR>
noremap ,m :Denite contextMenu<CR>

