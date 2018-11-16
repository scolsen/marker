let s:plugin = maktaba#plugin#Get('marker')

let s:marker_fs            = {}
let s:marker_fs.bold       = function("s:Insert", [s:plugin.Flag('active[bold]')])
let s:marker_fs.ital       = function("s:Insert", [s:plugin.Flag('active[ital]')])
let s:marker_fs.code       = function("s:Insert", [s:plugin.Flag('active[code]')])
let s:marker_fs.head       = function("s:Prefix", [s:plugin.Flag('actie[head]')])
let s:marker_fs.quote      = function("s:Prefix", [s:plugin.Flag('active[quote]')])
let s:marker_fs.bullet     = function("s:List")
let s:marker_fs.definition = function("s:List")
let s:marker_fs.link       = function("s:Link", [0])
let s:marker_fs.image      = function("s:Link", [1])
let s:marker_fs.rule       = function("s:Triple", [s:plugin.Flag('active[rule]')])
let s:marker_fs.block      = function("s:Block", [s:plugin.Flag('active[block]')])

function! marker#Mark(mark, ...) abort
  if a:0 >= 1
    call s:marker_fs[a:mark](a:1)
  else
    call s:marker_fs[a:mark]()
  endif
endfunction

function! s:List(n) abort 
  let l:bullet = s:plugin.Flag('bullet')
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

function! s:Triple(mark) abort
  call append(line("$"), [" ", a:mark, " "])
endfunction

function! s:Block(mark, ...) abort
  if a:0 >= 1 && strlen(a:1)
    let l:str = a:mark . a:1 
  else
    let l:str = a:mark
  endif
  call append(line("$"), [" ", l:str, " ", a:mark])
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

