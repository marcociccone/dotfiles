"{ Main configurations

let g:is_win = has('win32') || has('win64')
let g:is_linux = has('unix') && !has('macunix')
let g:is_mac = has('macunix')

" If you are using Neovim on Linux system and want to set it up system wide
" for users, set g:nvim_system_wide to 1. If you only want to use it for
" personal need, set this variable to 0.
let g:nvim_system_wide=0

" Do not set this varialbe if the system is not *nix
if g:nvim_system_wide
    if !g:is_linux
        let g:nvim_system_wide = 0
    endif
endif

let g:nvim_config_root = expand('<sfile>:p:h')

    " \ 'variables.vim',
    " \ 'options.vim',
    " \ 'autocommands.vim',
let g:config_file_list = ['plugins.vim', 'mappings.vim', 'options.vim']

for f in g:config_file_list
    execute 'source ' . g:nvim_config_root . '/' . f
endfor
"}
