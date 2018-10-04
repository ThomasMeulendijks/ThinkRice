let g:airline_theme = 'molokai'
let g:airline#extensions#tabline#formatter = 'uniqe_tail_improved'
let g:airline#extensions#branch#enabled = 1
let g:airline_skip_empty_sections = 0
let g:airline#extensions#tagbar#enabled = 1
"let g:airline_section_a
"let g:airline_section_b
"let g:airline_section_c
"let g:airline_section_gutter
"let g:airline_section_x
"let g:airline_section_y
let g:airline_section_z="%l%#__accent_bold#/%L%{g:airline_symbols.maxlinenr}"
"let g:airline_section_error
"let g:airline_section_warning

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
"let g:airline_left_sep = '"»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.crypt = '🔒'
"let g:airline_symbols.linenr = '☰'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
"let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'
