" Install vim-plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" ---------------------------------------------------------------------
"  Plugin defintion
" ---------------------------------------------------------------------

syntax on
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'  " file list
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  "to highlight files in nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'

" Only install these plugins if ctags are installed on the system
if executable('ctags')
    " plugin to manage your tags
    " Plug 'ludovicchabant/vim-gutentags'
    " show file tags in vim window
    Plug 'majutsushi/tagbar', { 'on': ['TagbarToggle', 'TagbarOpen'] }
endif

" ================ Colorshemes ======================
Plug 'rainglow/vim'
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
Plug 'chriskempson/base16-vim'
Plug 'lifepillar/vim-solarized8'
Plug 'lifepillar/vim-gruvbox8'
Plug 'srcery-colors/srcery-vim'
Plug 'bluz71/vim-moonfly-colors'
Plug 'bluz71/vim-nightfly-guicolors'

Plug 'sonph/onehalf', {'rtp': 'vim/'}

Plug 'vim-airline/vim-airline'                      " make statusline awesome
Plug 'vim-airline/vim-airline-themes'               " themes for statusline 7

"{{ Python-related plugins
" Python completion, goto definition etc.
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
" Python syntax highlighting and more
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
" Python indent (follows the PEP8 style)
Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}
Plug 'tweekmonster/impsort.vim'                     " color and sort imports
Plug 'wsdjeg/FlyGrep.vim'                           " awesome grep on the fly
Plug 'tpope/vim-commentary'                         " comment-out by gc
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'

" ================ Autocomplete ======================

 " NCM2 Autocomplete
Plug 'roxma/nvim-yarp'                              " dependency of ncm2
Plug 'ncm2/ncm2'                                    " awesome autocomplete plugin
Plug 'ncm2/ncm2-jedi'                               " fast python completion (use ncm2 if you want type info or snippet support)
" Plug 'HansPinckaers/ncm2-jedi'                    " Fork to speed up, but it seems to be breaking popup autocomplete
Plug 'ncm2/ncm2-bufword'                            " buffer keyword completion
Plug 'ncm2/ncm2-path'                               " filepath completion
Plug 'ncm2/ncm2-ultisnips'                          " snippets completion

Plug 'SirVer/ultisnips'                             " Track the engine.
Plug 'honza/vim-snippets'                           " Snippets are separated from the engine. Add this if you want them:
" Plug 'dense-analysis/ale'                         " python linters
Plug 'neomake/neomake'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }  " Automatically generate pydocstring

" Auto format tools
Plug 'sbdchd/neoformat', { 'on': 'Neoformat' }
" Plug 'Chiel92/vim-autoformat'
"}}

" Plug 'psf/black'
Plug 'tpope/vim-surround'                           " quoting/parenthesizing made simple
Plug 'junegunn/goyo.vim'                            " Distraction free writing
Plug 'jiangmiao/auto-pairs'                         " Automatic insertion and deletion of a pair of characters
Plug 'terryma/vim-multiple-cursors'                 " multiple selections for Vim
Plug 'tpope/vim-eunuch'                             " Handy unix command inside Vim (Rename, Move etc.)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'miyakogi/conoline.vim'                                " This plugin highlights the line of the cursor, only in the current window
" Plug 'tmhedberg/SimpylFold', { 'for': 'python' }          " Python code folding

" ================ Markdown ======================
Plug 'junegunn/limelight.vim', {'for': 'markdown'}          " Only light on your cursor line to help you focus
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': 'markdown' }  " Markdown syntax highlighting
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }       " Another markdown plugin
Plug 'elzr/vim-json', { 'for': ['json', 'markdown'] }       " Markdown JSON header highlight plugin
if g:is_win || g:is_mac
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug'] }
endif

Plug 'jeffkreeftmeijer/vim-numbertoggle'                    " Automatically toggle line number based on several conditions
Plug 'machakann/vim-highlightedyank'                        " Highlight yanked region
Plug 'itchyny/vim-highlighturl'                             " Highlight urls

Plug 'lervag/vimtex'                                        " Latex
Plug 'Konfekt/FastFold'

" For Windows and Mac, we can open an URL in the browser. For Linux, it may
" not be possible since we maybe in a server which disables GUI.
if g:is_win || g:is_mac
    Plug 'tyru/open-browser.vim'                            " open URL in browser
    Plug 'svermeulen/vim-yoink'                             " Manage your yank history
endif

" *** Git Diff on the vertical left sidebar
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

"{{ Tmux related plugins
" Since tmux is only available on Linux and Mac, we only enable these plugins
" for Linux and Mac
if (g:is_linux || g:is_mac) && executable('tmux')
    " Let vim detect tmux focus event correctly, see
    " http://tinyurl.com/y4xd2w3r and http://tinyurl.com/y4878wwm
    Plug 'tmux-plugins/vim-tmux-focus-events'

    " .tmux.conf syntax highlighting and setting check
    Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }
endif
"}}

"{{ Misc plugins
" Modern matchit implementation (highlist construct start-end)
Plug 'andymass/vim-matchup'
" Simulating smooth scroll motions with physcis
" Plug 'yuttie/comfortable-motion.vim'

