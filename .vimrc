" show cursor pos all time
set ruler

" incremental search
set incsearch
set ignorecase

" let em use mouse when available
"if has("mouse")
"	set mouse=a
"endif

" syntax hlighting
syntax on

" hilight last search
set hlsearch

set background=dark
colorscheme solarized

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

let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(

filetype plugin indent on
filetype plugin on

" Taglist variables
" Display function name in status bar:
let g:ctags_statusline=1
" Automatically start script
let generate_tags=1
" Displays taglist results in a vertical window:
let Tlist_Use_Horiz_Window=0
" Shorter commands to toggle Taglist display
nnoremap TT :TlistToggle<CR>
map <F4> :TlistToggle<CR>
" Various Taglist diplay config:
let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_File_Fold_Auto_Close = 1

let g:pydiction_location = '/Users/ideamonk/.vim/after/ftplugin/complete-dict'

" Get this plugin from http://www.vim.org/scripts/script.php?script_id=1112
" Pressing "K" takes you to the documentation for the word under the cursor.
autocmd filetype python source ~/.vim/pydoc.vim


nnoremap NN :NERDTreeToggle<CR>
