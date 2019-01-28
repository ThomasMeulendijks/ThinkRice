set ruler
set number
set relativenumber

"" Disable --INSTERT-- ect.
set noshowmode

"" no highlight on search
set nohlsearch
set incsearch

"" scroll offset
set scrolloff=5

"" Disable windows resizeing on close
""set noequalalways

"" use | to show tabs
set list lcs=tab:\|\ "a space is needed after this

"" c = Dont give insert completion menu messages
set shortmess+=c

"" collum 80 highlight and after 120
let &colorcolumn=join(range(81,999),",")
"highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn="80,".join(range(120,999),",")

"highlight Pmenu ctermbg=235
"highlight LineNr ctermbg=234

"autocmd BufEnter * sign define dummy
"autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

" toggle line highlight
autocmd InsertEnter,InsertLeave * set cul!

"" Theme settings
set termguicolors
set background=dark
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox

"colorscheme molokai

set conceallevel=2
set concealcursor ="niv"

set laststatus=2
set cmdheight=2
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (\col\ %c)

let s:backgrounddark= 1

function! ToggleBackground()
	if s:backgrounddark
		set background=light
		let s:backgrounddark= 0
	else
		set background=dark
		let s:backgrounddark= 1
	endif
endfunction

