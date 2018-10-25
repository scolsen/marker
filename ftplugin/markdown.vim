nnoremap <silent> <buffer> <localleader>* :call marker#Mark('ital')<cr>
nnoremap <silent> <buffer> <localleader>` :call marker#Mark('code')<cr>
nnoremap <silent> <buffer> <localleader>> :call marker#Mark('quote')<cr>
nnoremap <silent> <buffer> <localleader># :call marker#Mark('head')<cr>
nnoremap <silent> <buffer> <localleader>[ :call marker#Mark('link')<cr>
nnoremap <silent> <buffer> <localleader>! :call marker#Mark('image')<cr>

nnoremap <silent> <buffer> <localleader>i :call marker#Mark('ital')<cr>
nnoremap <silent> <buffer> <localleader>b :call marker#Mark('bold')<cr>
nnoremap <silent> <buffer> <localleader>c :call marker#Mark('code')<cr>
nnoremap <silent> <buffer> <localleader>h :call marker#Mark('head')<cr>
nnoremap <silent> <buffer> <localleader>q :call marker#Mark('quote')<cr>
nnoremap <silent> <buffer> <localleader>- :call marker#Mark('rule')<cr>
nnoremap <silent> <buffer> <localleader>~ :call marker#Mark('block')<cr>
nnoremap <silent> <buffer> <localleader>l :<C-U>call marker#Mark('bullet', v:count1)<cr>

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

command! -nargs=? MarkerList call marker#Mark('bullet' ,<f-args>)
command! -nargs=? MarkerL call marker#Mark('bullet' ,<f-args>)
command! -nargs=? MarkerBlock call marker#Mark('block' ,<f-args>)

" Enable syntax folding.
" For now, we leverage vim's default markdown support.
" In the future, possibly reimplement folding for backwards compatibility.
setlocal foldexpr=MarkdownFold()
setlocal foldmethod=expr
setlocal foldtext=MarkdownFoldText()
