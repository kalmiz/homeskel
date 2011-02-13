set t_Co=256
set term=xterm-256color
"set t_ti= t_te=
set bg=dark
set visualbell
set nobackup
set nowb
set dir=~/tmp/vim
set bs=2
set nowrap
set ruler
set showcmd
set smartindent
set cindent
set ai
set ignorecase
set et
set sw=4
set ts=4
set softtabstop=4
set ffs=unix,dos
set hidden
set noacd
set tag=~/tags
set noignorecase
set modeline
set pastetoggle=<F12>

"set number

filetype plugin indent on
color kalmi
syn on

map , <leader>
let g:NERDShutUp = 1
let g:NERDMapleader = '\'
let g:NERDCreateDefaultMappings = 0

nmap <leader>nc       <plug>NERDCommenterComment
vmap <leader>nc       <plug>NERDCommenterComment
nmap <leader>n<space> <plug>NERDCommenterToggle
vmap <leader>n<space> <plug>NERDCommenterToggle
nmap <leader>nm       <plug>NERDCommenterMinimal
vmap <leader>nm       <plug>NERDCommenterMinimal
nmap <leader>ns       <plug>NERDCommenterSexy
vmap <leader>ns       <plug>NERDCommenterSexy
nmap <leader>ni       <plug>NERDCommenterInvert
vmap <leader>ni       <plug>NERDCommenterInvert
nmap <leader>ny       <plug>NERDCommenterYank
vmap <leader>ny       <plug>NERDCommenterYank
nmap <leader>nl       <plug>NERDCommenterAlignLeft
vmap <leader>nl       <plug>NERDCommenterAlignLeft
nmap <leader>nb       <plug>NERDCommenterAlignBoth
vmap <leader>nb       <plug>NERDCommenterAlignBoth
nmap <leader>nn       <plug>NERDCommenterNest
vmap <leader>nn       <plug>NERDCommenterNest
nmap <leader>nu       <plug>NERDCommenterUncomment
vmap <leader>nu       <plug>NERDCommenterUncomment
nmap <leader>n$       <plug>NERDCommenterToEOL
vmap <leader>n$       <plug>NERDCommenterToEOL
nmap <leader>nA       <plug>NERDCommenterAppend
vmap <leader>nA       <plug>NERDCommenterAppend

au BufNewFile,BufRead /tmp/sql*     setf sql
au BufNewFile,BufRead *.phtml     setf php
au BufNewFile,BufRead *.json     setf json

let g:user_zen_leader_key = '<c-z>'
set complete=.,w,b,u
"au FileType * if filereadable($VIMRUNTIME.'/syntax/'.&filetype.'.vim') | exe('setl dict+='.$VIMRUNTIME.'/syntax/'.&filetype.'.vim') | endif
map <silent><F5> :BufExplorer<CR>
imap <silent><F5> <ESC>:BufExplorer<CR>
map SS :update<CR>
map S :update<CR>
map <F6> :NERDTreeToggle<CR>
map <M-PageDown> gt
map <M-PageUp> gT
map <C-w>t :tabnew<cr>
imap <C-w>t <ESC>:tabnew<cr>
imap <silent><M-PageDown> <ESC>gta
imap <silent><M-PageUp> <ESC>gTa
map <C-e>w :call SwitchWrap()<CR>

function! SwitchWrap()
    if &wrap == 1
        setl nowrap
    else
        setl wrap
    endif
endfunction


let g:sandbox_use_vcscommand = 1
let g:sandbox_look_for_updates = 1

nnoremap <silent> <F7> :TlistToggle<CR> 
inoremap <silent> <F7> <ESC>:TlistToggle<CR> 

let Tlist_Use_Right_Window = 1

" Command Make will call make and then cwindow which
" opens a 3 line error window if any errors are found.
" " if no errors, it closes any open cwindow.
:command! -nargs=* Make make <args> | cwindow 3
map <silent><F8> :silent Make %<CR>
imap <silent><F8> <ESC>:silent Make %<CR>

