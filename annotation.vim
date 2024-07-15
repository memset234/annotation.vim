" The version number of this code is 1.1
" Do not modify lines 2 to 47!
func CplusplusCommentOnOneLine(nu)
    if getline(a:nu)[0] == '/' && getline(a:nu)[1] == '/'
        if getline(a:nu)[2] == ' '
            return "\<ESC>m00r\<Space>lr\<Space>`0a"
        else
            return "\<ESC>m00xx`0hha"
        endif
    endif
    let k = ""
    let f = ""
    if getline(a:nu)[0] != ' '
        let k = k . "l"
        let f = f . "/"
        if getline(a:nu)[1] != ' '
            let k = k . "l"
            let f = f . "/"
        else
            let f = f . "\<ESC>r/a"
        endif
    else
        let f = f . "\<ESC>r/lr/a"
    endif
    return "\<ESC>m00i" . f . "\<ESC>`0" . k . "a"
endfunc
func CplusplusCommentOnMoreLine(lt,rt)
    let L = a:lt
    let R = a:rt
    if L > R
        let tmp = L
        let L = R
        let R = tmp
    endif
    let i = L
    let now = "\<ESC>" . L . "Ga"
    while i <= R
        let now = now . CplusplusCommentOnOneLine(i) . "\<ESC>ja"
        let i = i + 1
    endwhile
    return now
endfunc
let g:tmpL = 0
let g:tmpR = 0
func PretreatmentVisual()
    let g:tmpL = line("'<")
    let g:tmpR = line("'>")
endfunc

" You can configure it yourself here, but don't touch the content behind it.
imap `/ <C-R>=CplusplusCommentOnOneLine(line('.'))<CR>
nmap gf a<C-R>=CplusplusCommentOnOneLine(line('.'))<CR><ESC>
vmap K :\<BS>\<BS>\<BS>\<BS>\<BS>call PretreatmentVisual()<CR><ESC>i<C-R>=CplusplusCommentOnMoreLine(g:tmpL,g:tmpR)<CR>
smap `/ <C-G>K
