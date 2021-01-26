" File              : shortcuts.vim
" Author            : josephzeng <josephzeng36@gmail.com>
" Date              : 03.04.2020
" Last Modified Date: 03.04.2020
" Last Modified By  : josephzeng <josephzeng36@gmail.com>

nnoremap <leader>f1 :set filetype=xhtml<cr>
nnoremap <leader>f2 :set filetype=css<cr>
nnoremap <leader>f3 :set filetype=javascript<cr>
nnoremap <leader>f4 :set filetype=php<cr>

"光标后面输入日期
map <leader>dt a<C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>

" 切换自动换行
map <silent><leader>wp <esc>:set wrap!<cr>

map <leader>gg <ESC>ggVG
nmap <silent> <leader>w :w!<CR>
nmap <silent> <leader>x :x!<CR>
nmap <silent> <leader>q :q!<CR>
nmap <silent> <leader>qa :qall!<CR>
nmap <silent> <leader>nt :NERDTreeToggle<cr>
nmap <silent> <leader>ms :marks<CR>
nmap <silent> <leader>fv :FencView<CR>
nmap <silent> <leader>tt :TagbarToggle<CR>
nmap <silent> <leader>bf :BufExplorer<CR>
nmap <silent> <leader>hs :GundoToggle<cr>
nmap <silent> <leader>hi :AddHeader<cr>

map <leader>ss :mksession! .my.vim<cr> :wviminfo! .my.viminfo<cr>
map <leader>rs :source .my.vim<cr> :rviminfo .my.viminfo<cr>
