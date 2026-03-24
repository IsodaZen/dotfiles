" 設定ファイルはconfig/ディレクトリに配置
let s:COMF_DIR = expand('<sfile>:p:h').'/config'

"------------------------------------------------------------------------------
" <LEADER> KEY設定
let mapleader = " "
"------------------------------------------------------------------------------
" dein.vim
execute 'source '.s:COMF_DIR.'/dein.vim'
"------------------------------------------------------------------------------
" color
execute 'source '.s:COMF_DIR.'/color.vim'

"------------------------------------------------------------------------------
" 折りたたみ設定
set foldmethod=indent
set foldopen=block,hor,mark,percent,quickfix,search,tag,undo
"set foldclose=all
set foldminlines=2

"------------------------------------------------------------------------------
" キーマップ設定
"" jjで挿入モードから抜ける設定
inoremap <silent> jj <ESC>
"" ; で文末ジャンプ
nnoremap <silent> ; $
"" U で行結合
nnoremap <silent> U J
"" J で文頭
nnoremap <silent> J 0
"" zz で折りたたみを全階層トグル
nnoremap <silent> zz zA

nnoremap <silent> ,k :cprevious<CR>
nnoremap <silent> ,j :cnext<CR>
nnoremap <silent> ,h :<C-u>cfirst<CR>
nnoremap <silent> ,l :<C-u>clast<CR>

"------------------------------------------------------------------------------
" <TAB> KEY設定 (default)
"" using \t     :  no
"" indent width :   4
set expandtab
set tabstop=2
set shiftwidth=2

"------------------------------------------------------------------------------
" <backspace>
"set backspace=indent,eol,start
set backspace=2

"------------------------------------------------------------------------------
" 長い行を折り返さない
set nowrap

"------------------------------------------------------------------------------
" モードラインの有効化
set modeline

"------------------------------------------------------------------------------
" マウス選択で、ビジュアルモードに入らない
set mouse=

"------------------------------------------------------------------------------
" 0から始まる文字列も10進数で扱う
set nrformats=hex

"------------------------------------------------------------------------------
" ファイルタイプ設定
autocmd BufNewFile,BufRead *.uml  set filetype=plantuml

"------------------------------------------------------------------------------
" ファイルタイプに応じた設定を読み込み
augroup FileTypes
  autocmd!
  autocmd FileType javascript execute 'source '.s:COMF_DIR.'javascript.vim'
  autocmd FileType json       execute 'source '.s:COMF_DIR.'json.vim'
  autocmd FileType groovy     execute 'source '.s:COMF_DIR.'groovy.vim'
  autocmd FileType php        execute 'source '.s:COMF_DIR.'php.vim'
  autocmd FileType python     execute 'source '.s:COMF_DIR.'python.vim'
augroup END


"------------------------------------------------------------------------------
" vimgrep 関連
autocmd QuickFixCmdPost *grep* cwindow
