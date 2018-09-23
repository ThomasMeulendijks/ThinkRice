"*****************************************************************************
"" Vim-PLug core
""*****************************************************************************
if has('vim_starting')
	set nocompatible               " Be iMproved
endif

" Required:
call plug#begin('~/.config/nvim/plugged')

"*****************************************************************************
"" Plug install packages
" *****************************************************************************
Plug 'scrooloose/nerdtree'
Plug 'autozimu/LanguageClient-neovim', {
			\ 'branch': 'next',
			\ 'do': 'bash install.sh',
			\ }
Plug 'airblade/vim-rooter' " auto changes working dir to project root
Plug 'sheerun/vim-polyglot' " General Syntax and indenting
Plug 'HerringtonDarkholme/yats.vim' " TypeScript synatx highlight
Plug 'lervag/vimtex' " LaTeX suport
Plug 'neomake/neomake' " Enables linting and compinging / error checking
Plug 'shougo/deoplete.nvim', {
			\ 'do': ':UpdateRemotePlugins' } "Popup compleation
Plug 'shougo/neosnippet.vim' " Snipit plugin
Plug 'shougo/neosnippet-snippets' " actual snipits
Plug 'shougo/neco-vim' " VimL compleation via deoplete
Plug 'shougo/neco-syntax' " genereal compleation via deoplete
Plug 'shougo/denite.nvim' " generic fuzzy finder (helm like) TODO config
Plug 'tpope/vim-commentary' " easy commenting
Plug 'tpope/vim-fugitive' " Git stuff TODO
Plug 'airblade/vim-gitgutter' " Git stuff TODO
Plug 'vim-airline/vim-airline' " status bar Emacs like
Plug 'vim-airline/vim-airline-themes'
Plug 'Raimondi/delimitMate' " Auto colose qutoes and brackets ect
Plug 'majutsushi/tagbar' " TODO figure out
Plug 'Yggdroot/indentLine' " Shows ¦ on space indent
Plug 'vim-scripts/CSApprox' " enables Gvim colorscemes in terminal
Plug 'tomasr/molokai' " color
Plug 'shougo/vimproc.vim' " TODO
Plug 'ryanoasis/vim-devicons' " TODO

"*****************************************************************************
"" Custom bundles
"*****************************************************************************

call plug#end()

" Required:
filetype plugin indent on
"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

"" Tab settings
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4

"" Map leader to ,
let mapleader=' '

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Directories for swp files
set nobackup
set noswapfile

"" session management TODO
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

"" keep N lines of command line history
set history=100

" Enable persistent undo
set undofile
set undodir=~/.config/nvim/undos
set undolevels=100
set undoreload=1000

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number
set relativenumber

let no_buffers_menu=1
if !exists('g:not_finish_vimplug')
	colorscheme molokai
endif

"" Disable conceal (shows every character)
set conceallevel=0

"" Status bar
set laststatus=2

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"" no highlight on search
set nohlsearch

"" scroll offset
set scrolloff=5

"" use | to show tabs
set list lcs=tab:\|\ "a space is needed after this

"" collum 80 highlight and after 120
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn="80,".join(range(120,999),",")

"" popup color
highlight Pmenu ctermbg=235

"" LineNr
highlight LineNr ctermbg=234

if exists("*fugitive#statusline")
	set statusline+=%{fugitive#statusline()}
endif

" vim-airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 0
let g:airline#extensions#default#layout = [
	\ [ 'a', 'b'],
	\ [  'error', 'warning', 'x']
\ ]

"let g:airline#extensions#default#section_truncate_width = {}
" let g:airline#extensions#default#section_truncate_width = {
" 	\ 'b': 7,
" 	\ 'x': 6,
" 	\ 'y': 8,
" 	\ 'z': 4,
" 	\ 'warning': 80,
" 	\ 'error': 80,
" \ }

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"*****************************************************************************
"" Functions
"*****************************************************************************

"" TODO Figure out why wrap and wm
if !exists('*s:setupWrapping')
	function s:setupWrapping()
		set wrap
		set wm=2
		set textwidth=79
	endfunction
endif

"" <CR>: close popup and save indent.
function! s:my_cr_function() abort
	return deoplete#close_popup() . "\<CR>"
endfunction

" function! AirlineInit()
" let g:airline_section_a =
" 			\ airline#section#create(['mode'])
" let g:airline_section_b =
" 			\ airline#section#create(['file', ' ', 'readonly'])
" let g:airline_section_c =
" 			\ airline#section#create(['%{g:unite_outline_closest_tag}'])
" let g:airline_section_x =
" 			\ airline#section#create([])
" let g:airline_section_y =
" 			\ airline#section#create(['%<', 'branch'])
" let g:airline_section_z =
" 			\ airline#section#create(['%p%% ', '%{g:airline_symbols.linenr}%#__accent_bold#%l%#__restore__#:%v'])
" endfunction
"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************

