"mode show
func! g:MyMode()
    let s:str = ''
    "get cur mode
    let s:cur = mode()
    if s:cur == 'i'
        "let s:str = '编辑模式'
        let s:str = 'o(*￣▽￣*)o '
        hi User7 guifg=#49AF47  guibg=#413C41 gui=bold
    elseif s:cur =='n'
        "let s:str = '一般模式'
        let s:str = 'o(°▽、°o)'
        hi User7 guifg=#4386C7  guibg=#413C41 gui=bold
    elseif s:cur =='V'
        "let s:str = '可视模式'
        let s:str = '（⊙＿⊙）'
        hi User7 guifg=#FF6600  guibg=#413C41 gui=bold
    elseif s:cur =='c'
        "let s:str = '查找模式'
        let s:str = '(￣ c￣)'
        hi User7 guifg=#FF0066  guibg=#413C41 gui=bold
    "编辑下 c-v c-v
    elseif s:cur =='' 
        "let s:str = "块模式"
        let s:str = '（⊙＿⊙）'
        hi User7 guifg=#FF6600  guibg=#413C41 gui=bold
    else
        let s:str = s:cur
    endif

    return s:str
endfunc
