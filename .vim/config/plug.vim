" ctags Tlist
if (g:isWin)
    " 设定windows系统中ctags程序的位置
    let Tlist_Ctags_Cmd = '"'.$VIMFILES.'/tools/ctags.exe"'
else
    let Tlist_Ctags_Cmd = ' /usr/bin/ctags '
endif
let Tlist_Show_Menu = 1
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
set tags=tags;
if exists("&autochdir")
    set autochdir
endif

" NERD_tree配置
let NERDChristmasTree=1
let NERDTreeCaseSensitiveSort=1
let NERDTreeChDirMode=2
let NERDTreeHijackNetrw=1
"let NERDTreeWinPos="right"
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let NERDTreeShowBookmarks=1
nmap <silent> <leader>nt :NERDTree<cr>

"字典补全
autocmd! FileType * exec "set dict+=$VIMFILES/dict/".&ft.".dict"

"一些不错的映射转换语法（如果在一个文件中混合了不同语言时有用）
nnoremap <leader>1 :set filetype=xhtml<cr>
nnoremap <leader>2 :set filetype=css<cr>
nnoremap <leader>3 :set filetype=javascript<cr>
nnoremap <leader>4 :set filetype=php<cr>

" {{{ plugin - bufexplorer.vim Buffers切换
" \be 全屏方式查看全部打开的文件列表
" \bv 左右方式查看   \bs 上下方式查看
"}}}
let g:bufExplorerSortBy='mru'
let g:bufExplorerSplitRight=0
let g:bufExplorerSplitVertical=1
let g:bufExplorerSplitVertSize = 30
let g:bufExplorerUseCurrentWindow=1

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

autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType java set omnifunc=javacomplete#Complet

" PHP Twig 模板引擎语法
au BufRead,BufNewFile *.twig set syntax=twig

" Python 文件的一般设置，比如不要 tab 等
"autocmd FileType python set tabstop=4 shiftwidth=4 expandtab

"状态行显示的内容 [包括系统平台、文件类型、坐标、所占比例、时间等]  
set laststatus=2  
"set statusline=
"set statusline+=%7*\ %{g:MyMode()}\ 
"set statusline+=%1*\ [%f%m%r%h%w]\ 
"set statusline+=%4*\ %Y\ 
"set statusline+=%3*\ %{&ff},%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}\ 
"set statusline+=%5*\ %3p%%/%LL\ 
"set statusline+=%6*\ X:%2*%c\ %6*Y:%2*%l\ 
"set statusline+=\ %r%m%8*%=\ %3*%-16{strftime(\"%Y-%m-%d\ %H:%M\")}\ 
"set statusline+=\ %5*©2013\ 
"set statusline+=%2*\ 0x%04.4B\

" Powerline
set laststatus=2
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
let g:Powerline_symbols = 'fancy'

" 当前窗口状态栏颜色
hi StatusLine guifg=#000000 guibg=#C2BFA5
" 非当前窗口状态栏颜色
hi StatusLineNC guifg=#CCCCCC guibg=#413C41 
" 模式消息显示的颜色
"hi ModeMsg guifg=White guibg=LimeGreen

" Omni menu colors
hi Pmenu guifg=#CCCCCC guibg=#333333
hi PmenuSel guifg=#49AF47 guibg=#413C41 gui=bold

" zencoding
let g:user_zen_expandabbr_key = '<c-e>'    "设置为ctrl+e展开
let g:use_zen_complete_tag = 1

" winManager setting
"设置界面分割
"let g:winManagerWindowLayout = "BufExplorer,FileExplorer|TagList"
"let g:winManagerWindowLayout = "TagList|FileExplorer,BufExplorer"
"设置winmanager的宽度，默认为25
let g:winManagerWidth = 30
let g:winManagerWindowLayout='FileExplorer|TagList'    "文件浏览器和窗口管理器 -- 插件: WinManager
let g:AutoOpenWinManager = 1                        "自动打开文件浏览器0关1开
set autochdir               " 自动切换当前目录为当前文件所在的目录

let g:tagbar_ctags_bin="/usr/bin/ctags"

"doxygen setting
let g:DoxygenToolkit_briefTag_pre="@des  "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "
let g:DoxygenToolkit_blockHeader=""
let g:DoxygenToolkit_blockFooter=""
let g:DoxygenToolkit_authorName="Mathias Lorente"
let g:DoxygenToolkit_licenseTag="My own license"
let g:DoxygenToolkit_authorName="josephzeng josephzeng36@gmail.com"
let s:licenseTag = "Copyright(C)'"
let s:licenseTag = s:licenseTag . "For free'"
let s:licenseTag = s:licenseTag . "All right reserved'"
let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1
map <leader>dxa :DoxAuthor<CR>
map <leader>dxf :Dox<CR>
map <leader>dxb :DoxBlock<CR>


