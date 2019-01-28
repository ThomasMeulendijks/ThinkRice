if &compatible
	set nocompatible
endif

function! s:source_rc(path, ...) abort
	let use_global = get(a:000, 0, !has('vim_starting'))
	let abspath = resolve(expand('~/.config/nvim/rc/' . a:path))
	if !use_global
		execute 'source' fnameescape(abspath)
		return
	endif

	" substitute all 'set' to 'setglobal'
	let content = map(readfile(abspath),
				\ 'substitute(v:val, "^\\W*\\zsset\\ze\\W", "setglobal", "")')
	" create tempfile and source the tempfile
	let tempfile = tempname()
	try
		call writefile(content, tempfile)
		execute 'source' fnameescape(tempfile)
	finally
		if filereadable(tempfile)
			call delete(tempfile)
		endif
	endtry
endfunction

" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
	call dein#begin('~/.cache/dein')

	" call dein#add('autozimu/LanguageClient-neovim', {
	"			\'on_ft' : 'java',
	"			\'rev' : 'next',
	"			\'build' : 'bash install.sh'})

	""""""""""
	"" Basic "
	""""""""""
	call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
"	call dein#add('tpope/vim-sensible')
	""""""""""
	"" UI    "
	""""""""""
	call dein#add('morhetz/gruvbox')
	call dein#add('vim-airline/vim-airline')
	""""""""""
	"" Utils "
	""""""""""
	call dein#add('Shougo/defx.nvim')
	call dein#add('Shougo/denite.nvim')
	call dein#add('tpope/vim-fugitive')
	call dein#add('airblade/vim-rooter')
	call dein#add('wesQ3/vim-windowswap')
	call dein#add('Shougo/echodoc.vim')
	call dein#add('Shougo/context_filetype.vim')
	call dein#add('mattn/emmet-vim', {'on_ft':'html'})
	""""""""""""""""""
	"" Maker/linting "
	""""""""""""""""""
	call dein#add('neomake/neomake')
	call dein#add('benjie/local-npm-bin.vim')
	""""""""""""""""""
	"" autocomplete "'
	""""""""""""""""""
	call dein#add('Shougo/deoplete.nvim')
	call dein#add('carlitux/deoplete-ternjs', {'on_ft':'javascript',
				\'build' : 'npm i -g tern'})
	call dein#add('Shougo/neco-syntax')
	call dein#add('Shougo/deoplete-clangx')
	""""""""""""
	"" Syntax "'
	""""""""""""
	call dein#add('oysteinkrog/vim-openscad', {'on_ft':'openscad'})
	call dein#add('mboughaba/i3config.vim', {'on_ft' : 'i3config'})
	call dein#add('othree/html5.vim',{'on_ft' : 'html' })
	call dein#add('pangloss/vim-javascript',{'on_ft' : 'javascript' })
	call dein#add('hail2u/vim-css3-syntax',{'on_ft' : 'css' })
	call dein#add('cakebaker/scss-syntax.vim',{'on_ft' : 'scss' })
	call dein#add('posva/vim-vue',{'on_ft' : 'vue' })
	""""""""""""""""
	"" formatting "'
	""""""""""""""""
	"call dein#add('chiel92/vim-autoformat')

	call dein#add('sbdchd/neoformat')
	call dein#add('godlygeek/tabular')
	call dein#add('tpope/vim-commentary')
	""""""""""""""
	"" snippets "'
	""""""""""""""
	call dein#add('Shougo/neosnippet.vim')
	call dein#add('Shougo/neosnippet-snippets')

	call dein#end()
	call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
	call dein#install()
endif

call s:source_rc('basic.rc.vim')
call s:source_rc('ui.rc.vim')
call s:source_rc('mappings.rc.vim')
call s:source_rc('abbrevations.rc.vim')
call s:source_rc('plugins/rooter.rc.vim')
call s:source_rc('plugins/echodoc.rc.vim')
call s:source_rc('plugins/defx.rc.vim')
call s:source_rc('plugins/airline.rc.vim')
call s:source_rc('plugins/deoplete.rc.vim')
call s:source_rc('plugins/neomake.rc.vim')
call s:source_rc('plugins/neoformat.rc.vim')
call s:source_rc('plugins/neosnippet.rc.vim')
