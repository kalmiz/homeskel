
function! zend#CompletePHP(findstart, base)

    Decho("TEST: " . a:findstart . " - " . a:base)
    if a:findstart
        let line = getline('.')
        Decho("L: " . line)
        let start = col('.') - 1
        let curline = line('.')
        let compl_begin = col('.') - 2
        while start >= 0 && line[start - 1] =~ '[a-zA-Z_0-9\x7f-\xff$]'
            let start -= 1
        endwhile
        let b:compl_context = getline('.')[0:compl_begin]
        return start
    endif
endfunction
