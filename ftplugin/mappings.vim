let [s:plugin, s:enter] = maktaba#plugin#Enter(expand('<s:file>:p'))
if !s:enter
  finish
endif

execute 'nnoremap <unique> <silent> <buffer> <localleader>* :call marker#Mark("ital")<cr>'
execute 'nnoremap <unique> <silent> <buffer> <localleader>` :call marker#Mark("code")<cr>'
execute 'nnoremap <unique> <silent> <buffer> <localleader>> :call marker#Mark("quote")<cr>'
execute 'nnoremap <unique> <silent> <buffer> <localleader># :call marker#Mark("head")<cr>'
execute 'nnoremap <unique> <silent> <buffer> <localleader>[ :call marker#Mark("link")<cr>'
execute 'nnoremap <unique> <silent> <buffer> <localleader>! :call marker#Mark("image")<cr>'

execute 'nnoremap <unique> <silent> <buffer> <localleader>i :call marker#Mark("ital")<cr>'
execute 'nnoremap <unique> <silent> <buffer> <localleader>b :call marker#Mark("bold")<cr>'
execute 'nnoremap <unique> <silent> <buffer> <localleader>c :call marker#Mark("code")<cr>'
execute 'nnoremap <unique> <silent> <buffer> <localleader>h :call marker#Mark("head")<cr>'
execute 'nnoremap <unique> <silent> <buffer> <localleader>q :call marker#Mark("quote")<cr>'
execute 'nnoremap <unique> <silent> <buffer> <localleader>- :call marker#Mark("rule")<cr>'
execute 'nnoremap <unique> <silent> <buffer> <localleader>~ :call marker#Mark("block")<cr>'
execute 'nnoremap <unique> <silent> <buffer> <localleader>l :<C-U>call marker#Mark("bullet", v:count1)<cr>'

execute 'nnoremap <unique> <silent> <buffer> <localleader>1 i#<esc>a<space>'
execute 'nnoremap <unique> <silent> <buffer> <localleader>2 2i#<esc>a<space>'
execute 'nnoremap <unique> <silent> <buffer> <localleader>3 3i#<esc>a<space>'
execute 'nnoremap <unique> <silent> <buffer> <localleader>4 4i#<esc>a<space>'
execute 'nnoremap <unique> <silent> <buffer> <localleader>5 5i#<esc>a<space>'
execute 'nnoremap <unique> <silent> <buffer> <localleader>6 6i#<esc>a<space>'

execute 'vnoremap <unique> <silent> <buffer> <localleader>* <esc>`>a*<esc>`<i*<esc>gv2l'
execute 'vnoremap <unique> <silent> <buffer> <localleader>_ <esc>`>a_<esc>`<i_<esc>gv2l'
execute 'vnoremap <unique> <silent> <buffer> <localleader>` <esc>`>a`<esc>`<i`<esc>gv2l'
execute 'vnoremap <unique> <silent> <buffer> <localleader>[ <esc>`>a]()<esc>`<i[<esc>gv2l'
