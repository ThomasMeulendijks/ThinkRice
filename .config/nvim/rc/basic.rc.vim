set ignorecase
set smartcase

"" Enable hidden buffers
set hidden

"" Directories for swp files
set nobackup
set noswapfile

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow
set splitright

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

"" Tab settings
set tabstop=4
set shiftwidth=4
set softtabstop=0
set noexpandtab

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

autocmd FileType * setlocal formatoptions-=r

set autoread
autocmd CursorHold,FocusGained * checktime
"" Enter insert mode on terminal enter
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
