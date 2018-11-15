let [s:plugin, s:enter] = maktaba#plugin#Enter(expand('<sfile>:p'))
if !s:enter
  finish
endif

command! -nargs=? MarkerList call marker#Mark('bullet' ,<f-args>)
command! -nargs=? MarkerBlock call marker#Mark('block' ,<f-args>)
