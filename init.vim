" Standard Vim Settings
set smartindent
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
syntax on
"colorscheme solarized
"set background=dark
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

" syntax highlighting
highlight PreProc    term=underline cterm=NONE ctermfg=5
highlight Identifier term=underline cterm=NONE ctermfg=6
highlight Comment    term=NONE      cterm=NONE ctermfg=1
highlight Constant   term=underline cterm=NONE ctermfg=2
highlight Special    term=bold      cterm=NONE ctermfg=9
highlight Statement  term=bold      cterm=bold ctermfg=4
highlight Type       term=underline cterm=NONE ctermfg=4

highlight ErrorMsg term=standout ctermbg=1 ctermfg=White
highlight IncSearch term=reverse cterm=reverse
highlight ModeMsg term=bold cterm=bold
highlight VertSplit term=reverse cterm=reverse
highlight Visual term=reverse cterm=reverse
highlight VisualNOS term=underline,bold cterm=underline,bold
highlight DiffText term=reverse cterm=bold ctermbg=9
highlight Directory term=bold ctermfg=4
highlight LineNr term=underline ctermfg=Black
highlight MoreMsg term=bold ctermfg=2
highlight Question term=standout ctermfg=2
highlight Search term=reverse ctermbg=3 ctermfg=NONE
highlight SpecialKey term=bold ctermfg=4
highlight Title term=bold ctermfg=5
highlight WarningMsg term=standout ctermfg=1
highlight WildMenu term=standout ctermbg=12 ctermfg=0
highlight Folded term=standout ctermbg=8 ctermfg=4
highlight FoldColumn term=standout ctermbg=8 ctermfg=4
highlight DiffAdd term=bold ctermbg=12
highlight DiffChange term=bold ctermbg=13
highlight DiffDelete term=bold ctermfg=4 ctermbg=14
highlight Ignore ctermfg=darkgrey

highlight DiffAdd term=bold ctermbg=10 ctermfg=0
highlight DiffChange term=bold ctermbg=13 ctermfg=0
highlight DiffDelete term=bold ctermfg=0 ctermbg=1
highlight SignColumn ctermbg=0

highlight StatusLine   cterm=bold ctermbg=4 ctermfg=3
highlight StatusLineNC cterm=bold ctermbg=4 ctermfg=0
highlight NonText term=bold ctermfg=4

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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
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
Plug 'flazz/vim-colorschemes', { 'do' : 'mkdir -p ~/.config/nvim/colors; cp ~/.config/nvim/plugged/vim-colorschemes/colors/* ~/.config/nvim/colors/' }
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'Maxbrunsfeld/vim-yankstack'
Plug 'edkolev/tmuxline.vim'
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
let g:airline_theme='aurora'
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
    ":Start! cscope -b -k -q -R -U; ctags --languages=C,C++ --langmap=c++:+.cu. --c-kinds=+cdefgmpstv -R .
    ":! cscope -b -k -q -R -U; ctags --languages=C,C++ --langmap=c++:+.cu. --c-kinds=+cdefgmpstv -R .
    let l:cscopeRegenerateCommand="find ." .
                                \ " -path '.git' -prune -o" .
                                \ " -name '*.[chxsS]'" .
                                \ " -print > cscope.files;" .
                                \ " cscope -b -k -q -R -U -i cscope.files;" .
                                \ " ctags --languages=C,C++ --langmap=c++:+.cu. --c-kinds=+cdefgmpstv -R --exclude=*.o;" .
                                \ " DISPLAY=:0.0 /usr/bin/notify-send 'Finished Cscope database generation' -t 100000"
    :execute "!" . l:cscopeRegenerateCommand
    :cscope reset
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
