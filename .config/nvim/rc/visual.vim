syntax on
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

"" use | to show tabs
set list lcs=tab:\|\ "a space is needed after this

"" c = Dont gice insert completion menu messages
set shortmess+=c

"" collum 80 highlight and after 120
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn="80,".join(range(120,999),",")

highlight Pmenu ctermbg=235
highlight LineNr ctermbg=234

autocmd InsertEnter,InsertLeave * set cul!

"" Theme settings
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
"colorscheme onedark
colorscheme molokai

set conceallevel=2
set concealcursor ="niv"

set laststatus=2
set cmdheight=2
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (\col\ %c)
