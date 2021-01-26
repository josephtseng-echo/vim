" File              : plugins.vim
" Author            : josephzeng <josephzeng36@gmail.com>
" Date              : 03.04.2020
" Last Modified Date: 01.01.2021
" Last Modified By  : josephzeng <josephzeng36@gmail.com>

Plug 'mbbill/fencview'
Plug 'tpope/vim-surround'
Plug 'yegappan/mru'
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/vimshell.vim'
Plug 'fatih/vim-go'
Plug 'aperezdc/vim-template'

Plug 'rhysd/vim-clang-format'
Plug 'qw8880000/DoxygenToolkit.vim'
let g:DoxygenToolkit_briefTag_funcName = "yes"
let g:DoxygenToolkit_authorName = "JosephZeng josephzeng36@gmail.com"
let g:doxygen_enhanced_color = 1
map <leader>da :DoxAuthor<CR>
map <leader>df :Dox<CR>
map <leader>db :DoxBlock<CR>
map <leader>dc a /* */<LEFT><LEFT><LEFT>

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='simple'

"Plug 'scrooloose/syntastic'
Plug 'dense-analysis/ale'
let g:ale_linters_expicit = 1
let g:ale_linters = {
    \ 'cpp':['gcc','clang','cppcheck'],
    \ 'c':['gcc','clang','cppcheck']}

let g:ale_sign_column_always = 1                    " 总是显示动态检查结果
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_lint_on_text_changed = 'normal'            " 代码更改后启动检查
let g:ale_lint_on_insert_leave = 1                    " 退出插入模式即检查
let g:airline#extensions#ale#enabled = 1
let g:ale_set_quickfix = 1
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

let g:ale_echo_msg_format = '[%linter%] %code: %%s'    " 告警显示格式
let g:ale_sign_error = ">>"                            " error 告警符号
let g:ale_sign_warning = "--"                        " warning 告警符号
let g:ale_echo_msg_error_str         = 'E'                          " 错误显示字符
let g:ale_echo_msg_warning_str       = 'W'                          " 警告显示字符

Plug 'rking/ag.vim'
let g:ackprg = 'ag --nogroup --nocolor --column'
nnoremap <c-u> :Ag<space>

Plug 'vim-scripts/google.vim'
Plug 'vim-scripts/a.vim'

Plug 'junegunn/vim-easy-align'
Plug 'skywind3000/quickmenu.vim'
Plug 'skywind3000/asyncrun.vim'
let g:asyncrun_open = 6
let g:asyncrun_bell = 1

Plug 'justinmk/vim-dirvish'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let g:NERDTreeWinSize=35

Plug 'scrooloose/nerdcommenter'
let NERDTreeWinSize=32
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeChDirMode=1
let NERDTreeDirArrows=1

Plug 'plasticboy/vim-markdown'
Plug 'kien/rainbow_parentheses.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'jrosiek/vim-mark'
Plug 'sjl/gundo.vim'
Plug 'juneedahamed/svnj.vim'
Plug 'majutsushi/tagbar'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe'
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone
let g:ycm_use_clangd = 0
nmap <leader>gd :YcmDiags<CR>
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>           " 跳转到申明处
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>            " 跳转到定义处
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
noremap <c-z> <NOP>

let g:ycm_semantic_triggers =  {
           \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
           \ 'cs,lua,javascript': ['re!\w{2}'],
           \ }
let g:ycm_filetype_whitelist = { 
            \ "c":1,
            \ "cpp":1, 
            \ "go":1,
            \ "python":1,
            \ "sh":1,
            \ "zsh":1,
            \ }

let g:ycm_filetype_blacklist = {
        \ 'markdown' : 1,
        \ 'text' : 1,
        \ 'pandoc' : 1,
        \ 'infolog' : 1,
        \}


Plug 'ludovicchabant/vim-gutentags'
let g:gutentags_project_root = ['.svn', '.git', '.project']
let g:gutentags_ctags_tagfile = '.tags'

let s:vim_tags = expand($CTAGS)
let g:gutentags_cache_dir = s:vim_tags
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
"let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
if !isdirectory(s:vim_tags)
	silent! call mkdir(s:vim_tags, 'p')
endif
let g:gutentags_auto_add_gtags_cscope = 0

Plug 'voldikss/vim-floaterm'


Plug 'alpertuna/vim-header'
let g:header_field_author = 'josephzeng'
let g:header_field_author_email = 'josephzeng36@gmail.com'
let g:header_auto_add_header = 0

Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'
noremap <Leader>fa :LeaderfFunction<cr>
noremap <Leader>fb :LeaderfBuffer<cr>
noremap <Leader>ft :LeaderfTag<cr>
noremap <Leader>fm :LeaderfMru<cr>
noremap <Leader>fl :LeaderfLine<cr>
noremap <Leader>ff :LeaderfFile<cr>
let g:Lf_StlSepaator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand($CACHE)
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
 let g:Lf_NormalMap = {
             \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
             \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
             \ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
             \ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
             \ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
             \ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
             \ }


let g:svnj_custom_statusbar_ops_hide = 1
let g:svnj_browse_cache_all = 1

" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

"buff explorer
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'

"templates
let g:templates_directory = '~/.vim/templates'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {}
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
