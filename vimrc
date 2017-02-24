let mapleader=","

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
set laststatus=2

""""""""""""""""""""""""""""""""""""""""""""
" => ctags
"""""""""""""""""""""""""""""""""""""""""""
set tags=tags;
set tags+=~/src/kernels/msm/tags
set tags+=~/.vim/tags/my-ctags
"set tags+=~/lonzo/android5.1/frameworks/native/tags
map <F12> :!ctags --tag-relative=yes  -f ~/vimfiles/vim/tags/my-ctags -R *<CR> 
set path=~/src/kernels/msm/include/
set path+=./

""""""""""""""""""""""""""""""""""""""""""""
" => Cscope
""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
"set csprg=/usr/local/bin/cscope
set csto=0
set cst
set nocsverb
cs add ~/src/kernels/msm/cscope.out ~/src/kernels/msm
" add any database in current directory
if filereadable("cscope.out")
	cs add cscope.out
	" else add database
	" pointed to by environment
elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
endif
"set cscopequickfix=s-,c-,d-,i-,t-,e-
"set cscopetag
endif

""""""""""""""""""""""""""""""""""""""""""""
" => TagList
""""""""""""""""""""""""""""""""""""""""""""
Plugin 'taglist.vim'
let Tlist_Auto_Open=0
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1
let Tlist_Auto_Update=1
let Tlist_Show_One_File=1
let Tlist_Use_SingleClick=1
map <F11> :TlistToggle<cr>

""""""""""""""""""""""""""""""""""""""""""""
" => NERDtree
""""""""""""""""""""""""""""""""""""""""""""
Plugin 'scrooloose/nerdtree'
map <F4> :NERDTreeToggle<cr>
let NERDTreeWinPose='left'
let NERDTreeHighlightCursorline=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd vimenter *.c,*.h,*.cpp NERDTree | wincmd w

Plugin 'jistr/vim-nerdtree-tabs'

" tagbar
Plugin 'majutsushi/tagbar'

call vundle#end()
filetype plugin indent on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

"""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""
set backspace=indent,eol,start

set showmatch
set ruler
set number
" set cursorline
" set cursorcolumn
set hlsearch
set incsearch
set virtualedit=onemore

set tabstop=4
set shiftwidth=4
set softtabstop=4

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,cp936
set termencoding=utf-8
set fileformat=unix
set scrolloff=7
set autoindent
set cindent
set smartindent

set mouse=a

"""""""""""""""""""""""""""
" color and syntax
"""""""""""""""""""""""""""
colorscheme desert

syntax enable
" jump to the last position when open a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" When .vimrc is edit, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

" Set how many lines of history VIM has to remember
set history=100


nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>

""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile

nnoremap <F2> :set invpaste paste?<cr>

set colorcolumn=80
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

runtime macros/matchit.vim

