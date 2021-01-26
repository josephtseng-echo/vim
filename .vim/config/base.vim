" File              : base.vim
" Author            : josephzeng <josephzeng36@gmail.com>
" Date              : 03.04.2020
" Last Modified Date: 03.04.2020
" Last Modified By  : josephzeng <josephzeng36@gmail.com>

" 配色
"colorscheme delek
"colorscheme desertEx
set nocompatible    " 关闭兼容模式
set shortmess=atI   " 去掉欢迎界面

" 关闭错误信息响铃
set noerrorbells            
" 关闭使用可视响铃代替呼叫
set novisualbell            
" 置空错误铃声的终端代码
set t_vb=

" 自动格式化
set formatoptions=tcrqn

" 不使用beep或flash
set vb t_vb=

if (g:isGUI)
    set guioptions-=m " 隐藏菜单栏
    set guioptions-=T " 隐藏工具栏
    set guioptions-=L " 隐藏左侧滚动条
    set guioptions-=r " 隐藏右侧滚动条
    set guioptions-=b " 隐藏底部滚动条
    set showtabline=0 " 隐藏Tab栏
endif

"编码处理
if has("multi_byte")
    "A,设置文件的代码形式
    set encoding=utf-8
    set fileencodings=utf-8,cp936,chinese,cp932
    set tenc=utf-8
    set maxcombine=4
     "打开断行模块对亚洲语言支持。
    set fo+=mBM
    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)\|\(jp\)'
        set ambiwidth=double
    endif

    if (g:isWin)
        set fenc=chinese
        if version>=603
            set helplang=cn
        endif
    else
        set fenc=utf-8
    endif

    let &termencoding=&encoding

    "B,vim提示信息乱码的解决
    "language messages zh_CN.utf-8
    "set langmenu=zh_CN.utf-8
endif

" 每次退出插入模式时自动保存
"au InsertEnter,InsertLeave * write

"set nocursorline 
"set nocursorcolumn
set gcr=a:blinkoff0
highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE

"指定在选择文本时， 光标所在位置也属于被选中的范围。
set selection=inclusive 
""
"不要自动设置字节序标记
set nobomb
""
"""打开超时: 映射和键码,默认打开
set timeout
"""set nottimeout
""
"""映射上的超时在三秒以后发生,默认1000
"""set timeoutlen=1000
""
"""键码上的超时在十分之一秒后发
"""set ttimeoutlen=10
""
"防止特殊符号无法正常显示
set ambiwidth=double
""            
""" 字符边界提示
"""set colorcolumn=80
""
""
" 制表符
"tab设置宽度
set tabstop=4
"""将tab键转换为空格
"""set expandtab
"""set smarttab
set noexpandtab
"""
"""
" 自动缩进尺寸为4个空格
"""set ts=4
set shiftwidth=4
set softtabstop=4
""
"命令模式下tab自动补全
set wildmenu
""
"字体，字号\ 表示空格(字体务必使用等宽字体)
"设置英文字体 
set guifont=Monospace/14 
"设置中文字体
set guifontwide=Monospace/14

""" 长文本自动折断
"""set linebreak 
""
"不自动换行"
set nowrap

"不显示，显示tab符和行尾eol字符,空格nbsp,逗号分开
"set list  
"set listchars=tab:\|-

"上下可视行数
set scrolloff=5

"打开语法高亮
syntax enable

" 可以使删除键不断删除，避免出现输入3个，不能删除3个以上字符
set backspace=indent,eol,start 

" 当文 件在外部被修改，自动更新该文件
set autoread 

" 打开行号
set nu

" 行号前的宽度
set numberwidth=5

"显示标尺
set ruler
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)

" 自动缩进
set autoindent

"开启折叠
set fen"{{{

set foldmethod=marker

"折叠层次
set foldlevel=1

"设置代码折叠宽度为4个字符
set foldcolumn=1

"hi Folded guibg=grey guifg=blue
"hi FoldColumn guibg=darkgrey guifg=white
"}}}
"打开javascript折叠
let b:javascript_fold=1

" 按下 Q 不进入 Ex 模式，而是退出
nmap Q <Esc>

"查找结果高亮,自动跳
set hlsearch incsearch

"智能大小写查找
set ignorecase smartcase

"显示括号配对情况
set showmatch

" 状态栏显示目前所执行的指令
set showcmd


"匹配括号高亮的时间（单位是十分之一秒）
set matchtime=5

"显示完整标签
set showfulltag

"允许在有未保存的修改时切换缓冲区
set hidden                   

"开始magci正则
set magic

"行内替换
set gdefault

"存全局变量
set viminfo+=!

"可以在buffer的任何地方使用鼠标
set mouse=a
set selection=exclusive
set selectmode=mouse,key

"通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0

"在被分割的窗口间显示空白，便于阅读
set fillchars+=vert:\ ,stl:\ ,stlnc:\

"允许backspace和光标键跨越行边界
set whichwrap+=<,>,[,],b,s

"带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-

"设置文件浏览器目录为当前目录
set autochdir       
set bsdir=buffer

set nocp

"命令行的高度，默认为1，这里设为4
set cmdheight=5        

"标题栏显示的内容[完整路径、文件名、当前行/总行,列,行百分比]
set title 
"set titlestring=%(%F%)\ [\ %Y\ ]\ %{g:FileTime()}
set titlelen=0

set laststatus=2
""
autocmd! bufenter,bufnewfile,winenter,tabenter * cd %:p:h
autocmd! bufwritepost $VIMRC source $VIMRC
if exists('*mkdir') && !isdirectory($VIEWCACHE)
    sil! cal mkdir($VIEWCACHE, 'p')
endif
set viewdir=$VIEWCACHE
"
set noswapfile
if exists('*mkdir') && !isdirectory($SWPCACHE)
    sil! cal mkdir($SWPCACHE, 'p')
endif
set directory=$SWPCACHE

set backup
set writebackup
set history=1024
set backupcopy=auto
if exists('*mkdir') && !isdirectory($BACKUPCACHE)
    sil! cal mkdir($BACKUPCACHE, 'p')
endif
set backupdir=$BACKUPCACHE
autocmd BufWritePre * let &backupext = strftime(".%Y-%m-%d-%H-%M-%S").'.bak'


set undofile
set undolevels=10000
set undoreload=10000
if exists('*mkdir') && !isdirectory($UNDOCACHE)
    sil! cal mkdir($UNDOCACHE, 'p')
endif
set undodir=$UNDOCACHE

set sessionoptions="blank,buffers,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"

