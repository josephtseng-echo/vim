" 快捷键
"光标后面输入日期
map <leader>dt a<C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>

" 切换自动换行
map <silent><leader>wp <esc>:set wrap!<cr>

" 全选
map <leader>gg <ESC>ggVG

map <F11> :NERDTreeToggle<CR>
map <F10> :TagbarToggle<CR>
map <F9> :NERDTree<CR>
map <F8> :WMToggle<CR>
map <F2> :BufExplorer<CR>
map <F7> :TlistToggle<CR>
map <F3> :marks<CR>


nmap <silent> <leader>w :w!<CR>
nmap <silent> <leader>x :x!<CR>
nmap <silent> <leader>q :q!<CR>
nmap <silent> <leader>qa :qall!<CR>

" map bn & bp
noremap <M-Right> :bn<CR>
noremap <M-Left> :bp<CR>
nmap <S-L> :bnext<CR>
nmap <S-H> :bprevious<CR>

" Tab操作快捷方式!
"nmap <S-J> :tabnext<CR>
"nmap <S-K> :tabprev<CR>

" 插入模式下上下左右移动光标
inoremap <c-h> <left>
inoremap <c-l> <right>
inoremap <c-j> <c-o>gj
inoremap <c-k> <c-o>gk

" 窗口切换
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k

" Alt-W切换自动换行
noremap <a-w> :exe &wrap==1 ? 'set nowrap' : 'set wrap'<cr>

" 选中状态下 Ctrl+c 复制
vnoremap <c-c> "+y
