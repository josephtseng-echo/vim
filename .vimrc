" 设置leader为,
let mapleader=","
let g:mapleader=","

" functions
function! MySys()
    if has("win16") || has("win32") || has("win64") || has("win95")
        return "windows"
    elseif has("unix")
        return "linux"
    else
        return "linux"
    endif
endfunction

" 关闭 vi 兼容模式
set nocompatible

" 自动语法高亮
syntax on

" 开启插件
filetype plugin indent on

" 显示行号
set number

" 不突出显示当前行
"set nocursorline

" 设定 << 和 >> 命令移动时的宽度为 4
set shiftwidth=4

" 使得按退格键时可以一次删掉 4 个空格
set softtabstop=4

" 设定 tab 长度为 4
set tabstop=4

" 自动切换当前目录为当前文件所在的目录
set autochdir

" 设置备份时的行为为覆盖
"set backupcopy=yes

" 搜索时忽略大小写，但在有一个或以上大写字母时仍大小写敏感
set ignorecase smartcase

" 禁止在搜索到文件两端时重新搜索
set nowrapscan

" 输入搜索内容时就显示搜索结果
set incsearch

" 搜索时高亮显示被找到的文本
set hlsearch

" 关闭错误信息响铃
set noerrorbells

" 关闭使用可视响铃代替呼叫
set novisualbell

" 置空错误铃声的终端代码
set t_vb=

" 插入括号时，短暂地跳转到匹配的对应括号
" set showmatch

" 短暂跳转到匹配括号的时间
" set matchtime=2

 " 不自动换行
"set nowrap

" 主动切换此刻目录为此刻文件所在的目录
"set automforicchdir

"分割窗口时保持相等的宽/高
set equalalways

" 显示括号配对情况
set magic

" 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set hidden

" 开启新行时使用智能自动缩进
set smartindent

" 设定命令行的行数为 1
set cmdheight=2

" 显示状态栏 (默认值为 1, 无法显示状态栏)
set laststatus=2

" 开始折叠
"set foldenable

" 设置语法折叠
set foldmethod=syntax

" 设置折叠区域的宽度
set foldcolumn=0

" 设置折叠层数为
setlocal foldlevel=1

" 设置为自动关闭折叠
" set foldclose=all

" 设定配色方案
"colorscheme norwaytoday       
colorscheme oceandeep
"set guifont=Monaco:h16

"设置字体
if has("gui")
    if has("win32")
	set guifont=Monaco:h12:cANSI
    else
        set guifont=Courier\ 11\ Pitch\ 12
    endif
    "set columns=128 lines=36
endif

set matchpairs=(:),{:},[:],<:>

"保存关闭文件之前保留一个备份
set writebackup 
autocmd BufWritePre * let &backupext = strftime(".%F-%H-%M")

" 上下可视行数
set backupdir=~/vimbackupfile/
set scrolloff=6

" 解决自动换行格式下, 如高度在折行之后超过窗口高度结果这一行看不到的问题
set display=lastline

" Alt-W切换自动换行
noremap <a-w> :exe &wrap==1 ? 'set nowrap' : 'set wrap'<cr>

"让swap文件保存在~/.tmp目录下
set directory=~/.tmp

"不生成swap文件
set noswapfile

" 在插入模式中使用Ctrl+v粘贴全局剪贴板内容
inoremap <C-v> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>

" 在Visual模式中使用Ctrl+c复制内容到全局剪贴板
vnoremap <C-c> "+y

" 在Visual模式中使用Ctrl+x剪切内容到全局剪贴板
vnoremap <C-x> "+x

set nowrap "禁止自动换行
set wildmenu "在输入命令时列出匹配项目，也就是截图底部的效果

"编辑vim配置文件
if has('unix')
    "set fileformats=unix,dos,mac
    set fileformats=dos,unix,mac
    nmap <Leader>e :tabnew $HOME/.vimrc<CR>
    let $VIMFILES = $HOME.'/.vim'
else
    set fileformats=dos,unix,mac
    nmap <Leader>e :tabnew $VIM/_vimrc<CR>
    let $VIMFILES = $VIM.'/vimfiles'
endif
if MySys() == "windows"
	" 设定windows系统中ctags程序的位置
    let Tlist_Ctags_Cmd = '"'.$VIMFILES.'/tools/ctags.exe"'
elseif MySys() == "linux" 
	" 设定windows系统中ctags程序的位置
    let Tlist_Ctags_Cmd = '/bin/ctags'
endif
if has("gui_running")
    set guioptions-=m " 隐藏菜单栏
    set guioptions-=T " 隐藏工具栏
    set guioptions-=L " 隐藏左侧滚动条
    set guioptions-=r " 隐藏右侧滚动条
    set guioptions-=b " 隐藏底部滚动条
    set showtabline=0 " 隐藏Tab栏
endif


