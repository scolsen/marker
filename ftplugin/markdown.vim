nnoremap <silent> <buffer> <localleader>* :call marker#Insert('ital')<cr>
nnoremap <silent> <buffer> <localleader>` :call marker#Insert('code')<cr>
nnoremap <silent> <buffer> <localleader>_ :call marker#Insert('under')<cr>
nnoremap <silent> <buffer> <localleader>> :call marker#Prefix('quote')<cr>
nnoremap <silent> <buffer> <localleader># :call marker#Prefix('head')<cr>
nnoremap <silent> <buffer> <localleader>[ :call marker#Link(0)<cr>
nnoremap <silent> <buffer> <localleader>! :call marker#Link(1)<cr>

nnoremap <silent> <buffer> <localleader>i :call marker#Insert('ital')<cr>
nnoremap <silent> <buffer> <localleader>b :call marker#Insert('bold')<cr>
nnoremap <silent> <buffer> <localleader>c :call marker#Insert('code')<cr>
nnoremap <silent> <buffer> <localleader>u :call marker#Insert('under')<cr>
nnoremap <silent> <buffer> <localleader>h :call marker#Prefix('head')<cr>
nnoremap <silent> <buffer> <localleader>q :call marker#Prefix('quote')<cr>

nnoremap <silent> <buffer> <localleader>l :<C-U>call marker#MakeList('asterisk', v:count1)<cr>
nnoremap <silent> <buffer> <localleader>+ :<C-U>call marker#MakeList('plus', v:count1)<cr>
nnoremap <silent> <buffer> <localleader>- :<C-U>call marker#MakeList('dash', v:count1)<cr>
nnoremap <silent> <buffer> <localleader>: :<C-U>call marker#MakeList('definition', v:count1)<cr>

nnoremap <buffer> <localleader>1 i#<esc>a<space>
nnoremap <buffer> <localleader>2 2i#<esc>a<space>
nnoremap <buffer> <localleader>3 3i#<esc>a<space>
nnoremap <buffer> <localleader>4 4i#<esc>a<space>
nnoremap <buffer> <localleader>5 5i#<esc>a<space>
nnoremap <buffer> <localleader>6 6i#<esc>a<space>

vnoremap <buffer> <localleader>* <esc>`>a*<esc>`<i*<esc>gv2l
vnoremap <buffer> <localleader>_ <esc>`>a_<esc>`<i_<esc>gv2l
vnoremap <buffer> <localleader>` <esc>`>a`<esc>`<i`<esc>gv2l
vnoremap <buffer> <localleader>[ <esc>`>a]()<esc>`<i[<esc>gv2l

command! -nargs=? MarkerList call marker#MakeList('asterisk' ,<f-args>)

command! -nargs=? MarkerL call marker#MakeList('asterisk' ,<f-args>)
