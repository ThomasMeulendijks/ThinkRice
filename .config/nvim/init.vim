"*****************************************************************************
"" Vim-PLug core
""*****************************************************************************
" Required:
call plug#begin('~/.config/nvim/plugged')

"*****************************************************************************
"" Plug install packages
" TODO tabular
" *****************************************************************************
"
""" Syntax
"
Plug 'HerringtonDarkholme/yats.vim' " TypeScript synatx highlight
"Plug 'sheerun/vim-polyglot' " General Syntax and indenting
"Plug 'lervag/vimtex' " LaTeX suport
"
"""  compleation
"
Plug 'shougo/deoplete.nvim', {
			\ 'do': ':UpdateRemotePlugins' }
Plug 'shougo/neosnippet.vim'
Plug 'shougo/context_filetype.vim'
"Plug 'shougo/neopairs.vim' " Auto colse pairentisis (TODO does not work)
"
"" Auto compleation sources
"
Plug 'honza/vim-snippets'
Plug 'shougo/neosnippet-snippets'
Plug 'shougo/neco-vim' " VimL source for deoplete
Plug 'shougo/neco-syntax'
Plug 'shougo/neoinclude.vim'
Plug 'autozimu/LanguageClient-neovim', {
			\ 'branch': 'next',
			\ 'do': 'bash install.sh',
			\ }
