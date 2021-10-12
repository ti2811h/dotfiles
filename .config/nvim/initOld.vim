" Directory for Plugins
call plug#begin('~/.vim/plugged')

" Autocomplete
Plug 'neoclide/coc.nvim'
Plug 'justmao945/vim-clang' " Syntax checking
Plug 'Shougo/echodoc.vim'

" File System Manager
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'camspiers/animate.vim' 

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
Plug 'lervag/vimtex'

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

Plug 'jalvesaq/Nvim-R'

call plug#end()

" sync open file with NERDTree
" Check if NERDTree is open or active
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

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

noremap <SPACE> <Nop>
map <Space> <leader>

" terminal mapping 
tnoremap <Esc> <C-\><C-n>

" Basic vim remap
map <leader>ws :split<CR>
map <leader>wv :vsplit<CR>
map <leader>l  <C-l>
map <leader>h  <C-h>
map <leader>j  <C-j>
map <leader>k  <C-k>
map <leader>wq :wq<CR>
map <leader>q  :q!<CR>
nnoremap <silent> <Right>    :call animate#window_delta_width(5)<CR>
nnoremap <silent> <Left>     :call animate#window_delta_width(-5)<CR>
nnoremap <silent> <Up>       :call animate#window_delta_height(5)<CR>
nnoremap <silent> <Down>       :call animate#window_delta_height(-5)<CR>
map <leader>t  :terminal<CR>

" fuzzy finder with ;
map <leader>. :Files<CR>
nmap <leader>b :ClangSyntaxCheck<CR>
map <leader>I :! pdflatex %<CR><CR>
map <leader>S :! zathura $(echo % \| sed 's/tex$/pdf/') & disown<CR>
nmap <C-t> :TagbarToggle<CR>
nmap <leader>n :NERDTreeToggle<CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight Normal guibg=none
highlight NonText guibg=none

au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red

let g:echodoc#enable_at_startup = 1
let g:livepreview_cursorhold_recompile=0
let g:livepreview_previewer='zathura'
let g:javascript_plugin_jsdoc = 1
let g:AutoPairsFlyMode = 1
let g:javascript_plugin_ngdoc = 1
let g:rainbow_active = 0
let g:tex_flavor = 'latex'

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

" TAB to trigger completion ':verbose imap <tab>'
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <c-space> coc#refresh() " trigger completion

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif



nnoremap <silent><leader>' :call <SID>show_documentation()<CR> " K to show documentation

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-tsserver' ]
" coc
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

" Start NerdTree and bring cursor back in file 
" autocmd VimEnter * NERDTree | wincmd p 

autocmd Filetype tex setl updatetime=1

colorscheme gruvbox


