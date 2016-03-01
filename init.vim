" Standard Vim Settings
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
syntax on
colorscheme wombat256
set number
set nocompatible
set shell=bash
set clipboard=unnamedplus

" NERDTree Settings
let g:NERDTreeWinSize = 40
" For some reason this setting below is broken, will use the default 't' binding for now
"let g:NERDTreeMapOpenInTab='<Enter>'
let g:NERDTreeMapOpenInTab='t'
let g:NERDTreeMapOpenInTabSilent='T'
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.obj$', '\.o$']
let g:nerdtree_tabs_open_on_gui_startup=0

" Plugins to install through vim-plug
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/syntastic'
Plug 'vim-scripts/awk.vim'
Plug 'fatih/vim-go'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --gocode-completer' }
Plug 'jiangmiao/auto-pairs'
Plug 'bling/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'rust-lang/rust.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Chiel92/vim-autoformat'
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'terryma/vim-multiple-cursors'
"Plug 'tpope/vim-surround'
Plug 'flazz/vim-colorschemes', { 'do' : 'mkdir ~/.vim/colors; mv ~/.vim/colors ~/.config/nvim/colors/' }
call plug#end()

" Cursor configuration
"http://vim.wikia.com/wiki/Configuring_the_cursor
highlight Cursor guibg=steelblue
highlight iCursor guibg=steelblue
highlight iCursor guifg=white guibg=steelblue

" Airline Settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1

" Gitgutter Settings
let g:gitgutter_max_signs = 1500

" Syntastic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" YouCompleteMe Settings
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
"let g:ycm_confirm_extra_conf = 0

" Force cuda filetype to C to work with clang completion
autocmd FileType cuda set ft=cuda.c

""""""""""""""""""""
" Colemak Mappings "
"""""""""""""""""""

noremap h :
noremap d <DEL>
noremap DD dd
imap <M-Space> <Esc>
noremap gg T

" Movement Keys
noremap n h
noremap e j
noremap i k
noremap o l

" insert
noremap a i
" insert at beginning of line
noremap A I
" append
noremap s a
" append at end of line
noremap S A

" search to next
noremap <C-k> n
" search to last
noremap <C-m> N

" Next Error
noremap ] :lnext<CR>
" Previous Error
noremap [ :lprevious<CR>

" end of word
noremap I e
" end of line
noremap O g_
" beginning of word
noremap E b
"beginning of line
noremap N _

" Page Half Down
noremap <C-e> <C-d>
"Page Half Up
noremap <C-i> <C-u>

" U = Redo with U
noremap U <C-r>

" c-h/c-i switches tabs [inoremap <c-i> messes up insert-mode tabbing]
noremap <C-n> <C-PageUp>
noremap <C-o> <C-PageDown>

" this nerdtree mapping interferes with movement
let g:NERDTreeMapOpenExpl = ";"
let g:NERDTreeMapOpenSplit = ";"

:tnoremap <Esc> <C-\><C-n>

nmap <F2> :NERDTreeTabsToggle<CR>
nmap <F3> :TagbarToggle<CR>
nmap <F4> :YcmCompleter FixIt<CR>
nmap <F5> :%s/\s\+$//<CR>
nmap <F6> :Autoformat<CR>
