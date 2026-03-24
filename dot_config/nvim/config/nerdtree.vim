" Open outomatically NERDTree when vim starts up if no files were specified.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"function! s:NERDTreeOnEnter()
"  if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in")
"    exe 'NERDTree' argv()[0]
"    wincmd p
"    ene
"    exe 'cd '.argv()[0]
"  endif
"endfunction
"autocmd VimEnter * call s:NERDTreeOnEnter

" Can open NEROTree with ctrl+n
nnoremap <LEADER>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeFocus<CR>

let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeShowHidden = 1

