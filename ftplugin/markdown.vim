" Enable syntax folding.
" For now, we leverage vim's default markdown support.
" In the future, possibly reimplement folding for backwards compatibility.
setlocal foldexpr=MarkdownFold()
setlocal foldmethod=expr
setlocal foldtext=MarkdownFoldText()
