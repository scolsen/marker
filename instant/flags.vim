let [s:plugin, s:enter] = maktaba#plugin#Enter(expand('<sfile>:p'))
if !s:enter
  finish
endif

call s:plugin.Flag('bold', '**')
call s:plugin.Flag('ital', '*')
call s:plugin.Flag('code', '`')
call s:plugin.Flag('head', '#')
call s:plugin.Flag('quote', '>')
call s:plugin.Flag('bullet', '-')
call s:plugin.Flag('definition', ':')
call s:plugin.Flag('rule', '---')
call s:plugin.Flag('block', '```')
