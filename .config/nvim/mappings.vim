
" easy split movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" tabs:
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

" mapping Esc
imap <F13> <Esc>
cnoremap <Esc> <C-c>
inoremap <c-c> <ESC>
nnoremap <C-z> <Esc>  " disable terminal ctrl-z

" map S to replace current word with pasteboard
nnoremap S diw"0P
nnoremap cc "_cc
nnoremap q: :q<CR>
nnoremap w: :w<CR>

" map paste, yank and delete to named register so the content
" will not be overwritten (I know I should just remember...)
nnoremap x "_x
vnoremap x "_x


" theicfire .vimrc tips
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "," " Leader is the comma key
let g:mapleader = ","
let maplocalleader = "\\"
let g:maplocalleader = "\\"
nnoremap <SPACE> <Nop>

""" Custom Mappings
nmap <leader>r :so ~/.config/nvim/init.vim<CR>
nmap <leader>g :Goyo<CR>

"auto indent for brackets
nmap <leader>w :w!<cr>
nmap <leader>q :lcl<cr>:q<cr>
nnoremap <leader>h :nohlsearch<Bar>:echo<CR>

" mapping to make movements operate on 1 screen line in wrap mode
function! ScreenMovement(movement)
   if &wrap
      return "g" . a:movement
   else
      return a:movement
   endif
endfunction

onoremap <silent> <expr> j ScreenMovement("j")
onoremap <silent> <expr> k ScreenMovement("k")
onoremap <silent> <expr> 0 ScreenMovement("0")
onoremap <silent> <expr> ^ ScreenMovement("^")
onoremap <silent> <expr> $ ScreenMovement("$")
nnoremap <silent> <expr> j ScreenMovement("j")
nnoremap <silent> <expr> k ScreenMovement("k")
nnoremap <silent> <expr> 0 ScreenMovement("0")
nnoremap <silent> <expr> ^ ScreenMovement("^")
nnoremap <silent> <expr> $ ScreenMovement("$")


" **** FlyGrep settings
nnoremap <leader>s :FlyGrep<cr>

" **** YouCompleteMe
"" Remap ycm keys to iterate over list, as by default are mapped to tab and
"" s-tab, which breaks ultisnips
"let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
"let g:ycm_autoclose_preview_window_after_completion=1
"nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap <leader>d :YcmCompleter GoTo<CR>
" nnoremap <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>
" nnoremap <leader>s :YcmCompleter GoToDeclaration<CR>


" Remove all trailing whitespace by pressing C-S
nnoremap <C-S> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" move between defs python:
" NOTE: this break shortcuts with []
nnoremap [[ [m
nnoremap ]] ]m

nnoremap <silent><nowait> [ [[
nnoremap <silent><nowait> ] ]]

function! MakeBracketMaps()
    nnoremap <silent><nowait><buffer> [ :<c-u>exe 'normal '.v:count.'[m'<cr>
    nnoremap <silent><nowait><buffer> ] :<c-u>exe 'normal '.v:count.']m'<cr>
endfunction

augroup bracketmaps
    autocmd!
    autocmd FileType python call MakeBracketMaps()
augroup END

" neovim options
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
nnoremap <C-a> <Esc>
nnoremap <C-x> <Esc>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()

" """"""""""""""""""""""" Personalized key bindings """""""""""""""""""""""""""
" Fix for laggy shift finger
command WQ wq
command Wq wq
command W w
command Q q
" Allow to use :w!! to write to a file using sudo if you forgot to
" 'sudo vim file' (it will prompt for sudo password)
cmap w!! %!sudo tee > /dev/null %
" Move between windows with alt+arrows
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
imap jj <Esc>|                                  " Map jj to <Esc>

" This is useful to move between errors catch by linters
" In this .dotfile linters are asynchronously called by vim-ale
" Default pyflake and pylint
nmap <C-W><C-W> :lnext<CR>|                     " Map ctrl-W to next error
nmap <C-B><C-B> :lprevious<CR>|                 " Map ctrl-B to next error
nmap <C-I><C-I> :lrewind<CR>|                   " Map ctrl-I to next error

:nnoremap <Space> i_<Esc>r|                     " Insert single char in normal mode with space + char
map <silent> <leader><cr> :noh<cr>|             " <leader><cr> disables highlight
noremap <F8> :set spell spelllang=en_us <CR>|   " Activate spell check

" **** Jump to the last position when reopening a file (NB: .viminfo should be owned by your user)
" Note: could also use Plugin 'farmergreg/vim-lastplace'
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" **** Autopep8 (autofix pep8 errors)
noremap <F6> :!autopep8 --in-place --aggressive --aggressive %

" **** Gundo (navigate through undo list)
nnoremap <F4> :GundoToggle<CR>

" **** Black
nnoremap <F7> :Black<CR>
let g:black_linelength = 80

" **** Wrap options
set breakindent  " preserve horizontal whitespace when wrapping
set showbreak=+++
set lbr  " wrap words
set nowrap  " i turn on wrap manually when needed

command! -nargs=* Wrap set wrap linebreak nolist
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^

" Semshi python mappings
nmap <silent> <leader>rr :Semshi rename<CR>
nmap <silent> <Tab> :Semshi goto name next<CR>
nmap <silent> <S-Tab> :Semshi goto name prev<CR>
nmap <silent> <leader>c :Semshi goto class next<CR>
nmap <silent> <leader>C :Semshi goto class prev<CR>
nmap <silent> <leader>f :Semshi goto function next<CR>
nmap <silent> <leader>F :Semshi goto function prev<CR>
nmap <silent> <leader>gu :Semshi goto unresolved first<CR>
nmap <silent> <leader>gp :Semshi goto parameterUnused first<CR>
nmap <silent> <leader>ee :Semshi error<CR>
nmap <silent> <leader>ge :Semshi goto error<CR>
