"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc
" TODO
" ctrl k compleation shortcut
" betther tab


" Load Plugin
call plug#begin('~/.config/nvim/plugged')
	Plug 'lervag/vimtex'
	Plug 'neomake/neomake'
	Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'shougo/neosnippet.vim'
	Plug 'shougo/neosnippet-snippets'
call plug#end()

" Basics
	let mapleader =" "
	set history=1000 " keep 1000 lines of command line history
	filetype on
	syntax on
	set number
	set relativenumber
	set colorcolumn=80

" Set our encoding to UTF-8
	set encoding=utf-8
	
	set laststatus=2          " last window will always have a status line
	
" Enable persistent undo
" and tell vim were to store the undo files.
	set undofile
	set undodir=~/.config/nvim/undos
	set undolevels=1000
	set undoreload=10000

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Open corresponding.pdf
	map <leader>p :!opout <c-r>%<CR><CR>

" Compile document
	map <leader>c :!compiler <c-r>%<CR>

" Execute document
	map <leader>e :!executor <c-r>%<CR>

" Interpret .md files, etc. as .markdown
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" Make calcurse notes markdown compatible:
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown

" Readmes autowrap text:
	autocmd BufRead,BufNewFile *.md,*.tex set tw=79

" Get line, word and character counts with F3:
	map <F3> :!wc <C-R>%<CR>

" Spell-check set to F6:
	map <F6> :setlocal spell! spelllang=en_us<CR>

" Copy selected text to system clipboard (requires gvim installed):
	vnoremap <C-c> "*Y :let @+=@*<CR>
	map <C-p> "+P

" Navigating with guides
	inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
	vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
	map <Space><Tab> <Esc>/<++><Enter>"_c4l

" For normal mode when in terminals (in X I have caps mapped to esc, this replaces it when I don't have X)
	inoremap jf <Esc>
	inoremap fj <Esc>

	
" Deoplete
let g:deoplete#enable_at_startup = 1
autocmd FileType markdown let g:deoplete#enable_at_startup=0

" NeoSnippets
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" neomake
call neomake#configure#automake('w')
let g:neomake_open_list = 2
