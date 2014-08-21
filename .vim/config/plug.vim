" NERD_tree配置
let NERDChristmasTree=1
let NERDTreeCaseSensitiveSort=1
let NERDTreeChDirMode=2
let NERDTreeHijackNetrw=1
"let NERDTreeWinPos="right"
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let NERDTreeShowBookmarks=1

"一些不错的映射转换语法（如果在一个文件中混合了不同语言时有用）
nnoremap <leader>1 :set filetype=xhtml<cr>
nnoremap <leader>2 :set filetype=css<cr>
nnoremap <leader>3 :set filetype=javascript<cr>
nnoremap <leader>4 :set filetype=php<cr>
"字典补全
autocmd! FileType * exec "set dict+=$VIMFILES/dict/".&ft.".dict"

"AuthorInfo
let g:vimrc_author='josephzeng'
let g:vimrc_email='josephzeng36@gmail.com'

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

"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'


"设置字典
autocmd FileType PHP set dictionary=$VIMFILES/dict/php.dict
autocmd FileType CSS,XHTML,*.less set dictionary=$VIMFILES/dict/css.css
autocmd FileType JAVASCRIPT set dictionary=$VIMFILES/dict/javascript.js
autocmd FileType XHTML,HTML let g:javascript_enable_domhtmlcss=1
autocmd FileType XHTML,HTML set dictionary=$VIMFILES/dict/html.html
autocmd FileType VIM set dictionary=$VIMFILES/dict/vim.dict
autocmd FileType WSF set dictionary=$VIMFILES/dict/wsf.dict
"autocmd FileType PYTHON set dictionary=$VIMFILES/dict/python.dict
autocmd FileType PL set dictionary=$VIMFILES/dict/perl.dict

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


"ctrlp
noremap <C-W><C-U> :CtrlPMRU<CR>
nnoremap <C-W>u :CtrlPMRU<CR>
nnoremap <C-W>s :CtrlP<CR>

let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|.rvm$'
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

"VimWiki 配置
let g:vimwiki_list = [{"path": "~/.wiki/", "path_html": "~/todo/sites/", "template_path":"/todo/template/", "template_default":"iphone", "auto_export": 1, "template_ext":".html"}]
let g:vimwiki_camel_case = 0
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_menu = ''
let g:vimwiki_CJK_length = 1
let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,del,br,hr,div,code,h1'

"markdown
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=mkd
let g:vim_markdown_folding_disabled=1