" multi-encoding setting
if has("multi_byte")
  "set bomb
  set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,sjis,euc-kr,ucs-2le,latin1
  " CJK environment detection and corresponding setting
  if v:lang =~ "^zh_CN"
    " Use cp936 to support GBK, euc-cn == gb2312
    set encoding=cp936
    set termencoding=cp936
    set fileencoding=cp936
  elseif v:lang =~ "^zh_TW"
    " cp950, big5 or euc-tw
    " Are they equal to each other?
    set encoding=big5
    set termencoding=big5
    set fileencoding=big5
  elseif v:lang =~ "^ko"
    " Copied from someone's dotfile, untested
    set encoding=euc-kr
    set termencoding=euc-kr
    set fileencoding=euc-kr
  elseif v:lang =~ "^ja_JP"
    " Copied from someone's dotfile, untested
    set encoding=euc-jp
    set termencoding=euc-jp
    set fileencoding=euc-jp
  endif
  " Detect UTF-8 locale, and replace CJK setting if needed
  if v:lang =~ "utf8$" || v:lang =~ "UTF-8$" || v:lang =~ "utf-8$"
    set encoding=utf-8
    set termencoding=utf-8
    set fileencoding=utf-8
  endif
else
  echoerr "Sorry, this version of (g)vim was not compiled with multi_byte"
endif


" In many terminal emulators the mouse works just fine, thus enable it.

set showcmd " display incomplete commands
set showmode " display the current mode
set autoindent