"" Automatically deletes all tralling whitespace on save.
augroup vimrc-whitespace
	autocmd!
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritePre * %s/\n\{3,}/\r\r/e
augroup END

"" Make calcurse notes markdown compatible:
autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set
			\ filetype=markdown

"" Readme autowrap text:
autocmd BufRead,BufNewFile *.md,*.tex,*.rmd,*.markdown set tw=79

"" Disable deolete in markdown files
autocmd FileType markdown let g:deoplete#enable_at_startup=0

augroup vimrc-wrapping
	autocmd!
	autocmd BufRead,BufNewFile *.txt,*.md,*.rmd,*.tex call s:setupWrapping()
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
	autocmd!
	autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"autocmd User AirlineAfterInit call AirlineInit()

set autoread
"*****************************************************************************
"" Mappings
"*****************************************************************************

"" Navigating with guides
inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
map <Space><Tab> <Esc>/<++><Enter>"_c4l

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Open corresponding.pdf
map <leader>p :!opout <c-r>%<CR><CR>

"" Compile document TODO depricated
map <leader>c :!compiler <c-r>%<CR>

"" Execute document
map <leader>e :!executor <c-r>%<CR>

"" Open terminal
nnoremap <silent> <leader>sh :terminal<CR>

" Use urlview to choose and open a url:
noremap <leader>u :w<Home>silent <End> !urlview<CR>

"" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

"" Esc alternatives
inoremap jf <Esc>
inoremap fj <Esc>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Tabs
nnoremap <silent> <S-t> :tabnew<CR>

"" Copy selected text to system clipboard (requires gvim installed):
vnoremap <C-c> "*Y :let @+=@*<CR>
map <C-p> "+P

nnoremap <silent>	<F1> :NERDTreeFind<CR>
nnoremap <silent>	<F2> :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent>	<F3> :NERDTreeToggle<CR>
nnoremap <silent>	<F4> :TagbarToggle<CR>
nnoremap 			<F5> :call LanguageClient_contextMenu()<CR>
map 				<F6> :setlocal spell! spelllang=en_us<CR>
nnoremap <silent>	<F12> :LanguageClientStart<CR>
"" Show on hover info
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"" Go to definition
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

"" expand neosnippet or goto next placeholder
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

"" map <CR> to my_cr_function
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>

"" SuperTab like snippets behavior.
imap <expr><TAB>
	\ pumvisible() ? "\<C-n>" :
	\ neosnippet#expandable_or_jumpable() ?
	\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
	\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

"*****************************************************************************
"" Plugin configs
"*****************************************************************************

"" NERDTree configuration
let g:NERDTreeChDirMode=1
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=0
let g:NERDTreeWinSize = 49
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

"" Disable polugot for the following languages
let g:polyglot_disabled = ['latex']
let g:polyglot_disabled = ['typescript']
" Default should be betther
let g:polyglot_disabled = ['python']
let python_highlight_all = 1

" Tagbar
let g:tagbar_autofocus = 1

"" Deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('smart_case', v:true)

if !has("gui_running")
	let g:CSApprox_loaded = 1
	" IndentLine
	let g:indentLine_enabled = 1
	let g:indentLine_char = '┆'
	let g:indentLine_faster = 1
endif

" LanguageClient

" Required for operations modifying multiple buffers like rename.
" Enabels hidden buffers
set hidden

let g:LanguageClient_serverCommands = {
	\ 'javascript': ['/usr/bin/javascript-typescript-stdio'],
	\ 'typescript': ['/usr/bin/javascript-typescript-stdio'],
	\ 'java': ['/usr/bin/jdtls'],
	\ 'python': ['/usr/bin/pyls'],
\ }
let g:LanguageClient_autoStart = 0
let g:LanguageClient_autoStop = 1

"" neomake
call neomake#configure#automake('rnw', 0)
"let g:neomake_open_list = 2

"" Vim rooter
let g:rooter_patterns = ['.git', '.git/', '_darcs/', '.hg', 'bzr/', '.svn/',
			\ 'pom.xml']
let g:rooter_change_directory_for_non_project_files = 'current'

"*****************************************************************************
"" custom configs
"*****************************************************************************

" html
" for html files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab

" vim-javascript
augroup vimrc-javascript
	autocmd!
	autocmd FileType javascript set tabstop=4|set shiftwidth=4|set expandtab softtabstop=4
augroup END

" vim-python
augroup vimrc-python
	autocmd!
	autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
		\ formatoptions+=croq softtabstop=4
		\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

"*****************************************************************************
"" Convenience variables
"*****************************************************************************

" Interpret .md files, etc. as .markdown
let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd':
			\ 'markdown','.md': 'markdown', '.markdown':
			\ 'markdown', '.mdown': 'markdown'}

" vim-airline
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
" Unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇ '
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
