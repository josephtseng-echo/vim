" 配色
"colorscheme molokai
colorscheme delek
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
    language messages zh_CN.utf-8
    "set langmenu=zh_CN.utf-8
endif

"更改工作目录为当前目录,工作目录随文件变
autocmd! bufenter,bufnewfile,winenter,tabenter * cd %:p:h

" 设置对文件的添加新语法支持
"autocmd BufRead,BufNewFile *.js set ft=javascript syntax=jquery
"au BufRead,BufNewFile *.html set ft=html syntax=javascript
autocmd BufRead,BufNewFile *.json setf json

" 每次退出插入模式时自动保存
"au InsertEnter,InsertLeave * write


"高亮显示当前行,色值需要到色彩文件处修改,cursorline,cursorcoloumn 
set cursorline
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white 
"set cursorcolumn
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white 

"光标设置
"gcr 是 guicursor 的简写，
"具体参考 :help gcr。
"所有模式下取消光标闪烁
set gcr=a:blinkoff0

"指定在选择文本时， 光标所在位置也属于被选中的范围。
set selection=inclusive 

"不要自动设置字节序标记
set nobomb

"打开超时: 映射和键码,默认打开
set timeout
"set nottimeout

"映射上的超时在三秒以后发生,默认1000
"set timeoutlen=1000

"键码上的超时在十分之一秒后发
"set ttimeoutlen=10

"防止特殊符号无法正常显示
set ambiwidth=double
            
" 字符边界提示
"set colorcolumn=80


" 制表符
"tab设置宽度
set tabstop=4
"将tab键转换为空格
set expandtab
set smarttab

" 自动缩进尺寸为4个空格
"set ts=4
set shiftwidth=4
set softtabstop=4

"命令模式下tab自动补全
set wildmenu

"字体，字号\ 表示空格(字体务必使用等宽字体)
"设置英文字体 
set guifont=Monospace/14 
"设置中文字体
set guifontwide=Monospace/14

" 长文本自动折断
"set linebreak 

"不自动换行"
set nowrap

"不显示，显示tab符和行尾eol字符,空格nbsp,逗号分开
"set list  
"set listchars=tab:\|-

"上下可视行数
set scrolloff=5


"打开语法高亮
syntax enable   

"开启文件类型和语法侦测
syntax on   
filetype on

"针对不同的文件类型加载对应的插件
filetype plugin on             
filetype plugin indent on 

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

" 如果为空文件，则自动设置指定目录
"lcd /cygdrive/e/wamp/www/

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

" 不设置.swp 文件 
set noswapfile

" 将 .swp 文件放置目录固定在一个文件目录中逗号分开，先在第一个找，再第二个
if isdirectory($VIMFILES."/swp")
    set directory=z:,$VIMFILES/swp
else
    " 不设置.swp 文件 
    set noswapfile
endif

" 备份文件
set backup
set writebackup

" 历史记录数
set history=1024

"如果备份目录存在
if isdirectory($VIMFILES."/backup")
    " 写回文件并建立备份时操作
    set backupcopy=auto
    " 设置备份文件的默认路径
    set backupdir=Z:,$VIMFILES/backup
    " 对指定文件类型保存原始版本
    "set patchmode=.orig~
   autocmd BufWritePre * let &backupext = strftime(".%Y-%m-%d-%H-%M-%S").'.bak'
endif

" 撤消记录文件保存,永久撤消
if isdirectory($VIMFILES.'/_undodir')
    if v:version>='703' 
        set undodir=z:,$VIMFILES.'/_undodir'
        set undofile
        "最大撤消次数
        set undolevels=1000 
        "maximum number lines to save for undo on a buffer reload
        set undoreload=1000
    endif
endif

"状态行显示的内容 [包括系统平台、文件类型、坐标、所占比例、时间等]  
set laststatus=2  
