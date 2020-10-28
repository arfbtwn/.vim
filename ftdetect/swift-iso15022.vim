augroup filetype
    au! BufNewFile,BufRead * call Detect()
augroup end

function Detect()
    if did_filetype()
        return
    endif

    if search('{1:') != 0
        setfiletype swift-iso15022
    endif
endfunction
