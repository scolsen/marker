" Supported Markdown syntax
let s:marker_marks = {}
let s:marker_marks.bold       = ["**", "__"]
let s:marker_marks.ital       = ["*", "_"]
let s:marker_marks.code       = ["`"]
let s:marker_marks.head       = ["#", "-", "="]
let s:marker_marks.quote      = [">"]
let s:marker_marks.bullet     = ["*", "1.", "-", "+"]
let s:marker_marks.definition = [":"]

" Set global variables to defaults if not set.
function! s:SetGlobal(config, default)
  let g = "g:marker_" . a:config
  if !exists(g)
    exe "let " . g . "=" . a:default
  elseif exists(g)
    let val = echo g
    if val > len(marker_marks[a:config])
      exe "let " . g . "=" . a:default
    endif
  endif
endfunction

" Set default values.
for item in keys(s:marker_marks)
  call s:SetGlobal(item, 0)
endfor

function! s:List(n) abort 
  let l:bullet = s:marker_marks.bullet[g:marker_bullet]
  let l:lst = []
  let l:n = str2nr(a:n)
  while l:n != 0
    if l:bullet == ':'
      let l:lst = add(l:lst, " ")
      let l:lst = add(l:lst, l:bullet) 
    else 
      let l:lst = add(l:lst, l:bullet)
    endif
    let l:n = l:n - 1
  endwhile
  call append(line('$'), l:lst) 
endfunction

" TODO: Instead of expand, get the current character and read until
" whitespace is encountered.

function! s:Insert(mark) abort
  let l:word = expand('<cword>')
  let l:words = split(getline("."))
  let l:marked_word = a:mark . l:word . a:mark
  let l:idx = match(l:words, l:word)
  let l:words[l:idx] = l:marked_word
  call setline(".", join(l:words))
endfunction

function! s:Prefix(mark) abort
  let l:line = getline(".")
  let l:line = a:mark . " " . l:line
  call setline(".", l:line)
endfunction

function! s:Link(image) abort
  let l:word = expand('<cword>')
  let l:words = split(getline("."))
  if a:image 
    let l:marked_word = "![" . l:word . "]()"
  else 
    let l:marked_word = "[" . l:word . "]()"
  endif
  let l:idx = match(l:words, l:word)
  let l:words[l:idx] = l:marked_word
  call setline(".", join(l:words))
endfunction

let s:marker_fs            = {}
let s:marker_fs.bold       = function("s:Insert", [s:marker_marks.bold[g:marker_bold]])
let s:marker_fs.ital       = function("s:Insert", [s:marker_marks.ital[g:marker_ital]])
let s:marker_fs.code       = function("s:Insert", [s:marker_marks.code[g:marker_code]])
let s:marker_fs.head       = function("s:Prefix", [s:marker_marks.head[g:marker_head]])
let s:marker_fs.quote      = function("s:Prefix", [s:marker_marks.quote[g:marker_quote]])
let s:marker_fs.bullet     = function("s:List")
let s:marker_fs.definition = function("s:List")
let s:marker_fs.link       = function("s:Link", [0])
let s:marker_fs.image      = function("s:Link", [1])

function! marker#Mark(mark, ...) abort
  if a:0 >= 1
    call s:marker_fs[a:mark](a:1)
  else
    call s:marker_fs[a:mark]()
  endif
endfunction

