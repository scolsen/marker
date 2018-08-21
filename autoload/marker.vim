function! marker#MakeList(bullet ,number) abort 
  let lst = [bullet]
  while number != 0
    let lst = add(lst, bullet)
  endwhile
  append(line('$'), lst) 
endfunction