"""
"Omni menu colors
hi Pmenu guibg=#444444
hi PmenuSel ctermfg=7 ctermbg=4 guibg=#555555 guifg=#ffffff
" Matched brackets
hi MatchParen ctermfg=7 ctermbg=4


set ttyfast " smoother changes
"set title " show title in the console title bar
set bs=2 " backspace can delete previos characters
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set expandtab
set showmatch
set guioptions-=T
set ruler
set nostartofline " don't jump to first character when paging
set whichwrap=b,s,h,l,<,>,[,] " move freely between files
set undolevels=200
set nohls
set nu

"自定义快捷键
map <F9> :NERDTreeToggle<CR>
map <F8> :TlistToggle<CR>
map <F2> :BufExplorer<CR>
map <F3> :marks


nmap <silent> <leader>w :w!<CR>
nmap <silent> <leader>x :x!<CR>
nmap <silent> <leader>q :q!<CR>
nmap <silent> <leader>qa :qall!<CR>

"版本信息
let g:vimrc_author='josephzeng'
let g:vimrc_email='josephzeng36@gmail.com'
let g:vimrc_homepage=''
"nmap <F7> :AuthorInfoDetect<cr>


"设置代码折叠方式为 手工  indent
"set foldmethod=indent
"设置代码块折叠后显示的行数
set foldexpr=1

" 设定doc文档目录
let helptags=$VIMFILES.'/doc'
set helplang=cn
"set nobomb

" {{{全文搜索选中的文字
:vmap <silent> <leader>f y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
:vmap <silent> <leader>F y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
" }}}

" 删除所有行未尾空格
nmap <F12> :%s/[ \t\r]\+$//g<CR>

" Buffers操作快捷方式!
nmap <S-L> :bnext<CR>
nmap <S-H> :bprevious<CR>

" Tab操作快捷方式!
nmap <S-J> :tabnext<CR>
nmap <S-K> :tabprev<CR>

" 插入模式下上下左右移动光标
inoremap <c-h> <left>
inoremap <c-l> <right>
inoremap <c-j> <c-o>gj
inoremap <c-k> <c-o>gk

"窗口分割时,进行切换的按键热键需要连接两次,比如从下方窗口移动
"光标到上方窗口,需要<c-w><c-w>k,非常麻烦,现在重映射为<c-k>,切换的
"时候会变得非常方便.
"nmap <C-h> <C-w>h
"nmap <C-j> <C-w>j
"nmap <C-k> <C-w>k
"nmap <C-l> <C-w>l


set diffexpr=MyDiff()
function! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

if has("vms")
   set nobackup
else
   set backup
endif

"一些不错的映射转换语法（如果在一个文件中混合了不同语言时有用）
nnoremap <leader>1 :set filetype=xhtml<cr>
nnoremap <leader>2 :set filetype=css<cr>
nnoremap <leader>3 :set filetype=javascript<cr>
nnoremap <leader>4 :set filetype=php<cr>

"字典补全
"autocmd filetype javascript set dictionary=$VIMFILES/dict/javascript.dict
autocmd! FileType * exec "set dict+=$VIMFILES/dict/".&ft.".dict"

"dbext
let g:dbext_default_display_cmd_line = 1


" Python 文件的一般设置，比如不要 tab 等
"autocmd FileType python set tabstop=4 shiftwidth=4 expandtab

"php python配置
"au FileType php call Autophpfunclist()
"au FileType python call Autopythonfunclist()
"function Autopythonfunclist()
"    filetype plugin on
"    let g:pydiction_location = '~/.vim/dict/complete-dict'
"    let g:pydiction_menu_height = 50
"    if has("autocmd")
"	autocmd FileType python set complete+=k~/.vim/dict/complete-dict
"    endif
"endfunction
"
"function Autophpfunclist()
"    filetype plugin on
"    set dictionary+=~/.vim/dict/php_funclist.txt
"endfunction

function CheckPhpSyntax()
    let codeanalyzercmd = 'F:\cygwin\home\Administrator\.vim\tools\ZendCodeAnalyzer --disable var-arg-unused'
    let exefile = expand("%:t")
    let &makeprg = codeanalyzercmd
    set errorformat=%f(line\ %l):\ %m
    silent make %
    if len(getqflist()) > 2
        call setqflist(remove(getqflist(), 2, -1))
        copen
    else
        cclose
        normal :
        echohl Waring | echo "check over, no error" | echohl None
    endif
endfunction

function CheckPythonSyntax()
    let mp = &makeprg
    let ef = &errorformat
    let exeFile = expand("%:t")
    setlocal makeprg=python\ -u
    set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
    silent make %
    copen
    let &makeprg     = mp
    let &errorformat = ef
endfunction

"Run a PHP script
function! ExecutePHPScript()
       if &filetype != 'php'
           echohl WarningMsg | echo 'This is not a PHP file !' | echohl None
           return
       endif
       setlocal makeprg=php\ -f\ %
       setlocal errorformat=%m\ in\ %f\ on\ line\ %l
       echohl WarningMsg | echo 'Execution output:' | echohl None
       if &modified == 1
           silent write
       endif
       silent make
       clist
   endfunction

"au filetype php map <F5> :call ExecutePHPScript()<CR>
"au filetype py imap <C-F5> <ESC>:call ExecutePythonScript()<CR>

" Run a python script
function! ExecutePythonScript()
   if &filetype != 'python'
       echohl WarningMsg | echo 'This is not a Python file !' | echohl None
       return
   endif
   setlocal makeprg=python\ -u\ %
   set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
   echohl WarningMsg | echo 'Execution output:' | echohl None
   if &modified == 1
       silent write
   endif
   silent make
   clist
endfunction

function Add_tags()
    let dir =expand("%:p:h")
    let curtags = dir.g:vimrc_splitstr."tags"
    let curtags=substitute(curtags,'\\','\','g')
    if filereadable(curtags)
        exec "set tags+=".curtags
        echohl WarningMsg | echo "Succ to add tags![".curtags."]" | echohl None
    else
        echohl WarningMsg | echo "Fail to add tags! No tags in this file's path.[".curtags."]" | echohl None
    endif
endfunction
function Del_tags()
    let dir =expand("%:p:h")
    let curtags = dir.g:vimrc_splitstr."tags"
    let curtags=substitute(curtags,'\\','\','g')
    exec "set tags-=".curtags
    if filereadable(curtags)
        echohl WarningMsg | echo "Succ to del tags![".curtags."]" | echohl None
    else
        echohl WarningMsg | echo "Succ to del tags! But no tags in this file's path.[".curtags."]" | echohl None
    endif
endfunction

function Update_tags()
    let curdir=getcwd()
    while !filereadable("./tags")
        cd ..
        if getcwd() == "/"
            break
        endif
    endwhile
    if filewritable("./tags")
        !ctags -R --c++-types=+px --excmd=pattern --exclude=Makefile --exclude=.
    endif
    execute ":cd " . curdir
endfunction


"jquery
au BufRead,BufNewFile *.js set syntax=jquery
"打开javascript对dom、html和css的支持
let javascript_enable_domhtmlcss=1

" zen coding set
let g:user_zen_settings = {
  \  'php' : {
  \    'extends' : 'html',
  \    'filters' : 'c',
  \  },
  \  'php3' : {
  \    'extends' : 'html',
  \    'filters' : 'c',
  \  },
  \  'phtml' : {
  \    'extends' : 'html',
  \    'filters' : 'c',
  \  },
  \  'tpl' : {
  \    'extends' : 'html',
  \    'filters' : 'c',
  \  },
  \  'xml' : {
  \    'extends' : 'html',
  \  },
  \  'haml' : {
  \    'extends' : 'html',
  \  },
  \}
let g:user_zen_expandabbr_key = '<c-e>'

" a.vim
map <A-a> :A<cr>

""""""""""""""""""""""""""""""
" NERDTreeToggle插件的设置
""""""""""""""""""""""""""""""
"o        打开关闭文件或者目录
"t        在标签页中打开
"T        在后台标签页中打开
"!        执行此文件
"p        到上层目录
"P        到根目录
"K        到第一个节点
"J        到最后一个节点
"u        打开上层目录
"m        显示文件系统菜单（添加、删除、移动操作）
"?        帮助
"q        关闭
"r        刷新窗口
"ctrl + ww 在窗口之间切换，最有一个w可换成h, j, k, l
" {{{ plugin - NERD_tree.vim 文件管理器
" 让Tree把自己给装饰得多姿多彩漂亮点
let NERDChristmasTree=1
" 控制当光标移动超过一定距离时，是否自动将焦点调整到屏中心
let NERDTreeAutoCenter=1
" 指定书签文件
let NERDTreeBookmarksFile=$VIMFILES.'\NERDTree_bookmarks'
" 指定鼠标模式(1.双击打开 2.单目录双文件 3.单击打开)
let NERDTreeMouseMode=2
" 是否默认显示书签列表
let NERDTreeShowBookmarks=1
" 是否默认显示文件
let NERDTreeShowFiles=1
" 是否默认显示隐藏文件
let NERDTreeShowHidden=1
" 是否默认显示行号
let NERDTreeShowLineNumbers=0
" 窗口位置（'left' or 'right'）
let NERDTreeWinPos='left'
" 窗口宽度
let NERDTreeWinSize=31
nnoremap <Leader>tt :NERDTree<CR>
"}}}

" Tlist
let Tlist_Show_Menu = 1
" 这项必须设定，否则出错,配置taglist的ctags路径
let Tlist_Ctags_Cmd = 'ctags'
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Open = 0
let Tlist_File_Fold_Auto_Close=1
let Tlist_Auto_Update = 1
let Tlist_Close_On_Select = 0
let Tlist_Compact_Format = 0
let Tlist_Display_Prototype = 0
let Tlist_Display_Tag_Scope = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 0
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Max_Submenu_Items = 1
let Tlist_Max_Tag_Length = 30
let Tlist_Process_File_Always = 1
let Tlist_Show_Menu = 0
let Tlist_Show_One_File = 1
let Tlist_Sort_Type = "order"
let Tlist_Use_Horiz_Window = 0
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 30
"let tlist_php_settings = 'php;c:class;i:interfaces;d:constant;f:function'
set tags=tags;
if exists("&autochdir")
    set autochdir
endif

" NERD_tree config
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let NERDTreeShowBookmarks=1
nmap <silent> <leader>nt :NERDTree<cr>

"html php autocmd FileType html set nowrap
let g:use_zen_complete_tag = 1
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType java set omnifunc=javacomplete#Complet

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>k

"高亮当前行
"set cul
"set cursorline
"set cursorcolumn
"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
""highlight all search matches


"各种需要成对出现的引号括号等等,你只需要输入一个,另外一个会自动帮你补全
inoremap ( ()<ESC>i
inoremap ) <c-r>=Auto_Close_Pair(")")<CR>
inoremap { {}<ESC>i
inoremap } <c-r>=Auto_Close_Pair("}")<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=Auto_Close_Pair("]")<CR>
"inoremap < <><ESC>i
"inoremap > <c-r>=Auto_Close_Pair(">")<CR>
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
function Auto_Close_Pair(char)
    if getline(".")[col(".") - 1] == a:char
        return ""
    else
         return a:char
    endif
endf

" 显示Tab符
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<
set list

" {{{ plugin - renamer.vim 文件重命名
" :Renamer 将当前文件所在文件夹下的内容显示在一个新窗口
" :Ren 开始重命名
"}}}

" {{{ plugin - bufexplorer.vim Buffers切换
" \be 全屏方式查看全部打开的文件列表
" \bv 左右方式查看   \bs 上下方式查看
"}}}
let g:bufExplorerSortBy='mru'
let g:bufExplorerSplitRight=0
let g:bufExplorerSplitVertical=1
let g:bufExplorerSplitVertSize = 30
let g:bufExplorerUseCurrentWindow=1
"autocmd BufWinEnter \[Buf\ List\] setl nonumber

""""""""""""""""""""""""""""""
" winManager插件的设置
""""""""""""""""""""""""""""""
"let g:winManagerWindowLayout = "BufExplorer,FileExplorer|TagList"
"let g:winManagerWindowLayout = "FileExplorer|TagList,BufExplorer"
let g:winManagerWindowLayout = "TagList|FileExplorer,BufExplorer"
let g:winManagerWidth = 45
let g:defaultExplorer = 0
"nmap <silent> <leader>wm :WMToggle<cr>
nmap <silent> <F6> :WMToggle<cr>

" {{{ plugin - bookmarking.vim 设置标记（标签）
" <F3> 设置标记    <F4> 向下跳转标记   <S-F4> 向上跳转标记
"}}}

" {{{ plugin - matchit.vim 对%命令进行扩展使得能在嵌套标签和语句之间跳转
" % 正向匹配      g% 反向匹配
" [% 定位块首     ]% 定位块尾
"}}}

" {{{ plugin - mark.vim 给各种tags标记不同的颜色，便于观看调式的插件。
" 这样，当我输入“,hl”时，就会把光标下的单词高亮，在此单词上按“,hh”会清除该单词的高亮。如果在高亮单词外输入“,hh”，会清除所有的高亮。
" 你也可以使用virsual模式选中一段文本，然后按“,hl”，会高亮你所选中的文本；或者你可以用“,hr”来输入一个正则表达式，这会高亮所有符合这个正则表达式的文本。
nmap <silent> <leader>hl <plug>MarkSet
vmap <silent> <leader>hl <plug>MarkSet
nmap <silent> <leader>hh <plug>MarkClear
vmap <silent> <leader>hh <plug>MarkClear
nmap <silent> <leader>hr <plug>MarkRegex
vmap <silent> <leader>hr <plug>MarkRegex
" 你可以在高亮文本上使用“,#”或“,*”来上下搜索高亮文本。在使用了“,#”或“,*”后，就可以直接输入“#”或“*”来继续查找该高亮文本，直到你又用“#”或“*”查找了其它文本。
" <silent>* 当前MarkWord的下一个     <silent># 当前MarkWord的上一个
" <silent>/ 所有MarkWords的下一个    <silent>? 所有MarkWords的上一个
"- default highlightings ------------------------------------------------------
highlight def MarkWord1  ctermbg=Cyan     ctermfg=Black  guibg=#8CCBEA    guifg=Black
highlight def MarkWord2  ctermbg=Green    ctermfg=Black  guibg=#A4E57E    guifg=Black
highlight def MarkWord3  ctermbg=Yellow   ctermfg=Black  guibg=#FFDB72    guifg=Black
highlight def MarkWord4  ctermbg=Red      ctermfg=Black  guibg=#FF7272    guifg=Black
highlight def MarkWord5  ctermbg=Magenta  ctermfg=Black  guibg=#FFB3FF    guifg=Black
highlight def MarkWord6  ctermbg=Blue     ctermfg=Black  guibg=#9999FF    guifg=Black
"}}}

" {{{设置FuzzyFinder
map <leader>fF :FufFile<CR>
map <leader>ff :FufTaggedFile<CR>
map <leader>fg :FufTag<CR>
map <leader>fd :FufDir<CR>
"map <leader>fm :FufMruFile<CR>
map <leader>fb :FufBuffer<CR>
"}}}
map <C-S-R> :FufFile<CR>

" {{{GSession.vim 
"<leader>ss   建立匿名 global session file
"<leader>sS   建立匿名 local session file
"<leader>se   刪除目前的 session file
"<leader>sE   刪除所有的 session file
"<leader>sn   建立命名的 global session file
"<leader>sl   建立命名的 local session file
"}}}

au BufRead,BufNewFile *.twig set syntax=jinja

" {{{ plugin - auto_mkdir.vim 自动创建目录`
" }}}

" {{{ plugin - mru.vim 记录最近打开的文件
let MRU_File = $VIMFILES.'/_vim_mru_files'
let MRU_Max_Entries = 1000
let MRU_Add_Menu = 0
nmap <leader>f :MRU<CR>
" }}}

" {{{ plugin - Calendar.vim 日历插件
nmap <Leader>cale :Calendar<CR>
let g:calendar_mruler = '一月,二月,三月,四月,五月,六月,七月,八月,九月,十月,十一月,十二月'
let g:calendar_wruler = '日 一 二 三 四 五 六'
let g:calendar_navi_label = '上月,本月,下月'
" }}}

" {{{ plugin – winmove.vim 窗口移动
let g:wm_move_left  = "<a-h>"
let g:wm_move_right = "<a-l>"
let g:wm_move_up    = "<a-k>"
let g:wm_move_down  = "<a-j>"
"}}}

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表
let OmniCpp_MayCompleteDot = 1   " 输入 .  后自动补全
let OmniCpp_MayCompleteArrow = 1 " 输入 -> 后自动补全
let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" 自动关闭补全窗口
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest


" {{{ plugin - NERD_commenter.vim 注释代码用的，
" <leader>ca 在可选的注释方式之间切换，比如C/C++ 的块注释/* */和行注释//
" <leader>cc 注释当前行
" <leader>cs 以”性感”的方式注释
" <leader>cA 在当前行尾添加注释符，并进入Insert模式
" <leader>cu 取消注释
" <leader>cm 添加块注释
" }}}


" {{{ plugin - jsbeautify.vim 优化js代码，并不是简单的缩进，而是整个优化
" 开始优化整个文件
nmap <silent> <leader>js :call g:Jsbeautify()<cr>
" }}}


" {{{ plugin -yankring.vim 寄存器可视操作
map <leader>y :YRShow<CR>
"map <leader>yc :YRClear<CR>
" }}}

"-----------------------------------------------------------------
" plugin - NERD_commenter.vim   注释代码用的，
" [count],cc 光标以下count行逐行添加注释(7,cc)
" [count],cu 光标以下count行逐行取消注释(7,cu)
" [count],cm 光标以下count行尝试添加块注释(7,cm)
" ,cA 在行尾插入 /* */,并且进入插入模式。 这个命令方便写注释。
" 注：count参数可选，无则默认为选中行或当前行
"-----------------------------------------------------------------
let NERDSpaceDelims=1       " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=1   " 多行注释时样子更好看

"-----------------------------------------------------------------
" plugin - DoxygenToolkit.vim  由注释生成文档，并且能够快速生成函数标准注释
"-----------------------------------------------------------------
let g:DoxygenToolkit_authorName="Asins - asinsimple AT gmail DOT com"
let g:DoxygenToolkit_briefTag_funcName="yes"
map <leader>da :DoxAuthor<CR>
map <leader>df :Dox<CR>
map <leader>db :DoxBlock<CR>
map <leader>dc a /*  */<LEFT><LEFT><LEFT>

"{{{自动除去多余的空白行
" From: Vigil
function RemoveTrailingWhitespace()
	if &ft != "diff"
		let b:curcol = col(".")
		let b:curline = line(".")
		silent! %s/\s\+$//
		silent! %s/\(\s*\n\)\+\%$//
		call cursor(b:curline, b:curcol)
	endif
endfunction
autocmd BufWritePre * call RemoveTrailingWhitespace()

"}}}
"{{{高亮列
autocmd CursorMoved * call s:HiC()
function! s:HiC()
    let l:c = getline('.')[col('.') - 1]
    if l:c == '{' || l:c == '}'
        set cuc
    else
        set nocuc
    endif
endf

"}}}
"{{{气泡提示
function! FoldSpellBalloon()
	let foldStart = foldclosed(v:beval_lnum )
	let foldEnd   = foldclosedend(v:beval_lnum)
	let lines = []
	" Detect if we are in a fold
	if foldStart < 0
		" Detect if we are on a misspelled word
		let lines = spellsuggest( spellbadword(v:beval_text)[ 0 ], 5, 0 )
	else
		" we are in a fold
		let numLines = foldEnd - foldStart + 1
		" if we have too many lines in fold, show only the first 14
		" and the last 14 lines
		if ( numLines > 31 )
			let lines = getline( foldStart, foldStart + 14 )
			let lines += [ '-- Snipped ' . ( numLines - 30 ) . ' lines --' ]
			let lines += getline( foldEnd - 14, foldEnd )
		else
			"less than 30 lines, lets show all of them
			let lines = getline( foldStart, foldEnd )
		endif
	endif
	" return result
	return join( lines, has( "balloon_multiline" ) ? "\n" : " " )
endfunction


"a.vim实现源文件与头文件切换
"{{{
let alternateSearchPath = 'sfr:.,sfr:./include,sfr:../include'  "设置include(.h)文件存在何处.
let alternateNoDefaultAlternate = 1  "当没有找到相应的.h文件时,不自动创建
":A 切换当前文件的头文件,在当前窗口打开(或者反过来)  "先打开.h .c 文件存于buff中
":AS 功能同:A,但是切换到水平分割窗口的打开
":AV 功能同:A,但是切换到竖直分割的窗口打开
":AT 功能同:A,但是切换到标签页打开
 "}}}
"a.vim实现源文件与头文件切换

"echofunc.vim 在命令行中显示函数信息 ( 不错 )
""{{{
"直接下载解压即可( tags 插件已包含相似功能, 没必要装此插件 )
"这个插件的功能需要 tags 文件的支持, 并且在创建 tags 文件的时候要加选项"--fields=+lS" : ctags -R --fields=+lS
let g:EchoFuncKeyNext='<Esc>+'
let g:EchoFuncKeyPrev='<Esc>-'
let g:EchoFuncLangsUsed = ["c","java","cpp","php"]
""}}}
"ctags -R --fields=+ls

""basically you press * or # to search for the current selection !! Really useful
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"
    let l:pattern = escape(@", '///.*$^~[]')
    let l:pattern = substitute(l:pattern, "/n$", "", "")
    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    else
        execute "normal /" . l:pattern . "^M"
    endif
    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
"map <space> :nohl<CR>       " :press <space> to clear hightlight  search highlight
""}}}
"search 搜索 (visual mode)

"单行或多行注释 "也可以使用cvim.zip插件来完成注释(*.c文件) /cc ---> //   /c* ---> /* */  /co ---> 取消
"{{{
"    nmap <C-C> <Esc>:Setcomment<CR>
"    "normal 模式下ctrl + C 快捷键
"    imap <C-C> <Esc>:Setcomment<CR>
"    "insert 模式下ctrl + C 快捷键
"    vmap <C-C> <Esc>:SetcommentV<CR>
"    "visual 模式下ctrl + C 快捷键
"    command! -nargs=0 Setcomment call s:SET_COMMENT()
"    command! -nargs=0 SetcommentV call s:SET_COMMENTV()
"
"    "非视图模式下所调用的函数
"    function! s:SET_COMMENT()
"        let lindex=line(".")
"        let str=getline(lindex)
"        "查看当前是否为注释行
"        let CommentMsg=s:IsComment(str)
"        call s:SET_COMMENTV_LINE(lindex,CommentMsg[1],CommentMsg[0])
"    endfunction
"
"    "视图模式下所调用的函数
"    function! s:SET_COMMENTV()
"        let lbeginindex=line("'<") "得到视图中的第一行的行数
"        let lendindex=line("'>") "得到视图中的最后一行的行数
"        let str=getline(lbeginindex)
"        "查看当前是否为注释行
"        let CommentMsg=s:IsComment(str)
"        "为各行设置
"        let i=lbeginindex
"        while i<=lendindex
"            call s:SET_COMMENTV_LINE(i,CommentMsg[1],CommentMsg[0])
"            let i=i+1
"        endwhile
"    endfunction
"
"    "设置注释
"    "index:在第几行
"    "pos:在第几列
"    "comment_flag: 0:添加注释符 1:删除注释符
"    function! s:SET_COMMENTV_LINE( index,pos, comment_flag )
"        let poscur = [0, 0,0, 0]
"        let poscur[1]=a:index
"        let poscur[2]=a:pos+1
"        call setpos(".",poscur) "设置光标的位置
"
"        if a:comment_flag==0
"            "插入//
"            exec "normal! i//"
"        else
"            "删除//
"            exec "normal! xx"
"        endif
"    endfunction
"
"    "查看当前是否为注释行并返回相关信息
"    "str:一行代码
"    function! s:IsComment(str)
"        let ret= [0, 0] "第一项为是否为注释行（0,1）,第二项为要处理的列，
"        let i=0
"        let strlen=len(a:str)
"        while i<strlen
"            "空格和tab允许为"//"的前缀
"            if !(a:str[i]==' ' ||    a:str[i] == '  ' )
"                let ret[1]=i
"                if a:str[i]=='/' && a:str[i+1]=='/'
"                    let ret[0]=1
"                else
"                    let ret[0]=0
"                endif
"                return ret
"            endif
"            let i=i+1
"        endwhile
"        return [0,0]  "空串处理
"    endfunction
"}}}
"单行或多行注释 "也可以使用cvim.zip插件来完成注释(*.c文件) /cc ---> //   /c* ---> /* */  /co ---> 取消

"vim折叠功能
""{{{
"折叠方式,可用选项 ‘foldmethod’ 来设定折叠方式：set fdm=***
"有 6 种方法来选定折叠：
"manual           手工定义折叠
"indent           更多的缩进表示更高级别的折叠
"expr             用表达式来定义折叠
"syntax           用语法高亮来定义折叠
"diff             对没有更改的文本进行折叠
"marker           对文中的标志折叠
"常用的折叠快捷键
"zf  创建折叠 (marker 有效)
"zo  打开折叠
"zO  对所在范围内所有嵌套的折叠点展开
"zc  关闭当前折叠
"zC  对所在范围内所有嵌套的折叠点进行折叠
"[z  到当前打开的折叠的开始处。
"]z  到当前打开的折叠的末尾处。
"zM  关闭所有折叠 (我喜欢)
"zr  打开所有折叠
"zR  循环地打开所有折叠 (我喜欢)
"zE  删除所有折叠
"zd  删除当前折叠
"zD  循环删除 (Delete) 光标下的折叠，即嵌套删除折叠
"za  若当前打开则关闭，若当前关闭则打开  ( 这个就足够了)
"zA  循环地打开/关闭当前折叠
"zj  到下一折叠的开始处 ( 我喜欢 )
"zk  到上一折叠的末尾   ( 我喜欢 )
"set fdm=marker
"set foldmethod=indent
"要想在{  } 代码块中折叠，按空格键
"syntax 与 c.vim 中的 /cc 注释功能冲突
set fdm=marker
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>   "使用空格打开或关闭折叠
"}}}
"vim折叠功能

"文件比较
""{{{
":vertical diffsplit FILE_RIGHT   "与已打开的文件进行比较
"设置不同之处显示上下三行
set diffopt=context:3
"命令模式（ESC键进入）：
"dp  左边文件差异复制到右边文件(直接在键盘上行按下dp)
"do  右边文件差异复制到左边文件(直接在键盘上行按下do)
"zo  隐藏相同行
"zc  展开向同行
"u 撤销
"Ctrl+w  文件切换
"
":qa! 退出不保存
":wa  保存
":wqa 保存退出
":diffupdate 重新比较
""}}}
"文件比较

""""
runtime macros/matchit.vim

