" store last 50 cmds
set history=50

" show cursor pos all time
set ruler

" incremental search
set incsearch
set ignorecase

" let em use mouse when available
"if has("mouse")
"	set mouse=a
"endif

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

"colorscheme xoria256

" some pythonic stuff from elsewere
set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set softtabstop=2
set autoindent
highlight BadWhitespace ctermbg=red guibg=red
match BadWhitespace /^\t\+/
match BadWhitespace /\s\+$/

" show matching braces
set showmatch

" no ugly toolbar in gui
set guioptions-=T

set number

" no wraps
set wrap!


" when we have a colored terminal or gui...
if &t_Co > 2 || has("gui_running")
    " ...then use highlighting
    syntax on
endif

if has("gui_running")
    "Standartgroesse bei'm GUI-Fenster
    "columns    width of the display
    set co=98
    "lines      number of lines in the display
    set lines=41
endif

" how many lines to sync backwards
syn sync minlines=10000 maxlines=10000

" how many lines to search backward after a jump to check syntax
let c_minlines = 200

" aldo highlight some things in comments
let c_comment_strings = 1

" SQL-Highlighting in PHP-Strings (1=yes 0=no)
let php_sql_query = 1
let php_minlines=1200
let php_htmlInStrings=1

" use white background in GUI-Mode, black on console

if has("gui_running") 
"|| &term=="xterm"
    set bg=light
else
    set bg=dark
endif