"
""" Navigation
"
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-rooter' " auto changes working dir to project root
Plug 'majutsushi/tagbar' " TODO figure out
"
"Helpers
"
Plug 'neomake/neomake' " Enables linting and compinging / error checking
Plug 'godlygeek/tabular'
"Plug 'shougo/echodoc.vim' " echos the documentation of a function when on it (TODO CHECK)
"
" Visual
"
Plug 'Yggdroot/indentLine' " Shows ¦ on space indent
Plug 'vim-airline/vim-airline' " status bar Emacs like
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/CSApprox' " enables Gvim colorscemes in terminal
Plug 'tomasr/molokai' " color
Plug 'ryanoasis/vim-devicons'
"
" Other
"
Plug 'tpope/vim-commentary' " easy commenting
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'edkolev/tmuxline.vim'
"Plug 'shougo/denite.nvim' " generic fuzzy finder (helm like) TODO config
"Plug 'shougo/vimproc.vim' " TODO
"Plug 'konfekt/fastfold' " speed up vim by updating only when called for
"Plug 'tpope/vim-fugitive' " Git stuff TODO
"Plug 'airblade/vim-gitgutter' " Git stuff TODO
"Plug 'Raimondi/delimitMate' " Auto colose qutoes and brackets ect
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
"let g:session_directory = "~/.config/nvim/session"
"let g:session_autoload = "no"
"let g:session_autosave = "no"
"let g:session_command_aliases = 1

"" keep N lines of command line history
set history=100

" Enable persistent undo
set undofile
set undodir=~/.config/nvim/undos
set undolevels=100
set undoreload=1000

"Set wildignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,solr/**,log/**,*.psd,*.PSD,.git/**,.gitkeep,.gems/**
set wildignore+=*.ico,*.ICO,backup/**,*.sql,*.dump,*.tmp,*.min.js,Gemfile.lock,*.sqlite,*db,*.pyc
set wildignore+=*.png,*.PNG,*.JPG,*.jpg,*.JPEG,*.jpeg,*.GIF,*.gif,*.pdf,*.PDF
set wildignore+=vendor/**,coverage/**,tmp/**,rdoc/**,*.BACKUP.*,*.BASE.*,*.LOCAL.*,*.REMOTE.*,.sass-cache/**

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number
set relativenumber

"" Disable --INSTERT-- ect.
set noshowmode

let no_buffers_menu=1
if !exists('g:not_finish_vimplug')
	colorscheme molokai
endif

"" Conseal characters unless cursor is on the line
set conceallevel=2
set concealcursor ="niv"
let g:indentLine_concealcursor = 'niv'
let g:indentLine_conceallevel = 2
"" Status bar
set laststatus=2

set cmdheight=2

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

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

highlight Pmenu ctermbg=235
highlight LineNr ctermbg=234

if exists("*fugitive#statusline")
	set statusline+=%{fugitive#statusline()}
endif

" vim-airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extentions#show_splits = 0

let g:airline#extensions#tagbar#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 0
let g:airline#extensions#default#layout = [
			\ [ 'a', 'b'],
			\ [  'error', 'warning', 'x']
			\ ]

"" c = Dont gice ins completion menu messages
set shortmess+=c
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

autocmd CompleteDone * silent! pclose!

"" Remember cursor position
augroup vimrc-remember-cursor-position
	autocmd!
	autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

set autoread
autocmd CursorHold,FocusGained * checktime

"*****************************************************************************
"" Mappings
"*****************************************************************************
"" _ clipboard x
nnoremap x "_x

"" Disable
nnoremap Q q
nnoremap M m
nnoremap ZZ <Nop>

"" Git
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

nnoremap <leader>p :!opout <c-r>%<CR><CR>

"" TODO depricated replace with neomake ect.
map <leader>c :!compiler <c-r>%<CR>
map <leader>e :!executor <c-r>%<CR>

nnoremap <silent> <leader>sh :terminal<CR>
" Use urlview to choose and open a url: TODO
" https://google.com
" noremap <leader>u :w<Home>silent <End> !urlview<CR>

"" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

"" Esc alternatives
inoremap jf <Esc>
inoremap fj <Esc>

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap L >gv
vnoremap H <gv
"" Tabs
nnoremap <silent> <S-t> :tabnew<CR>

nnoremap <S-b> :Denite buffer<CR>

"" Copy selected text to system clipboard (requires gvim installed):
vnoremap <C-c> "*Y :let @+=@*<CR>
map <C-p> "+P

nnoremap <silent>	<F1> :NERDTreeFind<CR>
nnoremap <silent>	<F2> :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent>	<F3> :NERDTreeToggle<CR>
nnoremap <silent>	<F4> :TagbarToggle<CR>
nnoremap <silent>	<F5> :call LanguageClient_contextMenu()<CR>
map 	 <silent>	<F6> :setlocal spell! spelllang=en_us<CR>
nnoremap <silent>	<F12> :LanguageClientStart<CR>
"" Show on hover info
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"" Go to definition
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Expand the completed snippet trigger by <CR>.
imap <expr><CR>
			\ (pumvisible() && neosnippet#expandable()) ?
			\ "\<Plug>(neosnippet_expand)" : "\<CR>"

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <expr> '  pumvisible() ? deoplete#close_popup() : "'"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"

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
call deoplete#custom#source('buffer', 'rank', 0)
call deoplete#custom#option('ignore_sources', {'_': ['buffer']})
call deoplete#custom#source('neosnippet', 'rank', 9999)
"set completeopt+=noinsert

let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/snippets'

if !has("gui_running")
	let g:CSApprox_loaded = 1
	" IndentLine
	let g:indentLine_enabled = 1
	let g:indentLine_char = '┆'
	let g:indentLine_faster = 1
endif

" LanguageClient
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

let g:echodoc#enable_at_startup = 1

"" Vim rooter
let g:rooter_patterns = ['.git', '.git/', '_darcs/', '.hg', 'bzr/', '.svn/',
			\ 'pom.xml']
let g:rooter_change_directory_for_non_project_files = 'current'

"*****************************************************************************
"" Filtype configs
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

augroup vimrc-markdown
	autocmd!
	autocmd FileType markdown let g:indentLine_concealcursor = ''
	autocmd FileType markdown let g:deoplete#enable_at_startup=0
	autocmd FileType markdown exe deoplete#disable()
	autocmd BufRead,BufNewFile *.md,*.tex,*.rmd,*.markdown set tw=78
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
" Devicons
let g:airline_symbols.branch = ''

" let g:tmuxline_separators = {
"     \ 'left' : '',
"     \ 'left_alt': '',
"     \ 'right' : '',
"     \ 'right_alt' : '',
"     \ 'space' : ' '}

" let g:tmuxline_preset = {
"       \'a'    : '#S',
"       \'b'    : '#W',
"       \'c'    : '#H',
"       \'win'  : '#I #W',
"       \'cwin' : '#I #W',
"       \'x'    : '%a',
"       \'y'    : '#W %R',
"       \'z'    : '#H'}
let g:tmuxline_powerline_separators = 1
let g:tmuxline_preset = {
			\'a'    : '#S',
			\'c'    : ['#(whoami)',
			\		'#(cd #{pane_current_path}; git rev-parse --abbrev-ref HEAD)'],
			\'win'  : ['#I', '#W'],
			\'cwin' : ['#I', '#W', '#F'],
			\'x'    : '',
			\'y'    : ['%R', '%a', '%Y'],
			\'z'    : '#H'}
