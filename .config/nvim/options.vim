" let g:python3_host_prog = '/usr/bin/python3'
" let g:python_host_prog = '/usr/bin/python2'

filetype indent on

" ================ Colorscheme ======================
set t_Co=256
set laststatus=2  " always slow statusline
" set $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set background=dark

colorscheme solarized8_flat
let g:airline_theme='solarized'

" colorscheme moonfly
" let g:lightline = { 'colorscheme': 'moonfly' }

" colorscheme onehalfdark
" let g:airline_theme='onehalfdark'

" Hightlight current line
let g:conoline_auto_enable = 1
let g:conoline_use_colorscheme_default_insert=1
let g:conoline_use_colorscheme_default_normal=1

" let $NVIM_PYTHON_LOG_FILE="/home/ciccone/nvim_log"
" let $NVIM_PYTHON_LOG_LEVEL="DEBUG"

" ================ Indentation ======================
"
" set autoindent                        " New line inherits indentation from the previous line
" set nosmartindent                     " Avoid losing indentation when inserting '#'
" set cindent                           " Should be smarter than smartindent. Autoindents after brackets, ..
set tabstop=4                           " 1 Tab = 4 spaces
set softtabstop=4                       " Number of spaces for tab in insert mode
set shiftwidth=4                        " 1 Tab = 4 spaces
set smarttab                            " Interpret Tab depending on where is the cursor
set expandtab                           " Substitute tabs with spaces
set ai                                  " Auto indent: copy indentation from previous line
set wrap                                " Wrap lines
" set nowrap                              " Don't wrap lines
set linebreak                           " Wrap lines at convenient points

" Auto indent pasted text
" nnoremap p p=`]<C-o>
" nnoremap P P=`]<C-o>

filetype plugin on
filetype indent on

set list listchars=tab:\ \ ,trail:·     " Display tabs and trailing spaces visually


" ================ Turn Off Swap Files ==============
"
set nobackup                    " no backup or swap file, live dangerously
set nowb
set noswapfile                  " swap files give annoying warning
set undodir=~/.vim/undodir      " Where to store the undo file
" set undofile                  " Use an undo file: persistent undos!
set viminfo='20,<1000  " allow copying of more than 50 lines to other applications
" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %     :  saves and restores the buffer list
"  n... :  where to save the viminfo files
"" set viminfo='10,\"100,:20,%,n~/.viminfo

" ================ General Config ====================
"
set fillchars+=vert:\           " remove chars from seperators
set history=10000               " Lines of history to remember
set undolevels=10000            " Number of undos stored on disk
set undoreload=100000           " maximum number lines to save for undo on a buffer reload
set undofile                    " Use an undo file: persistent undos!
set undodir=~/.vimundo/         " Where to store the undo file
set autoread                    " Check if file is modified externally
set backspace=eol,start,indent  " Configure backspace so it acts as it should
" set number                    " always show current line number
" set relativenumber
set scrolloff=3                 " keep three lines between the cursor and the edge of the screen

syntax on
set whichwrap+=<,>,h,l
set lazyredraw                 " Don't redraw during macros (for performance)
set ttyfast                    " Send more characters for redraws
set encoding=utf8              " Use utf8/en_US
set ffs=unix,dos,mac           " Use Unix as the standard file type
let mapleader=","
set tm=500                     " Timeout after leader key
map <C-Z> <Nop>|               " Prevent ctrl-z from closing vim
set pastetoggle=<F2>           " F2 = paste mode toggle
set clipboard=unnamedplus      " Use system clipboard
set splitbelow                 " Open new split panes to right and bottom
set splitright                 " Open new split panes to right and bottom
set mouse=a                    " Enable mouse scrolling
" set ttymouse=xterm
set shortmess+=c
set noshowmode                  " keep command line clean
set noshowcmd
set cpoptions+=x                " stay at seach item when <esc>
set t_vb=                       " set the effect of the vim visual bell to do nothing
set noerrorbells                " remove bells (i think this is default in neovim)
set visualbell

" ================ Vim User Interface ====================
"
set so=7                        " Autoscroll to keep cursor n lines from top/bottom of page
set wildmenu                    " Turn on the WiLd menu (autocomplete :commands)
set wildmode=longest:list,full
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pdf,*.aux
set showmatch                   " Show matching brackets
set mat=3                       " Tenths of a second to blink when matching brackets
set showcmd                     " Show incomplete commands
set ruler                       " Always show current position
set rulerformat=%l,%c%V%=%P     " Show line and percentage (default)
set cmdheight=1                 " Height of the command bar

" ================ Vim search setup ====================
"
set hlsearch        " Highlight matches
set incsearch       " Makes search act like search in modern browsers
set ignorecase      " Set case insensitive search
set smartcase       " Case sensitive only if uppercase target
set wrapscan        " begin search from top of file when nothing is found anymore

" ================ Errors and warnings notification ====================
"
"" " Syntax highlight and colors
"" syntax on                           " Enable syntax highlighting
"" filetype on                         " Try to detect filetypes
"" filetype plugin indent on           " Turn on filetype-specific indenting modes and plugins
"" let python_highlight_all=1          " Extra highlights

" Do not show "match xx of xx" and other messages during auto-completion
set shortmess+=c

" Completion behaviour
set completeopt+=noinsert  " Auto select the first completion entry
set completeopt+=menuone  " Show menu even if there is only one item
set completeopt-=preview  " Disable the preview window
