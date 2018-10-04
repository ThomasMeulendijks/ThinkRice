" dein Scripts-------------------------
if &compatible
	set nocompatible
endif

" Add the dein installation directory into runtimepath
set runtimepath+=/home/thomas/.config/nvim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/home/thomas/.config/nvim/dein')
	call dein#begin('/home/thomas/.config/nvim/dein/')

	call dein#add('/home/thomas/.config/nvim/dein/repos/github.com/Shougo/dein.vim')
	call dein#add('Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'})
	call dein#add('Shougo/denite.nvim')
	call dein#add('Shougo/vimproc.vim', {'build': 'make'})
	call dein#add('Shougo/neopairs.vim')
	call dein#add('Shougo/defx.nvim')
	call dein#add('Shougo/context_filetype.vim')
	call dein#add('Shougo/neco-vim')
	call dein#add('Shougo/echodoc.vim')
	call dein#add('Shougo/neco-syntax')
	call dein#add('Shougo/neoinclude.vim')
	call dein#add('Shougo/neosnippet.vim')
	call dein#add('Shougo/neosnippet-snippets')
	call dein#add('Honza/vim-snippets')
	call dein#add('Majutsushi/tagbar')
	call dein#add('sbdchd/neoformat')
	call dein#add('neomake/neomake')
	call dein#add('scrooloose/nerdcommenter')
	call dein#add('tomasr/molokai')
	call dein#add('christoomey/vim-tmux-navigator')
	call dein#add('benmills/vimux')
	call dein#add('konfekt/fastfold')
	call dein#add('godlygeek/tabular')
	call dein#add('airblade/vim-rooter')
	call dein#add('vim-airline/vim-airline')
	call dein#add('vim-airline/vim-airline-themes')
	call dein#add('HerringtonDarkholme/yats.vim')
	call dein#add('mhartington/nvim-typescript', {'build': './install.sh'})
	call dein#add('autozimu/LanguageClient-neovim', {'rev': 'next',
				\ 'build':'./install.sh',})
	if !has('nvim')
		call dein#add('roxma/nvim-yarp')
		call dein#add('roxma/vim-hug-neovim-rpc')
	endif
	call dein#end()
	call dein#save_state()
endif
set nohlsearch
filetype plugin indent on
syntax enable

if dein#check_install()
	call dein#install()
endif

" End dein Scripts------------------------
" TODO debug popup colors
" check for more bugs
" disable auto comment next line unless /** **/ or - / +
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/rc/mappings.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/rc/abbrevations.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/rc/autocmd.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/rc/encoding.rc.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/rc/visual.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/rc/basics.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/rc/plugins/deoplete.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/rc/plugins/neosnippet.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/rc/plugins/denite.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/rc/plugins/defx.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/rc/plugins/tagbar.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/rc/plugins/neoformat.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/rc/plugins/neomake.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/rc/plugins/echodoc.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/rc/plugins/defx.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/rc/plugins/rooter.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/rc/plugins/airline.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/rc/filetype/ts.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/rc/filetype/java.vim'
