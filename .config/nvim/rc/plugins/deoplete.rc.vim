let g:deoplete#enable_at_startup = 1
call deoplete#custom#source('buffer', 'rank', 0)
"call deoplete#custom#source('neosnippet', 'rank', 9999)
call deoplete#custom#option({
			\ 'smart_case' : v:true,
			\ 'refresh_always' : v:false,
			\})

"\ 'omni_patterns':
"\ {'java': '[^. *\t]\.\w*'},
call deoplete#custom#var('omni', 'input_patterns', {
			\ 'pandoc': '@'
			\})
