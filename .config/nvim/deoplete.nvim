" Directory for Plugins
call plug#begin('~/.vim/plugged')

" Autocomplete
Plug 'justmao945/vim-clang' " Syntax checking

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete-clangx'
Plug 'Shougo/neoinclude.vim'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'Shougo/echodoc.vim'

" File System Manager
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

" Syntax highlighting
Plug 'petrbroz/vim-glsl'
Plug 'arakashic/chromatica.nvim'
Plug 'petRUShka/vim-opencl'
Plug 'othree/yajs.vim'
Plug 'justinmk/vim-syntax-extra' " C
Plug 'oblitum/rainbow' " Brackets 
Plug 'pangloss/vim-javascript'

" Vim preview for latex
Plug 'xuhdev/vim-latex-live-preview', { 'for' : 'tex' }

" Comment hole lines
Plug 'scrooloose/nerdcommenter'

" fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" auto close brackets
Plug 'Townk/vim-autoclose'
Plug 'jiangmiao/auto-pairs'

" tmux navigator
Plug 'christoomey/vim-tmux-navigator'

" Bottom line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'powerline/powerline-fonts'

" Colorschemes
Plug 'morhetz/gruvbox'

call plug#end()
" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

" fuzzy finder with ;
map ; :Files<CR>
nmap <C-b> :ClangSyntaxCheck<CR>
map I :! pdflatex %<CR><CR> 
map S :! mupdf $(echo % \| sed 's/tex$/pdf/') & disown<CR>
nmap <C-t> :TagbarToggle<CR>
nmap <F3> :NERDTree<CR>

highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight Normal guibg=none
highlight NonText guibg=none

au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red

" Change clang options
call deoplete#custom#var('clangx', 'clang_binary', '/usr/bin/clang')
call deoplete#custom#var('clangx', 'default_c_options', '')
call deoplete#custom#var('clangx', 'default_cpp_options', '')

let g:echodoc#enable_at_startup = 1
let g:deoplete#enable_at_startup = 1
let g:livepreview_cursorhold_recompile=0
let g:livepreview_previewer='zathura'
let g:javascript_plugin_jsdoc = 1
let g:AutoPairsFlyMode = 1
let g:javascript_plugin_ngdoc = 1
let g:rainbow_active = 0

" configure gruvbox-colorscheme
let g:gruvbox_contrast_dark='medium'
let g:airline_theme='minimalist'
let g:airline_powerline_fonts=1

set tabstop=4
set number
set relativenumber
set incsearch
set ignorecase
set smartcase
set nohlsearch
set softtabstop=4
set shiftwidth=4
set noexpandtab
set expandtab
set encoding=utf-8
set noshowmode
set laststatus=2
set guifont=Ubuntu\ Mono\ for\ Powerline
set t_Co=256

colorscheme gruvbox

