" 
" Lonzo's vimrc
" refer to websit https://vimawesome.com/ for more vim plugins
"

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
"set tags=tags;
"set tags+=~/work/kernels/aw-kernel3.10/tags
"set tags+=~/.vim/tags/my-ctags
"set tags+=~/lonzo/android5.1/frameworks/native/tags
"map <F12> :!ctags --tag-relative=yes  -f ~/vimfiles/vim/tags/my-ctags -R *<CR> 
"map <F12> :!ctags --tag-relative=yes -R *<CR> 
"set path=~/work/kernels/aw-kernel3.10/include/
"set path+=./

""""""""""""""""""""""""""""""""""""""""""""
" => Cscope
""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
"set csprg=/usr/local/bin/cscope

" -> cscope settings <-
" csto=0: search tag file first
" csto=1: search cscope database first
set csto=0
set cst
" cspc: how may components of file path to display
set cspc=4
set nocsverb
"set cscopequickfix=s-,c-,d-,i-,t-,e-

" -> database -<
"cs add ~/work/kernels/aw-kernel3.10/cscope.out ~/work/kernels/aw-krnel3.10/
" add any database in current directory
if filereadable("cscope.out")
	cs add cscope.out
	set cscopeverbose
	" else add database pointed to by environment
elseif $CSCOPE_DB != ""
	cs add $CSCOPE_DB
	 set cscopeverbose
else
	" auto search database
	let cscope_file=findfile("cscope.out", ".;")
	let cscope_pre=matchstr(cscope_file, ".*/")
	if !empty(cscope_file) && filereadable(cscope_file)
		exe "cs add" cscope_file cscope_pre
	endif
	 set cscopeverbose
endif

" -> key map for cscope -<
nmap <leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <leader>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <leader>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <leader>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <leader>a :cs find a <C-R>=expand("<cword>")<CR><CR>
nmap <C-n> :cnext<CR>
nmap <C-p> :cprev<CR>
" [create database]
" 下表中列出了cscope的常用选项：
" -R: 在生成索引文件时，搜索子目录树中的代码
" -b: 只生成索引文件，不进入cscope的界面
" -q: 生成cscope.in.out和cscope.po.out文件，加快cscope的索引速度
" -k: 在生成索引文件时，不搜索/usr/include目录
" -i: 如果保存文件列表的文件名不是cscope.files时，需要加此选项告诉cscope到哪儿
"     去找源文件列表。可以使用”–“，表示由标准输入获得文件列表。
" -Idir: 在-I选项指出的目录中查找头文件
" -u: 扫描所有文件，重新生成交叉索引文件
" -C: 在搜索时忽略大小写
" -Ppath: 在以相对路径表示的文件前加上的path，这样，你不用切换到你数据库文件所
"    在的目录也可以使用它了。
"   sample: csope -Rbqk
"
" [cs find]
"		0 or s: Find this C symbol
"		1 or g: Find this definition
"		2 or d: Find functions called by this function
"		3 or c: Find functions calling this function
"		4 or t: Find this text string
"		6 or e: Find this egrep pattern
"		7 or f: Find this file
"		8 or i: Find files #including this file
endif
" Cscope End

""""""""""""""""""""""""""""""""""""""""""""
" => TagList
""""""""""""""""""""""""""""""""""""""""""""
Plugin 'taglist.vim'
let Tlist_Auto_Open=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1
let Tlist_Auto_Update=1
let Tlist_Show_One_File=1
let Tlist_Use_SingleClick=0
map <F11> :TlistToggle<cr>

""""""""""""""""""""""""""""""""""""""""""""
" => NERDtree
""""""""""""""""""""""""""""""""""""""""""""
Plugin 'scrooloose/nerdtree'
map <F4> :NERDTreeToggle<cr>
let NERDTreeWinPose='left'
let NERDTreeHighlightCursorline=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd vimenter *.c,*.h,*.cpp,*.java NERDTree | wincmd w

Plugin 'jistr/vim-nerdtree-tabs'

" tagbar
Plugin 'majutsushi/tagbar'

" Sytax
Plugin 'justinmk/vim-syntax-extra'

""""""""""""""""""""""""""""""""""""""""""""
" => grep
""""""""""""""""""""""""""""""""""""""""""""
Plugin 'grep.vim' 
nnoremap <silent> <F3> :Rgrep<CR>

""""""""""""""""""""""""""""""""""""""""""""
" => Opengrok plugin
""""""""""""""""""""""""""""""""""""""""""""
"if filereadable(".vim.custom")
"	so .vim.custom
"endif
"Plugin 'jdevera/vim-opengrok-search'

""""""""""""""""""""""""""""""""""""""""""""
" => Mark
""""""""""""""""""""""""""""""""""""""""""""
" After install these two plugin, needs to manually do git checkout the
" stable branch in directory vim/bundle/vim-mark and vim-ingo-library
Plugin 'inkarkat/vim-ingo-library'
Plugin 'inkarkat/vim-mark'
" <Leader>m  Mark and unmark works under cursor, If already on a mark: Clear
" the mark
" <Leader>n Clear the mark under the cursor.If not on a mark: Disable all marks
" <Leader>/ <Leader>? Jump next/previous
" :Mark      Clear all marks
" :MarkClear Clear all marks.
" For more helps refers to README of https://github.com/inkarkat/vim-mark

" Vundle END
call vundle#end()
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
filetype plugin indent on

set backspace=indent,eol,start

set showmatch
set ruler
set number
" set cursorline
" set cursorcolumn
set hlsearch
set incsearch
set virtualedit=onemore

set tabstop=8
set shiftwidth=8
set softtabstop=8

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

" Set how many lines of history VIM has to remember
set history=100

"""""""""""""""""""""""""""
" color and syntax
"""""""""""""""""""""""""""
colorscheme desert

syntax enable
" jump to the last position when open a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" When .vimrc is edit, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

" set terminal Color
"set term=xterm-256color
set t_Co=256

" Highlight item
hi Search term=standout cterm=bold ctermfg=7 ctermbg=2

nmap <leader>w :w!<cr>
nmap <leader>q :qa<cr>

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

