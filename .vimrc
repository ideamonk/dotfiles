" store last 50 cmds
set history=50

" show cursor pos all time
set ruler

" incremental search
set incsearch

" let em use mouse when available
if has("mouse")
	set mouse=a
endif

" syntax hlightinh
syntax on

" hilight last search
set hlsearch

if has("autocmd")
	" enable filetype detection
	filetype plugin indent on
else
	set autoindent
endif


highlight Normal guibg=grey90

colorscheme xoria256
