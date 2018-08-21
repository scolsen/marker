nnoremap <localleader>* i*<esc>ea*<esc>
nnoremap <localleader>i i*<esc>ea*<esc>
nnoremap <localleader>b i**<esc>ea**<esc>
nnoremap <localleader>_ i_<esc>ea_<esc>
nnoremap <localleader>` i`<esc>ea`<esc>
nnoremap <localleader>c i`<esc>ea`<esc>
nnoremap <localleader>[ i[<esc>ea]()<esc>
nnoremap <localleader>> 0i> <esc>
nnoremap <localleader>- i---<CR><CR>---<esc>ki
nnoremap <localleader># i#<esc>a<space>
nnoremap <localleader>1 i#<esc>a<space>
nnoremap <localleader>2 2i#<esc>a<space>
nnoremap <localleader>3 3i#<esc>a<space>
nnoremap <localleader>4 4i#<esc>a<space>
nnoremap <localleader>5 5i#<esc>a<space>
nnoremap <localleader>6 6i#<esc>a<space>

vnoremap <localleader>* <esc>`>a*<esc>`<i*<esc>gv2l
vnoremap <localleader>_ <esc>`>a_<esc>`<i_<esc>gv2l
vnoremap <localleader>` <esc>`>a`<esc>`<i`<esc>gv2l
vnoremap <localleader>[ <esc>`>a]()<esc>`<i[<esc>gv2l

command! -nargs=? L* call marker#MakeList("*" ,<f-args>)


