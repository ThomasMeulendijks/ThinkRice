let mapleader=' '

"" _ clipboard x
nnoremap x "_x

"" Copy selected text to system clipboard (requires gvim installed):
vnoremap <C-c> "*Y :let @+=@*<CR>
map <C-p> "+P

"" Disable
nnoremap Q q
nnoremap M m
nnoremap ZZ <Nop>

"" Esc alternatives
inoremap jf <Esc>
inoremap fj <Esc>

" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap L >gv
vnoremap H <gv

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Leader a-------------------------
" Leader b-------------------------
"" Substitude buffer
nnoremap <leader>bs :%s//g<Left><Left>
nnoremap <leader>bb :Denite buffer<CR>
nnoremap <leader>bo :only<CR>
" Leader c-------------------------
"TODO DEPRICATED
map <leader>c :!compiler <c-r>%<CR>

" Leader d-------------------------
" Leader e-------------------------
"TODO DEPRICATED
map <leader>e :!executor <c-r>%<CR>

" Leader f-------------------------
" Leader g-------------------------
" Leader h-------------------------
" Leader i-------------------------
" Leader j-------------------------
" Leader k-------------------------
" Leader l-------------------------
" Leader m-------------------------
" Leader n-------------------------
" Leader o-------------------------
" Leader p-------------------------
nnoremap <leader>p :!opout <c-r>%<CR><CR>

" Leader q-------------------------
" Leader r-------------------------
" Leader s-------------------------
" Leader t-------------------------
nnoremap <silent> <leader>tn :tabnew<CR>

" Leader u-------------------------
" Leader v-------------------------
" Leader w-------------------------
" Leader x-------------------------
" Leader y-------------------------
" Leader z-------------------------

" Expand the completed snippet trigger by <CR>.
imap <expr><CR>
			\ (pumvisible() && neosnippet#expandable()) ?
			\ "\<Plug>(neosnippet_expand)" : "\<CR>"

" <BS>: close popup and delete backword char.
inoremap <expr><BS>  deoplete#close_popup()."\<C-h>"

"" SuperTab like snippets behavior.
imap <expr><TAB>
			\ pumvisible() ? "\<C-n>" :
			\ neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <expr> '  pumvisible() ? deoplete#close_popup() : "'"