map <F9> :!bash<CR>

" Browser settings
nnoremap <silent> go :exe("!screen w3m \"".expand("<cfile>")."\"")<CR>

" dbext
let g:dbext_default_login_script_dir = '~/.vim/plugin/dbext/'

" screen settings
"if has("terminfo")
"    if &term =~ "screen"
"        set <C-PageDown>=^[[6;5~
"        set <C-PageUp>=^[[5;5~
"    endif
"endif
autocmd FileType text setlocal textwidth=78

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event
"  handler (happens when dropping a file on gvim).
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

if has("statusline")
  set statusline=%F\ %m%r%=[%-{&fenc}]\ [%{&ff}]\ [%Y]\ [%06l,%03v][%03p%%]
  set laststatus=2
endif
    
function! GuiTabLabel()
  let label = ''
  let bufnrlist = tabpagebuflist(v:lnum)

  " Add '+' if one of the buffers in the tab page is modified
  for bufnr in bufnrlist
    if getbufvar(bufnr, "&modified")
      let label = '+'
      break
    endif
  endfor

  " Append the number of windows in the tab page if more than one
  let wincount = tabpagewinnr(v:lnum, '$')
  if wincount > 1
    let label .= wincount
  endif
  if label != ''
    let label .= ' '
  endif

  " Append the buffer name
  return label . expand("%:t")
  "return label . expand(bufname(bufnrlist[tabpagewinnr(v:lnum) - 1]).":p")
endfunction

set stal=2
set tabline=%!MyTabLine()

function! MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'

    " the label is made by MyTabLabel()
    "let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
    let s .= ' %{BradLabel(' . (i + 1) . ')} '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999Xclose'
  endif

  return s
endfunction

function! BradLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr   = tabpagewinnr(a:n)
  let bufnam  = bufname(buflist[winnr - 1])
  " This is getting the basename() of bufname above
  let base    = substitute(bufnam, '.*/', '', '')
  let name    = a:n . ' ' . base
  return name
endfunction

function! MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  return bufname(buflist[winnr - 1])
endfunction

" Use the above tabe naming scheme
set tabline=%!MyTabLine()

function! JavaScriptFold() 
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend
    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction

au FileType javascript call JavaScriptFold()
au FileType javascript setl fen

set statusline+=%{SyntasticStatuslineFlag()}

let twitvim_count = 50


"-------------------------------------
"# File/Window/Buffer Managment Keys #
"-------------------------------------
 
" quick file browse mapping
map <Leader>e :e %:p:h<CR>
map <Leader>E :lcd %:p:h<CR>
map <Leader>N :new %:p:h<CR>
 
" Give tab cycling nicer keys (normally these just do same as j & k)
noremap <C-n> :tabnext<CR>
noremap <C-p> :tabNext<CR>
noremap <Tab> :tabnext<CR>
noremap <S-Tab> :tabprev<CR>
 
" new tab
"nmap <Leader>t :tabe %:p:h<CR>
nmap <Leader>T :tabe %:p:h<CR>
nmap <Leader>n :tabnew<CR>
 
" tab close
map <Leader>w :tabclose<CR>
" close window
map <Leader>q :q<CR>
" quit vim
map <Leader>Q :qall!<CR>

" Better way to enter command line (get rid of pointless shift)
nnoremap ; :
 

" make F2 save
nmap <silent> <F2> <ESC>:w<CR>
imap <silent> <F2> <C-o>:w<CR>

nmap <Leader>b :FufBuffer<CR>
nmap <F3> :FufBuffer<CR>
nmap <F4> :FufTag<CR>
nmap <F5> :FufFileWithCurrentBufferDir<CR>
let g:CommandTMaxFiles=20000
"let g:CommandTMaxDepth=30
"
let g:snipplr_rb='~/bin/snipplr.rb'
let g:snips_author = 'Zoltan Kalmar'

function! TimestampToDate()
    echo strftime("%Y-%m-%d %H:%M:%S", expand('<cword>'))
endfunction
