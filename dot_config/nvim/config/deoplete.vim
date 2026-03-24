" enable deoplete
let g:deoplete#enable_at_startup = 1
" set the default number of the input completion at the time of key input automatically.
call deoplete#custom#option('min_pattern_length', 3)
" <TAB>: complete.
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
