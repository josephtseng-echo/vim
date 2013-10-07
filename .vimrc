"
" josephzeng | josephzeng36@gmail.com
" version 0.1
" 2013-09-03
"

"设置<leader>,一般和<slient> 不在命令行中回显时使用，例 map <leader>ww :w
let mapleader=","
let g:mapleader=","
" 把空格键映射成:
nmap <space> :


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
else
    let $VIMFILES = $HOME.'/.vim'
    set fileformats=unix,dos,mac
endif

"判断是终端还是gvim
if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif

" pathogen plugn
execute pathogen#infect()

" 加载配置文件
source $VIMFILES/config/base.vim
source $VIMFILES/config/shortcuts.vim
source $VIMFILES/config/plug.vim
source $VIMFILES/config/func.vim
