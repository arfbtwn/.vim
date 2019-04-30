autocmd BufNewFile,BufRead * call Detect()

function Detect()
    if did_filetype()
        return
    endif

    if search('{1:') != 0
        setfiletype swift-iso15022
    endif
endfunction
