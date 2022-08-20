noremap R :call <SID>FileTypeOpen()<CR>

func! s:FileTypeOpen()
    exec "w"
        if &filetype == 'c'
            exec "!g++ % -o %<"
            exec "!time ./%<"
        elseif &filetype == 'cpp'
            set splitbelow
            exec "!g++ -std=c++11 % -Wall -o %<"
            :sp
            :res -15
            :term ./%<
        elseif &filetype == 'java'
            set splitbelow
            :sp
            :res -5
            term javac % && time java %<
        elseif &filetype == 'sh'
            :!time bash %
        elseif &filetype == 'python'
            "set splitbelow
            ":sp
            ":term python3 %
            :!time python3 %
        elseif &filetype == 'javascript'
            "set splitbelow
            ":sp
            ":term node %
            :!time node %
        elseif &filetype == 'html'
            "silent! exec "!".g:mkdp_browser." % &"
            silent! exec "Bracey"
        elseif &filetype == 'markdown'
            silent! exec "MarkdownPreview"
        elseif &filetype == 'tex'
            silent! exec "VimtexStop"
            silent! exec "VimtexCompile"
        elseif &filetype == 'go'
            set splitbelow
            :sp
            :term go run .
    endif
endfunc