"清除页面中所有行尾的空白符
":%s/\s\+$//
"清除所有空白 
":%s/\(\s*\n\)\+/\r/ 
"去掉所有的//注释 
":%s!\s*//.*!! 
"去掉所有的/* */注释 
":%s!\s*/\*\_.\{-}\*/\s*! ! 
"


"
"vim master
""{{{
"
"Verdancy --- New Commer
""{{{
"       f --- find; practic : (before)"aabbbccdd" --> ex: dfc -->  (after)"cdd"
"
"寄存器
""{{{
"       q[a-z] --- 记录命令, 已q结束, @[a-z]引用 --- 很强大,需要习惯使用
"       "[a-z]p --- 可以将寄存器[a-z]中的命令以文本的方式输出,并进行修改
"       "[a-z]y$  --- 将寄存器修改后的内容存回到对应寄存器
""}}}
"寄存器
"
""}}}
"Verdancy --- New Commer
"
"Visual 选中模式
""{{{
"    shift + v : 配合jk,上下键,整行选择
"    ctrl + v  : 配合hjkl,上下左右键,灵活选择区域
"    o   : 在选中的区域中对角线移动
"    O   : 在选中的区域中行左右移动
"    gv  : 重新选中原来的选中的区域
"    :   : 在选中区域后,shift+:到命令模式, : eg. '<,'>s/pattern/newstring/g -- 在选中的区域中查找patte && replace
"    ctrl + v 选中一列后, 按I插入字符,Esc退出  : 每一行都添加这个字符,很好的一个注释方法
""}}}
"Visual 选中模式
"
"Command Mode
""{{{
" :g/pattern/d  --- delete line contained of string "pattern"
""}}}
"Command Mode
"
"窗口
""{{{
"ctrl + 0 : 恢复窗口大小
"ctrl + = : 窗口等大
"ctrl + w + _ :  窗口最大化
"nctrl + w + _ : 改变窗口的大小
"ctrl + w + ctrl + c : 关闭窗口
"ctrl + w + ctrl + ] : 以函数所在文件分割窗口
"ctrl + w + shift + [hjkl] : 窗口位置放置
"
"shift + z + z : close vim edit. You need set auto write.
"
"vim t1.c t2.c t3.c -o2 : open thress files using two windows. if -o(no number), using three windows here.
""}}}
"窗口
"
"杂项
""{{{
"       !!date  --- 插入日期
"       read !date -R  --- 插入日期 ( -R 显示日期的格式而已 man date )
"
"       ctr + w ctrl + c  --- 关闭当前窗口
"
"       %s//s/+$// --- 删除多余的空格
"
"       ctrl + K  --- 插入特殊字符
"       digraph --- 显示特殊字符,字符组合
"
"       set ic  --- 忽略大小写
"
"       . --- 重复前次操作
"
"       ctrl + a  --- repeat record.
"
"       ctrl + r  --- 反撤消, 当u撤消后,又想恢复,可以使用
"
"       daw && caw && cis  --- delete a word && change a word && 修改一个句子
"
"       cc && dd  --- change one line reserving indent  && delete one line
"
"       CTRL+U  ----  CTRL+D   ---> half page move
"       CTRL+E  ----  CTRL+Y   ---> one line move
"       CTRL+F  ----  CTRL+B   ---> one page move
"
"       CTRL + O  --- 返回刚才½置,每按一次都会退回到之前的位置
"       CTRL + I  --- 与CTRL+O相反,每按一次退回来
"
"       [i  --- (将光标移到变量上)显示第一个局部变量定义处
"       [I  --- (将光标移到变量上)显示所有该变量的定义处
"       ''  --- 回到刚才停留处
"
"       //<patter/>  ---- 精确查找
"
"
""}}}
"杂项
"
""}}}
"vim master
"
"Shell
""{{{
"巧妙去除Linux下代码行中的^M符号和windows下代码编辑引起的警告错
":%s /^M//g ，其中^M的写法是按住ctrl不放，再按v，然后按M，再放ctrl
""{{{
"    #wash_error.sh
"    #!/bin/sh
"    ls *.h *.c | awk '{print $1}' > dealfile
"    cat dealfile | while read file
"    do
"    echo " " >> $file
"    done
"    #dos2unix *.c *.h
""}}}
"巧妙去除Linux下代码行中的^M符号和windows下代码编辑引起的警告错
""}}}
"Shell

map <C-S-R> :FufFile<CR>

"cd /cygdrive/f/work/jinglaoban
":[i]map x sequence	定义sequence为快捷键x。map命令表示快捷键x是在命令模""式，imap表示快捷键x是在输入模式
":unmap x	删除快捷键x
":map	列出所有定义的快捷键

"iab
"iab xdate <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>

"ab定义缩写 unab取消缩写
ab jsemail josephzeng36@gmail.com
ab jsname josephzeng
ab jsurl http://www.nrroom.com
ab jstime <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>
ab jsqq 149121745




