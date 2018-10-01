" dein Scripts-------------------------
if &compatible
	set nocompatible
endif

" Add the dein installation directory into runtimepath
set runtimepath+=/home/thomas/.config/nvim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/home/thomas/.config/nvim/dein')
	call dein#begin('/home/thomas/.config/nvim/dein/')

	call dein#add('/home/thomas/.config/nvim/dein/repos/github.com/Shougo/dein.vim')
	call dein#add('Shougo/deoplete.nvim')
	call dein#add('Shougo/denite.nvim')
	call dein#add('Shougo/vimproc.vim')
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
	"call dein#add('sheerun/vim-polyglot')
	call dein#add('joshdick/onedark.vim')
	call dein#add('christoomey/vim-tmux-navigator')
	call dein#add('benmills/vimux')
	call dein#add('konfekt/fastfold')
	call dein#add('godlygeek/tabular')
	call dein#add('artur-shaik/vim-javacomplete2')

	if !has('nvim')
		call dein#add('roxma/nvim-yarp')
		call dein#add('roxma/vim-hug-neovim-rpc')
	endif
	call dein#end()
	call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
	call dein#install()
endif

" End dein Scripts------------------------

execute 'source' fnamemodify(expand('<sfile>'), ':h').'/rc/mappings.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/rc/abbrevations.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/rc/autocmd.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/rc/encoding.rc.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/rc/basics.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/rc/visual.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/rc/basics.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/rc/plugins/deoplete.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/rc/plugins/neosnippet.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/rc/plugins/denite.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/rc/plugins/defx.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/rc/plugins/tagbar.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/rc/plugins/neoformat.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/rc/plugins/neomake.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/rc/plugins/javacomplete2.vim'