Plug 'tpope/vim-scriptease'
" Asynchronous command execution
Plug 'skywind3000/asyncrun.vim'
"}}

" Debugger plugin
if g:is_mac || g:is_linux
    Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
endif

call plug#end()

" ---------------------------------------------------------------------
"  Plugin settings
" ---------------------------------------------------------------------

""""""""""""""""""""""""""" semshi settings """""""""""""""""""""""""""""""
" Do not highlight for all occurances of variable under cursor
let g:semshi#mark_selected_nodes=0
" Do not show error sign since neomake/ale is specicialized for that
let g:semshi#error_sign=v:false

let g:semshi#excluded_hl_groups=['local', 'attribute']
let g:semshi#no_default_builtin_highlight=1
let g:semshi#simplify_markup=1
"}}


"""""""""""""""""""""""""" ncm2 autocomplete settings """""""""""""""""""""""""""""""
" https://medium.com/@hanspinckaers/setting-up-vim-as-an-ide-for-python-773722142d1d
"" Enable NCM2 for all buffers {
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=menuone,noselect,noinsert
" make it FAST
let ncm2#popup_delay = 1
let ncm2#complete_length = [[1,1]]
let g:ncm2#matcher = 'substrfuzzy'
let g:ncm2#popup_limit = 20
let g:ncm2#total_popup_limit = 20

" supress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" enable auto complete for `<backspace>`, `<c-w>` keys.
" known issue https://github.com/ncm2/ncm2/issues/7
au TextChangedI * call ncm2#auto_trigger()

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu, see https://vi.stackexchange.com/q/19675/15292.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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

" wrap existing omnifunc
" Note that omnifunc does not run in background and may probably block the
" editor. If you don't want to be blocked by omnifunc too often, you could
" add 180ms delay before the omni wrapper:
au User Ncm2Plugin call ncm2#register_source({
        \ 'name' : 'css',
        \ 'priority': 9,
        \ 'subscope_enable': 1,
        \ 'scope': ['css','scss'],
        \ 'mark': 'css',
        \ 'word_pattern': '[\w\-]+',
        \ 'complete_pattern': ':\s*',
        \ 'on_complete': ['ncm2#on_complete#delay', 180,
            \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
        \ })

" Pydocstring
let g:pydocstring_formatter = 'google'
nmap <silent> <C-_> <Plug>(pydocstring)


"""""""""""""""""""""""""" NERDTree settings """""""""""""""""""""""""""""""
" toggle nerdtree on ctrl+n
map <C-n> :NERDTreeToggle<CR>
" close NerdTree if it is the last window
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" open NERDTree if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" open NERDTree if open a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
let g:NERDTreeGitStatusWithFlags = 1

" Reveal currently editted file in nerdtree widnow,
" see https://stackoverflow.com/q/7692233/6064933
nnoremap <silent> <Space>f :NERDTreeFind<CR>

" Ignore certain files and folders
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$']

" Delete a file buffer when you have deleted it in nerdtree
let NERDTreeAutoDeleteBuffer = 1

" Show current root as realtive path from HOME in status bar,
" see https://github.com/scrooloose/nerdtree/issues/891
let NERDTreeStatusline="%{exists('b:NERDTree')?fnamemodify(b:NERDTree.root.path.str(), ':~'):''}"

" Disable bookmark and 'press ? for help' text
let NERDTreeMinimalUI=0


""""""""""""""""""""""""""" tagbar settings """"""""""""""""""""""""""""""""""
map <C-t> :set nosplitright<CR>:TagbarToggle<CR>:set splitright<CR>
" Add support for markdown files in tagbar.
if g:is_win
    let g:md_ctags_bin=fnamemodify(g:nvim_config_root."\\tools\\markdown2ctags.exe", ":p")
else
    let g:md_ctags_bin=fnamemodify(g:nvim_config_root."/tools/markdown2ctags.py", ":p")
endif

let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown.pandoc',
    \ 'ctagsbin' : g:md_ctags_bin,
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
    \ }
"}}


"""""""""""""""""""""""""" UltiSnips settings """""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab>
" if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-space>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:ultisnips_python_style='google'

" **** Tasklist ****
map <leader>tl <Plug>TaskList

"""""""""""""""""""""""""" Airline settings """""""""""""""""""""""""""""""
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

"{{ Linting and formating
"""""""""""""""""""""""""""""" ale settings """""""""""""""""""""""
" let g:ale_python_flake8_options = '--ignore=E129,E501,E302,E265,E241,E305,E402,W503'
" let g:ale_python_pylint_options = '-j 0 --max-line-length=80 --ignore=C0111'
" let g:ale_list_window_size = 4
" let g:ale_sign_column_always = 0
" let g:ale_open_list = 0
" let g:ale_keep_list_window_open = '0'

" " Options are in .pylintrc!
" highlight VertSplit ctermbg=253

" " Linter signs
" let g:ale_sign_error = '‼'
" let g:ale_sign_warning = '!'
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_enter = '1'
" let g:ale_lint_on_save = '1'
" let g:ale_set_baloons = '1'
" let g:ale_hotver_to_preview = '1'
" nmap <silent> <C-M> <Plug>(ale_previous_wrap)
" nmap <silent> <C-m> <Plug>(ale_next_wrap)

" " linters for different filetypes
" let g:ale_linters = {
"     \ 'python': ['pylint', 'flake8'],
"     \ 'vim': ['vint']
" \}

" " Only run linters in the g:ale_linters dictionary
" let g:ale_linters_explicit = 1

"""""""""""""""""""""""""""""" neoformat settings """""""""""""""""""""""
let g:neoformat_enabled_python = ['black', 'yapf']
"}}


