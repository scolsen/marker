let [s:plugin, s:enter] = maktaba#plugin#Enter(expand('<sfile>:p'))
if !s:enter
  finish
endif

function! s:SelectFlavor(flavor)
  maktaba#ensure#IsIn(a:flavor, s:plugin.Flag('flavor')) 
  call s:plugin.Flag('active', s:plugin.Flag(a:flavor))
endfunction

call s:plugin.Flag('flavor', ['commonmark', 'gfm'])
call s:plugin.Flag('flavor').AddCallback('s:SelectFlavor')

call s:plugin.Flag('commonmark', {
  'bold': '**',
  'ital': '*',
  'code': '`',
  'head': '#',
  'quote': '>',
  'bullet': '-',
  'def': ':',
  'rule': '---',
  'block': '```'
  })

call s:plugin.Flag('gfm', {
  'bold': '**',
  'ital': '*',
  'code': '`',
  'head': '#',
  'quote': '>',
  'bullet': '-',
  'def': ':',
  'rule': '---',
  'block': '```',
  'task': '- [ ]',
  'strike': '~~'
  })
