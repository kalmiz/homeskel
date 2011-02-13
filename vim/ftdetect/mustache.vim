if has("autocmd")
  au  BufNewFile,BufRead *.mustache set filetype=mustache
  au  BufNewFile,BufRead *.hbs set filetype=mustache
endif