" javascript
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
au BufRead,BufNewFile *.js set ft=javascript.jquery

" Launches neocomplcache automatically on vim startup.
let g:neocomplcache_enable_at_startup=0
let g:neocomplcache_max_list=25
let g:neocomplcache_min_keyword_length=5
let g:neocomplcache_enable_auto_select=1
let g:neocomplcache_enable_auto_delimiter=1
let g:neocomplcache_enable_fuzzy_completion=1
let g:neocomplcache_manual_completion_start_length=5
let g:neocomplcache_enable_cursor_hold_i=1
let g:neocomplcache_enable_insert_char_pre=1
let g:neocomplcache_min_syntax_length =4
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_enable_camel_case_completion=1
let g:neocomplcache_enable_underbar_completion=1

let g:neocomplcache_dictionary_filetype_lists = {
   \ 'default' : '',
   \ 'css' : $VIMFILES.'/dict/css.dict',
   \ 'xhtmL' : $VIMFILES.'/dict/html.dict',
   \ 'HTML' : $VIMFILES.'/dict/html.dict',
   \ 'PHP' : $VIMFILES.'/dict/php_funclist.dict',
   \ 'VIM' : $VIMFILES.'/dict/vim.dict',
   \ 'WSF' : $VIMFILES.'/dict/wsf.dict',
   \ 'JAVASCRIPT' : $VIMFILES.'/dict/javascript.dict'
   \ }

if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif

if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif

"let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'

"设置字典
autocmd FileType PHP set dictionary=$VIMFILES/dict/php_funclist.php
autocmd FileType CSS,XHTML,*.less set dictionary=$VIMFILES/dict/css.css
autocmd FileType JAVASCRIPT set dictionary=$VIMFILES/dict/javascript.js
autocmd FileType XHTML,HTML let g:javascript_enable_domhtmlcss=1
autocmd FileType XHTML,HTML set dictionary=$VIMFILES/dict/html.html
autocmd FileType VIM set dictionary=$VIMFILES/dict/vim.dict
autocmd FileType WSF set dictionary=$VIMFILES/dict/wsf.dict
autocmd FileType PYTHON set dictionary=$VIMFILES/dict/python.dict

"onmi 代码自动补全<C-x><C-o>
if has("autocmd") && exists("+omnifunc")
    au FileType xhtml,html,xml
                \ :setl omnifunc=htmlcomplete#CompleteTags

    au FileType php
                \ :setl omnifunc=phpcomplete#CompletePHP

    au FileType css,*.less
                \ :setl omnifunc=csscomplete#CompleteCSS

    au FileType javascript
                \ :setl omnifunc=javascriptcomplete#CompleteJS

    au Filetype *
                \ if &omnifunc == "" |
                \   setlocal omnifunc=syntaxcomplete#Complete |
                \ endif
endif

"不显示函数定义
set completeopt=longest,menu 

"自动完成
set complete=.,d,b

"VimWiki 配置
"let g:vimwiki_list = [{"path": "~/.wiki/", "path_html": "~/todo/sites/", "auto_export": 1}]
"map <F6> :VimwikiAll2HTML<cr>
"let g:vimwiki_camel_case = 0
"let g:vimwiki_hl_cb_checked = 1
"let g:vimwiki_menu = ''
"let g:vimwiki_CJK_length = 1
"let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,del,br,hr,div,code,h1'

" taskpaper
let g:task_paper_date_format = "%Y-%m-%d"
let g:task_paper_archive_project = "josephzeng"
let g:task_paper_follow_move = 0
let g:task_paper_search_hide_done = 1
let g:task_paper_styles={'wait': 'ctermfg=Blue guifg=Blue', 'FAIL':'ctermbg=Red guibg=Red'}

" {{{ plugin -yankring.vim 寄存器可视操作
map <leader>yk :YRShow<CR>
" }}}

" {{{设置FuzzyFinder
"map <leader>ff :FufFile<CR>
"map <leader>ft :FufTaggedFile<CR>
"map <leader>fg :FufTag<CR>
"map <leader>fd :FufDir<CR>
"map <leader>fm :FufMruFile<CR>
"map <leader>fb :FufBuffer<CR>
"}}}
"map <C-S-R> :FufFile<CR>


"ctrlp
noremap <C-W><C-U> :CtrlPMRU<CR>
nnoremap <C-W>u :CtrlPMRU<CR>

let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|.rvm$'
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

"AuthorInfo
let g:vimrc_author='josephzeng'
let g:vimrc_email='josephzeng36@gmail.com'