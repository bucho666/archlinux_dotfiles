"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 基本設定
set autoindent "改行時に前の行のインデントを継続する
set backspace=start,eol,indent
set shiftwidth=2 "自動インデントでずれる幅
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデント
set softtabstop=2 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set tabstop=2 "画面上でタブ文字が占める幅
set expandtab "タブ入力を複数の空白入力に置き換える
set autochdir "自動で開いているファイルのディレクトリをカレントにする
" viminfo
set viminfo='100,<1000,s10,h
" タブと行末半角スペースを強調する
highlight TabSpace ctermbg=DarkBlue
match TabSpace /\t\|\s\+$/
"ファイルを開いた際に、前回のカーソル位置に移動する。
autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
" Windowを縦分割
nmap \| :vsplit<CR>
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" terminalはinsertモードで開始
autocmd TermOpen * startinsert

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 開いているスクリプトを実行
" s:はこのスクリプト内のみのスコープ
function! s:ExecThis()
  " expand("%:e")は拡張子
  :if expand("%:e") == "nim"
    :execute "!nim c -r %"
  :else
    " %ftは開いているファイルのタイプ、pythonやperlなどはこれでＯＫ
    :execute "terminal " . &ft . " %"
  :endif
:endfunction

" mapでキーバインド(normal,コマンドモードの両方で有効)
" <silent>はコマンド行に文字列を表示させない
" <C-P>はCtrl+p
" <SID>はこのスクリプト内の関数を表す(s:で定義しているので、外部から呼べない)
" <CR>はReturnキー、入れないとコマンドバッファに入力されて実行はされない。
map <silent> <C-p> :call <SID>ExecThis()<CR>
map <silent> <C-r> :!npm test<CR>
" terminalでもEscでinsertを抜ける
tnoremap <silent> <ESC> <C-\><C-n>

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/bucho/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/bucho/.cache/dein')
  call dein#begin('/home/bucho/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/bucho/.cache/dein/repos/github.com/Shougo/dein.vim')
  " add on toml
  call dein#load_toml('/home/bucho/.cache/dein/dein.toml')
  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------
