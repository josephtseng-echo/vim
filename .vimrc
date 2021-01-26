" File              : .vimrc
" Author            : josephzeng <josephzeng36@gmail.com>
" Date              : 03.04.2020
" Last Modified Date: 03.04.2020
" Last Modified By  : josephzeng <josephzeng36@gmail.com>

"设置<leader>,一般和<slient> 不在命令行中回显时使用，例 map <leader>ww :w
let mapleader=","
let g:mapleader=","
let maplocalleader="."
let g:maplocalleader="."

" 把空格键映射成:
nmap <space> :
set backspace=2


"判断操作系统
if has("win16") || has("win32") || has("win64") || has("win95")
    let g:isWin = 1
else
    let g:isWin = 0
endif

"如果是win系统
if (g:isWin)
    set fileformats=dos,unix,mac
    let $VIMFILES = $VIM.'/vimfiles'
    let $VIMRC = $VIM.'/_vimrc'
    let $VIMHOME = $VIM.'/.vim'
else
    set fileformats=dos,unix,mac
    let $VIMFILES = $HOME.'/.vim'
    let $VIMRC = $VIM.'/.vimrc'
    let $VIMHOME = $VIM.'/.vim'
endif

"判断是终端还是gvim
if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif

let $UNDOCACHE = $VIMFILES."/.cache/undodir"
let $BACKUPCACHE = $VIMFILES."/.cache/backup"
let $SWPCACHE = $VIMFILES."/.cache/swp"
let $VIEWCACHE = $VIMFILES."/.cache/view"
let $MRU = $VIMFILES."/.cache/mru"
let $TAGS = $VIMFILES."/.cache/tags"
let $CACHE = $VIMFILES."/.cache/cache"


call plug#begin('~/.vim/plugged')

source $VIMFILES/config/shortcuts.vim
source $VIMFILES/config/plugins.vim
source $VIMFILES/config/func.vim
source $VIMFILES/config/base.vim

call plug#end()
