" let g:python3_host_prog = '/usr/bin/python3'
" let g:python_host_prog = '/usr/bin/python2'

filetype indent on

" ================ Colorscheme ======================
set t_Co=256
set laststatus=2  " always slow statusline
" set $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set background=dark
colorscheme solarized8
let g:airline_theme='solarized'


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
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

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


" toggle nerdtree on ctrl+n
map <C-n> :NERDTreeToggle<CR>
map <C-t> :set nosplitright<CR>:TagbarToggle<CR>:set splitright<CR>
" close NerdTree if it is the last window
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" open NERDTree if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" open NERDTree if open a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
let g:NERDTreeGitStatusWithFlags = 1

" **** Ulti-snips
" Trigger configuration. Do not use <tab>
" if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-space>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" **** Tasklist ****
map <leader>tl <Plug>TaskList

" **** ncm2 settings
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=menuone,noselect,noinsert
" make it FAST
let ncm2#popup_delay = 1
let ncm2#complete_length = [[1,1]]
let g:ncm2#matcher = 'substrfuzzy'

" NCM2
augroup NCM2
  autocmd!
  " some other settings...
  " uncomment this block if you use vimtex for LaTex
  autocmd Filetype tex call ncm2#register_source({
            \ 'name': 'vimtex',
            \ 'priority': 8,
            \ 'scope': ['tex'],
            \ 'mark': 'tex',
            \ 'word_pattern': '\w+',
            \ 'complete_pattern': g:vimtex#re#ncm2,
            \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
            \ })
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set pumheight=5
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent> <expr> <CR> (pumvisible() && empty(v:completed_item)) ?  "\<c-y>\<cr>" : "\<CR>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" **** Airline settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline_section_y = ""
let g:airline#extensions#tabline#enabled = 1
" do not show error/warning section
let g:airline_section_error = ""
let g:airline_section_warning = ""

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols (might be necessary for airline)
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:ycm_seed_identifiers_with_syntax = 0  " preseed with language syntax keywords

" **** NEOMake
" " When writing a buffer (no delay).
call neomake#configure#automake('w')
" When writing a buffer (no delay), and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 750)
" When reading a buffer (after 1s), and when writing (no delay).
call neomake#configure#automake('rw', 1000)
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 1s; no delay when writing).
call neomake#configure#automake('nrwi', 500)

" easy breakpoint python
au FileType python map <silent> <leader>b ofrom pudb import set_trace; set_trace()<esc>
au FileType python map <silent> <leader>B Ofrom pudb import set_trace; set_trace()<esc>
au FileType python map <silent> <leader>j ofrom pdb import set_trace; set_trace()<esc>
au FileType python map <silent> <leader>J Ofrom pdb import set_trace; set_trace()<esc>

" ale options
let g:ale_python_flake8_options = '--ignore=E129,E501,E302,E265,E241,E305,E402,W503'
let g:ale_python_pylint_options = '-j 0 --max-line-length=80 --ignore=C0111'
let g:ale_list_window_size = 4
let g:ale_sign_column_always = 0
let g:ale_open_list = 0
let g:ale_keep_list_window_open = '0'

" Options are in .pylintrc!
highlight VertSplit ctermbg=253

let g:ale_sign_error = '‼'
let g:ale_sign_warning = '∙'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = '0'
let g:ale_lint_on_save = '1'
nmap <silent> <C-M> <Plug>(ale_previous_wrap)
nmap <silent> <C-m> <Plug>(ale_next_wrap)

" highlight python and self function
autocmd BufEnter * syntax match Type /\v\.[a-zA-Z0-9_]+\ze(\[|\s|$|,|\]|\)|\.|:)/hs=s+1
autocmd BufEnter * syntax match pythonFunction /\v[[:alnum:]_]+\ze(\s?\()/
hi def link pythonFunction Function
autocmd BufEnter * syn match Self "\(\W\|^\)\@<=self\(\.\)\@="
highlight self ctermfg=239

" jedi options
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
let g:jedi#show_call_signatures_delay = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#show_call_signatures_modes = 'i'  " ni = also in normal mode
let g:jedi#enable_speed_debugging=0

" Impsort option
hi pythonImportedObject ctermfg=127
hi pythonImportedFuncDef ctermfg=127
hi pythonImportedClassDef ctermfg=127


" vimgutter options
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_map_keys = 0

" **** Vim signify
map <F9> :SignifyToggle<CR>
let g:signify_skip_filename_pattern  = ['\.pipertmp.*']
let g:signify_vcs_list               = [ 'git', 'perforce' ]
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '-'
let g:signify_sign_delete_first_line = '-'
let g:signify_sign_change            = '~'
let g:signify_sign_changedelete      = g:signify_sign_change
let g:signify_sign_show_count = 0
" default updatetime 4000ms is not good for async update
set updatetime=100

" **** Vim markdown
let g:vim_markdown_folding_disabled = 1

" Enable syntax highlighting for .bash_aliases
au BufNewFile,BufRead .bashrc*,bashrc,bash.bashrc,.bash_aliases,.bash_profile*,.bash_logout*,*.bash,*.ebuild set filetype=sh
au BufNewFile,BufRead *.txt set filetype=rest
" Enable spellcheck for tex and markdown
autocmd FileType latex,tex,md,markdown setlocal spell

" **** Supertab
" au FileType python set omnifunc=pythoncomplete#Complete " This breaks Jedi
let g:SuperTabDefaultCompletionType = "context"
" set completeopt=menuone,longest,preview  # kyle
let g:SuperTabDefaultCompletionType = "<c-x><c-o>" " always use omni completion (i.e. Jedi)


" """"""""""""""""""""""" Plugin settings """""""""""""""""""""""""""""""""""""

" **** VimTex
" }}}2
" {{{2 filetype: tex

let g:tex_stylish = 1
let g:tex_conceal = ''
let g:tex_flavor = 'latex'
let g:tex_isk='48-57,a-z,A-Z,192-255,:'

let g:vimtex_fold_manual = 1
let g:vimtex_latexmk_continuous = 1
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_index_split_pos = 'below'
let g:vimtex_fold_enabled = 0
let g:vimtex_toc_fold = 0
let g:vimtex_toc_hotkeys = {'enabled' : 1}
let g:vimtex_format_enabled = 1
let g:vimtex_imaps_leader = ';'
let g:vimtex_complete_img_use_tail = 1
let g:vimtex_view_automatic = 0
let g:vimtex_view_forward_search_on_start = 0
let g:vimtex_complete_enabled = 1
let g:vimtex_complete_close_braces = 1
let g:vimtex_complete_recursive_bib = 1

" by default on mac os open preview.app
" let g:vimtex_view_method = 'skim'
if has('nvim')
  let g:vimtex_compiler_progname = 'nvr'
endif

if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

call vimtex#imaps#add_map({
    \ 'lhs' : '<S-CR>',
    \ 'rhs' : '^M\item ',
    \ 'leader' : '',
    \ 'wrapper' : 'vimtex#imaps#wrap_environment',
    \ 'context' : ["itemize", "enumerate"],
    \})

let g:vimtex_compiler_latexmk = {
        \ 'backend' : 'process',
        \ 'background' : 1,
        \ 'build_dir' : '',
        \ 'callback' : 0,
        \ 'continuous' : 1,
        \ 'executable' : 'latexmk',
        \ 'options' : [
        \   '-pdf',
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}
