let mapleader=' '
let maplocalleader=','
let g:windowswap_map_keys = 0 "prevent default bindings

command! BufOnly silent! execute "%bd|e#|bd#"
"""_ clipboard x
nnoremap x "_x

"""Copy selected text to system clipboard (requires gvim installed):
vnoremap <C-c> "*Y :let @+=@*<CR>
map <C-p> "+P

"""Disable
nnoremap Q q
nnoremap M m
nnoremap ZZ <Nop>

"""Esc alternatives
inoremap jq <Esc>
inoremap qj <Esc>

""search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"""Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap L >gv
vnoremap H <gv

""Shortcutting split navigation, saving a keypress:
""map <C-h> <C-w>h
""map <C-j> <C-w>j
""map <C-k> <C-w>k
""map <C-l> <C-w>l

tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

""Reszing window
map <C-y> <C-w><
map <C-u> <C-w>-
map <C-i> <C-w>+
map <C-o> <C-w>>

nnoremap <leader><leader> :Denite file/rec<CR>
"""""""""""""""""""""""
""Leader a------------"
"""""""""""""""""""""""
"""""""""""""""""""""""
""Leader b(uffer)-----"
"""""""""""""""""""""""
""nnoremap <leader>bs :Denite buffer<CR>
"buffer quit/close :bp | sp | bn | bd
""nnoremap <leader>bq :bdelete<CR>

nnoremap <leader>bb :bp<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bs :%s//g<Left><Left>
nnoremap <leader>bq :bp <BAR> bd #<CR>
nnoremap <leader>bQ :%bdelete<CR>
nnoremap <leader>bw :w<CR>
nnoremap <leader>bo :BufOnly<CR>
nnoremap <leader>bf :Neoformat<CR>
"""""""""""""""""""""""
""Leader c------------"
"""""""""""""""""""""""
"""""""""""""""""""""""
""Leader d------------"
"""""""""""""""""""""""
"""""""""""""""""""""""
""Leader e------------"
"""""""""""""""""""""""
"""""""""""""""""""""""
""Leader f------------"
"""""""""""""""""""""""
"""""""""""""""""""""""
""Leader g------------"
"""""""""""""""""""""""
"""""""""""""""""""""""
""Leader h------------"
"""""""""""""""""""""""
"""""""""""""""""""""""
""Leader i------------"
"""""""""""""""""""""""
"""""""""""""""""""""""
""Leader j------------"
"""""""""""""""""""""""
"""""""""""""""""""""""
""Leader k------------"
"""""""""""""""""""""""
"""""""""""""""""""""""
""Leader l------------"
"""""""""""""""""""""""
"""""""""""""""""""""""
""Leader m------------"
"""""""""""""""""""""""
"""""""""""""""""""""""
""Leader n------------"
"""""""""""""""""""""""
"""""""""""""""""""""""
""Leader o------------"
"""""""""""""""""""""""
"""""""""""""""""""""""
""Leader p------------"
"""""""""""""""""""""""
nnoremap <leader>p :!opout <c-r>%<CR><CR>
"""""""""""""""""""""""
""Leader q------------"
"""""""""""""""""""""""
"""""""""""""""""""""""
""Leader r------------"
"""""""""""""""""""""""
nnoremap <leader>rR :so %<CR>
"""""""""""""""""""""""
""Leader s(pelling)---"
"""""""""""""""""""""""
nmap <leader>sn ]s
nmap <leader>sb [s
nmap <leader>sc z=
"""""""""""""""""""""""
""Leader t(oggle)-----"
"""""""""""""""""""""""
"nnoremap <silent> <leader>tn :tabnew<CR>
"nnoremap <silent><leader>tb :call ToggleBackground()<CR>
nnoremap <silent> <Leader>ts :setlocal spell! spelllang=en_us<CR>
nnoremap <silent><leader>te :Defx -toggle -split=vertical -buffer-name=defx
			\ -direction=topleft -winwidth=30<CR>
nnoremap <silent><leader>tb :TagbarToggle<CR>
"""""""""""""""""""""""
""Leader u------------"
"""""""""""""""""""""""
"""""""""""""""""""""""
""Leader v -----------"
"""""""""""""""""""""""
""Leader w(indow)-----"
"""""""""""""""""""""""
nmap <silent><leader>wo :only<CR>
nmap <silent><leader>ws :split<CR>
nmap <silent><leader>wv :vsplit<CR>
nmap <leader>wq :q<CR>
nmap <leader>wQ :qa<CR>
nnoremap <silent><leader>wt :7split<CR>:terminal<CR>:startinsert<CR>
"""window move
nmap <leader>wmh <C-w>H
nmap <leader>wmj <C-w>J
nmap <leader>wmk <C-w>K
nmap <leader>wml <C-w>L
nnoremap <silent><leader>wms :call WindowSwap#EasyWindowSwap()<CR>
"""""""""""""""""""""""
""Leader x------------"
"""""""""""""""""""""""
"""""""""""""""""""""""
""Leader y            "
"""""""""""""""""""""""
"""""""""""""""""""""""
""Leader z            "
"""""""""""""""""""""""

"""""""""""""""""""""""
""Terminal mappings   "
"""""""""""""""""""""""
tnoremap <Esc> <C-\><C-n>

"""""""""""""""""""""""
""Other Mappings      "
"""""""""""""""""""""""
""Expand the completed snippet trigger by <CR>.
imap <expr><CR>
			\ (pumvisible() && neosnippet#expandable()) ?
			\ "\<Plug>(neosnippet_expand)" : "\<CR>"

""<BS>: close popup and delete backword char.
inoremap <expr><BS>  deoplete#close_popup()."\<C-h>"

"""SuperTab like snippets behavior.
imap <expr><TAB>
			\ pumvisible() ? "\<C-n>" :
			\ neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <expr> '  pumvisible() ? deoplete#close_popup() : "'"