" highlight python and self function
autocmd BufEnter * syntax match Type /\v\.[a-zA-Z0-9_]+\ze(\[|\s|$|,|\]|\)|\.|:)/hs=s+1
autocmd BufEnter * syntax match pythonFunction /\v[[:alnum:]_]+\ze(\s?\()/
hi def link pythonFunction Function
autocmd BufEnter * syn match Self "\(\W\|^\)\@<=self\(\.\)\@="
highlight self ctermfg=239

" Jedi options
" Disable Jedi-vim autocompletion and enable call-signatures options
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


"""""""""""""""""""""""""plasticboy/vim-markdown settings"""""""""""""""""""
" Disable header folding
let g:vim_markdown_folding_disabled = 1

" Whether to use conceal feature in markdown
let g:vim_markdown_conceal = 0

" Disable math tex conceal and syntax highlight
let g:tex_conceal = ''
let g:vim_markdown_math = 0

" Support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format

" Let the TOC window autofit so that it doesn't take too much space
let g:vim_markdown_toc_autofit = 1

"""""""""""""""""""""""""markdown-preview settings"""""""""""""""""""
" Only setting this for suitable platforms
if g:is_win || g:is_mac
    " Do not close the preview tab when switching to other buffers
    let g:mkdp_auto_close = 0

    " Shortcuts to start and stop markdown previewing
    nnoremap <silent> <M-m> :MarkdownPreview<CR>
    nnoremap <silent> <M-S-m> :MarkdownPreviewStop<CR>
endif

""""""""""""""""""""""""vim-markdownfootnotes settings""""""""""""""""""""""""
" Replace the default mappings provided by the plugin
imap ^^ <Plug>AddVimFootnote
nmap ^^ <Plug>AddVimFootnote
imap @@ <Plug>ReturnFromFootnote
nmap @@ <Plug>ReturnFromFootnote

" **** Supertab
" au FileType python set omnifunc=pythoncomplete#Complete " This breaks Jedi
let g:SuperTabDefaultCompletionType = "context"
" set completeopt=menuone,longest,preview  # kyle
let g:SuperTabDefaultCompletionType = "<c-x><c-o>" " always use omni completion (i.e. Jedi)


" ================ Multiple-Cursor settings ======================
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_start_word_key      = '<C-m>'
let g:multi_cursor_select_all_word_key = '<A-m>'
let g:multi_cursor_start_key           = 'g<C-m>'
let g:multi_cursor_select_all_key      = 'g<A-m>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'


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

""""""""""""""""""""""""""""vim-matchup settings"""""""""""""""""""""""""""""
" Improve performance
let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_timeout = 100
let g:matchup_matchparen_insert_timeout = 30

" Enhanced matching with matchup plugin
let g:matchup_override_vimtex = 1

" Whether to enable matching inside comment or string
let g:matchup_delim_noskips = 0

" Show offscreen match pair in popup window
let g:matchup_matchparen_offscreen = {'method': 'popup'}

" Change highlight color of matching bracket for better visual effects
augroup matchup_matchparen_highlight
  autocmd!
  autocmd ColorScheme * highlight MatchParen cterm=underline gui=underline
augroup END

" Show matching keyword as underlined text to reduce color clutter
augroup matchup_matchword_highlight
    autocmd!
    autocmd ColorScheme * hi MatchWord cterm=underline gui=underline
augroup END

""""""""""""""""""""""""comfortable-motion settings """"""""""""""""""""""
" let g:comfortable_motion_scroll_down_key = 'j'
" let g:comfortable_motion_scroll_up_key = 'k'

" let g:comfortable_motion_no_default_key_mappings = 1
" " scroll based on window height
" nnoremap <silent> <C-d> :call comfortable_motion#flick(winheight(0) * 2)<CR>
" nnoremap <silent> <C-u> :call comfortable_motion#flick(winheight(0) * -2)<CR>
" nnoremap <silent> <C-f> :call comfortable_motion#flick(winheight(0) * 4)<CR>
" nnoremap <silent> <C-b> :call comfortable_motion#flick(winheight(0) * -4)<CR>

" " Mouse settings
" noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(20)<CR>
" noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-20)<CR>

"""""""""""""""""""""""""" asyncrun.vim settings """"""""""""""""""""""""""
" Automatically open quickfix window of 6 line tall after asyncrun starts
let g:asyncrun_open = 6
if g:is_win
    " Command output encoding for Windows
    let g:asyncrun_encs = 'gbk'
endif


