syntax on

call plug#begin('~/.vim/plugged')

Plug 'majutsushi/tagbar'   " Tagbar
Plug 'scrooloose/nerdtree'  " file list
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  "to highlight files in nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'

" ================ Colorshemes ======================
Plug 'rainglow/vim'
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
Plug 'chriskempson/base16-vim'
Plug 'lifepillar/vim-solarized8'
Plug 'lifepillar/vim-gruvbox8'

Plug 'vim-airline/vim-airline'                      " make statusline awesome
Plug 'vim-airline/vim-airline-themes'               " themes for statusline 7
Plug 'davidhalter/jedi-vim'                         " jedi for python
Plug 'Vimjas/vim-python-pep8-indent'                " better indenting for python
Plug 'tweekmonster/impsort.vim'                     " color and sort imports
Plug 'wsdjeg/FlyGrep.vim'                           " awesome grep on the fly
Plug 'tpope/vim-commentary'                         " comment-out by gc
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'

" ================ Autocomplete ======================
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'roxma/nvim-yarp'                              " dependency of ncm2
Plug 'ncm2/ncm2'                                    " awesome autocomplete plugin
Plug 'ncm2/ncm2-jedi'                               " fast python completion (use ncm2 if you want type info or snippet support)
Plug 'ncm2/ncm2-bufword'                            " buffer keyword completion
Plug 'ncm2/ncm2-path'                               " filepath completion
Plug 'SirVer/ultisnips'                             " Track the engine.
Plug 'honza/vim-snippets'                           " Snippets are separated from the engine. Add this if you want them:
Plug 'w0rp/ale'                                     " python linters
Plug 'neomake/neomake'
" Plug 'psf/black'
Plug 'tpope/vim-surround'                           " quoting/parenthesizing made simple
Plug 'junegunn/goyo.vim'                            " Distraction free writing
Plug 'jiangmiao/auto-pairs'                         " Automatic insertion and deletion of a pair of characters

Plug 'terryma/vim-multiple-cursors'                 " multiple selections for Vim
Plug 'tpope/vim-eunuch'                                     " Handy unix command inside Vim (Rename, Move etc.)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'miyakogi/conoline.vim'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for': 'python' }  " Python syntax highlighting and more
Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}     " Python indent (follows the PEP8 style)
" Plug 'tmhedberg/SimpylFold', { 'for': 'python' }          " Python code folding

Plug 'junegunn/limelight.vim', {'for': 'markdown'}          " Only light on your cursor line to help you focus
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': 'markdown' }  " Markdown syntax highlighting
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }       " Another markdown plugin
Plug 'elzr/vim-json', { 'for': ['json', 'markdown'] }       " Markdown JSON header highlight plugin

Plug 'jeffkreeftmeijer/vim-numbertoggle'                    " Automatically toggle line number based on several conditions
Plug 'machakann/vim-highlightedyank'                        " Highlight yanked region
Plug 'itchyny/vim-highlighturl'                             " Highlight urls

Plug 'lervag/vimtex'                                        " Latex
Plug 'Konfekt/FastFold'

" For Windows and Mac, we can open an URL in the browser. For Linux, it may
" not be possible since we maybe in a server which disables GUI.
if has('win32') || has('macunix')
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
 if has('unix') && executable('tmux')
     " Let vim detect tmux focus event correctly, see
     " http://tinyurl.com/y4xd2w3r and http://tinyurl.com/y4878wwm
     Plug 'tmux-plugins/vim-tmux-focus-events'

     " .tmux.conf syntax highlighting and setting check
     Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }
 endif
"}}

Plug 'yuttie/comfortable-motion.vim'


call plug#end()
