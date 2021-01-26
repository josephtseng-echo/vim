" File              : func.vim
" Author            : josephzeng <josephzeng36@gmail.com>
" Date              : 03.04.2020
" Last Modified Date: 03.04.2020
" Last Modified By  : josephzeng <josephzeng36@gmail.com>

func! ToggleCurline ()
  if &cursorline && &cursorcolumn
    set nocursorline
    set nocursorcolumn
  else
    set cursorline
    set cursorcolumn
  endif
endfunction
map <silent><leader>tc :call ToggleCurline()<CR>

func! FormatCode()
      exec "w"
      if &filetype == 'c' || &filetype == 'h'
         exec "!astyle --style=google %"
      elseif &filetype == 'cpp'
         exec "!astyle --style=google %"        
	  else 
		 exec "!astyle --style=linux -A10 -j -O -o -c -k3 -H -S -Y %"
      return
      endif
endfunc
map <silent><leader>fc :call FormatCode()<CR>

