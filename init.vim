" Standard Vim Settings
set smartindent
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
syntax on
colorscheme molokai
set number
set nocompatible
set shell=bash
set clipboard=unnamedplus
set nosmarttab
set undofile
set undodir=~/.config/nvim/undo
set undolevels=10000
set undoreload=10000
set splitright

" Plugins to install through vim-plug
call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/syntastic'
Plug 'vim-scripts/awk.vim'
Plug 'fatih/vim-go'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --gocode-completer' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'jiangmiao/auto-pairs'
Plug 'bling/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'rust-lang/rust.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Chiel92/vim-autoformat'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'mbbill/undotree'
Plug 'kien/ctrlp.vim'
Plug 'flazz/vim-colorschemes', { 'do' : 'mkdir ~/.config/nvim/colors; cp ~/.config/nvim/plugged/vim-colorschemes/colors/* ~/.config/nvim/colors/' }
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
call plug#end()

" Cursor configuration
"http://vim.wikia.com/wiki/Configuring_the_cursor
highlight Cursor guibg=steelblue
highlight iCursor guibg=steelblue
highlight iCursor guifg=white guibg=steelblue

" NERDTree Settings
let g:NERDTreeWinSize = 40
" For some reason this setting below is broken, will use the default 't' binding for now
"let g:NERDTreeMapOpenInTab='<Enter>'
let g:NERDTreeMapOpenInTab='t'
let g:NERDTreeMapOpenInTabSilent='T'
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.obj$', '\.o$']
let g:nerdtree_tabs_open_on_gui_startup=0

" Airline Settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1

" Syntastic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" YouCompleteMe Settings
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'
"let g:ycm_confirm_extra_conf = 0
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_min_num_of_chars_for_completion = 2

" Ctags Settings
set tags+=tags;$HOME

" Cscope Settings
let g:cscope_silent = 1
let g:cscope_open_location = 1
let g:cscope_auto_update = 1
let g:cscope_interested_files = '\.c$\|\.cpp$\|\.h$\|\.hpp$\|\.cu$\|\.cuh'

" vim-session settings
let g:session_autosave = 'no' 
let g:session_directory = '~/.config/nvim/sessions'

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

nmap <C-_> :nohlsearch<CR>

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

" Allow Esc in the built in neovim terminal
:tnoremap <Esc> <C-\><C-n>

" Mappings for Cscope
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	
" For opening files from cscope in a new tab
map <C-b> :wincmd gf<CR>

nmap <F2> :NERDTreeTabsToggle<CR>
nmap <F3> :TagbarToggle<CR>
nmap <F4> :FZF<CR>
nmap <F5> :call GoToTag(expand('<cword>'))<CR>
nmap <F10> :call CscopeCtagsRegenerate()<CR>
nmap <F11> :Autoformat<CR>
nmap <F12> :%s/\s\+$//<CR>

function CscopeCtagsRegenerate()
    ":call jobstart('cscope -b -k -q -R -U; ctags --languages=C,C++ --langmap=c++:+.cu. --c-kinds=+cdefgmpstv -R .')
    :Start! cscope -b -k -q -R -U; ctags --languages=C,C++ --langmap=c++:+.cu. --c-kinds=+cdefgmpstv -R .
    if filereadable("cscope.out")
        cs add cscope.out
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
endfunction

function GoToTag(tagword)
    let l:tagfile = &tags
    :tabnew
    exec 'set tags=' . l:tagfile
    exec ':silent tjump ' . a:tagword
    let l:tagFilename = expand('%:t')
    if l:tagFilename == ''
        :tabclose
    endif
endfunction

if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    "add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
        "else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
endif
