" Kalmi's PHP macros and settings
"
"  Indent PHP block
map <leader>ki :%s/\(.*\)<?php/<?php/g<CR>
" Trim end of lines
map <leader>kt :%s/[\t ]*$//<CR>

map <leader>lp a$this->params->

"let g:php_folding = 1

compiler php
setlocal keywordprg=phpmanual
