
"------------------------------------------------------------------------------
" neocomplete 
setlocal omnifunc=pythoncomplete#Complete

"------------------------------------------------------------------------------
" jedi-vim

" 補完で次の候補に進むときにtabを使えるという設定にしたつもりですができませんでした。
let g:jedi#use_tabs_not_buffers = 1 
" 自動入力しない
let g:jedi#popup_select_first = 0
" .を入力すると補完が始まるという設定を解除
let g:jedi#popup_on_dot = 0
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
"quick-runと競合しないように大文字Rに変更. READMEだと<leader>r
let g:jedi#rename_command = "<leader>R"

" not using popup
setlocal completeopt-=preview

"------------------------------------------------------------------------------
" syntax
"" using \t     :  no
"" indent width :   4
set expandtab
set tabstop=4
set shiftwidth=4

