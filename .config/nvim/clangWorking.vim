" Plugins.
call plug#begin('~/.vim/plugged')

Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/deoplete-clangx'

call plug#end()

" Deoplete settings.
let g:deoplete#enable_at_startup = 1
call deoplete#custom#var('clangx', 'clang_binary', '/usr/bin/clang')
