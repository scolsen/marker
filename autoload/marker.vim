  let s:marker_marks = {'bold': '**', 'ital': '*', 'code': '`', 'under': '_'}
  let s:marker_fixes = {'head': '#', 'quote': '>',} 
  let s:bullets = {'asterisk': '*', 'number': '1.', 'dash': '-', 'definition': ':', 'plus': '+'} 

  function! marker#MakeList(bullet, n) abort 
    let l:bullet = s:bullets[a:bullet]
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
  
  function! marker#Insert(mark_key) abort
    let l:mark = s:marker_marks[a:mark_key]
    let l:word = expand('<cword>')
    let l:words = split(getline("."))
    let l:marked_word = l:mark . l:word . l:mark
    let l:idx = match(l:words, l:word)
    let l:words[l:idx] = l:marked_word
    call setline(".", join(l:words))
  endfunction

  function! marker#Prefix(mark_key) abort
    let l:mark = s:marker_fixes[a:mark_key]
    let l:line = getline(".")
    let l:line = l:mark . " " . l:line
    call setline(".", l:line)
  endfunction

  function! marker#Link(image) abort
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
