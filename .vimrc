"
" WELCOME TO MY:
"
"██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"██║   ██║██║██╔████╔██║██████╔╝██║
"╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
 "╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
  "╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SECTIONS:                                                                  "
"   00. Preamble................. Plugins, keybinds, etc                     "
"   01. General ................. General Vim behavior                       "
"   02. Events .................. General autocmd events                     "
"   03. Theme/Colors ............ Colors, fonts, etc.                        "
"   04. Vim UI .................. User interface behavior                    "
"   05. Text Formatting/Layout .. Text, tab, indentation related             "
"   06. Extras................... Place any extra config's here              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" <========================== REQUIRED ======================================>
set nocompatible 
let mapleader = ' '
filetype plugin indent on 
" <========================== PLUGINS =======================================>
call plug#begin('~/.vim/plugged')

" MAKE VIM GREAT AGAIN "
    " File tree
    Plug 'scrooloose/nerdtree'
    " Commenter
    Plug 'scrooloose/nerdcommenter'
    " Airline
    Plug 'vim-airline/vim-airline'
    " Better search
    Plug 'haya14busa/incsearch.vim'
    " Easymotion
    Plug 'easymotion/vim-easymotion'
    " Emmet
    Plug 'mattn/emmet-vim'
    " Finder
    Plug 'ctrlpvim/ctrlp.vim'
    " A fancy start screen, shows MRU etc.
    Plug 'mhinz/vim-startify'
    " Git wrapper
    Plug 'tpope/vim-fugitive'
    " Aligner
    Plug 'godlygeek/tabular'

" WEB DEV "
    " HTML5
    Plug 'othree/html5.vim'
    " CSS3
    Plug 'hail2u/vim-css3-syntax'
    " LESS
    Plug 'groenewege/vim-less'
    " Stylus
    Plug 'wavded/vim-stylus'
    "JS
    Plug 'pangloss/vim-javascript'
    " Coffee script
    Plug 'kchmck/vim-coffee-script'
    " Vue
    Plug 'posva/vim-vue'
    " Hightlight tag pair
    Plug 'gregsexton/matchtag'

" COLORS "
    " Dracula
    Plug 'dracula/vim'
    " Colors hightlight
    Plug 'lilydjwg/colorizer'

call plug#end()
" <========================== KEYBINDINGS ===================================>

" Treat wrapped lines as normal lines
nmap j gj
nmap k gk
" Exit insert mod with jj 
inoremap jj <ESC>
" Easy leaders
nmap <Leader>r :source $MYVIMRC<CR>                                             
nmap <Leader>w :w<CR>

" <========================== PLUGIN SETTINGS ===============================>

" AIRLINE "
let g:airline_powerline_fonts = 1
let g:airline_section_y = ''
let g:airline_section_x = ''
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#fnamemod = ':t'

" NERDTREE "
nmap <silent> <F2> :NERDTreeToggle <CR>
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeQuitOnOpen = 1

" SEARCH "
let g:incsearch#auto_nohlsearch = 1

" EASYMOTION "
nmap ; <Plug>(easymotion-overwin-f)

" CTRLP "
nmap <leader>p :CtrlP<cr>
let g:ctrlp_show_hidden = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg|pdf)$',
\}

" fugitive git bindings
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gt :Gcommit -v -q %:p<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Dispatch! git push<CR>
nnoremap <leader>gpl :Dispatch! git pull<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 01. General                                                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" DEFAULTS "
set history=1000         " set vim history
set encoding=utf8        " set standard encoding and language
set ffs=unix,dos         " use Unix as standard file type
set hidden               " best practice
set confirm              " confirm unsaved changes
set autoread             " reload files if changed externally
set noshowmode           " unnecessary cause airline

" BACKUP MANAGEMENT "
set noswapfile 
set nobackup
set nowritebackup

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 02. Events                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Keep undo history all the time.
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

" Return to previous position always.
augroup LastPosition
    autocmd! BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \     exe "normal! g`\"" |
    \ endif
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 03. Theme/Colors                                                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable             " enable syntax highlighting.
set t_Co=256              " enable 256-color mode.
set colorcolumn=81        " highlight column 81.
set cul                   " highlight current line.
colorscheme dracula       " set colorscheme.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 04. Vim UI                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" GENERAL UI " 
set number                " show line numbers.
set numberwidth=3         " make the number gutter 3 characters wide
set showmatch             " Show matching brackets.
set showcmd               " Show commands.
set relativenumber        " better side number ui.
set splitbelow            " splits go below w/focus
set splitright            " vsplits go right w/focus
set mouse=n               " mouse allowed (!insert mode)

" BETTER PERFORMANCE "
set noerrorbells          " Shut up!
set visualbell t_vb=      " Don't flicker!
set belloff=all
set lazyredraw
set ttyfast
set magic

" AUTOCOMPLETION "
set wildmenu
set wildmode=full
set wildcharm=<Tab>

" SEARCHING "
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set smartcase             " When searching be smart.
set wrapscan              " Smart wrap scans.

" SCROLLING "
set scrolloff=5           "Start scrolling when we're 5 lines away from margins
set sidescrolloff=5      
set sidescroll=1          
set scroll=5

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 05. Text Formatting/Layout                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" INDENTS "
set autoindent            " auto-indent
set smartindent           " automatically insert one extra level of indentation
set shiftround            " always indent/outdent to the nearest tabstop

" TABS "
set tabstop=2             " tab spacing
set softtabstop=2         " unify
set shiftwidth=2          " indent/outdent by 2 columns
set expandtab             " use spaces instead of tabs
set smarttab              " use tabs at the start of a line, spaces elsewhere

" WRAPS "
set wrap
set textwidth=80

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 06. EXTRAS                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" GUI SETTINGS "
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif
