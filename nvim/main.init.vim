"エンコーディング指定
set encoding=utf-8

"標準でIMEをオフにする (起動時のデフォルトを全角入力にしない)
set iminsert=0
set imsearch=-1

"クリップボード
set clipboard=unnamed

"タブ幅の設定
set shiftwidth=4
set tabstop=4
"どこで改行するか
set whichwrap=b,s,h,l,<,>,[,]
"オートインデント
set autoindent
"行番号表示
set number
"括弧の対応をハイライトする
set showmatch
"シンタックス
syntax on
"タブを賢くする
set smarttab
"タブ文字を展開する
set expandtab
"backspaceの挙動を普通のエディタと同じにする
set backspace=start,eol,indent
"beep音を切る，画面フラッシュも消す
set vb t_vb=


"ファイルツリーに関する設定

"上に出てくる表示を消す
let g:netrw_banner = 0
"Treeview
let g:netrw_liststyle = 3
"左右分割を右側に開く
let g:netrw_altv = 1
"サイズを85%に
let g:netrw_winsize = 85

"Ctrl-vの矩形選択で，行末より後ろにカーソルを置ける
set virtualedit=block

"スクロール時の余白
set scrolloff=3

"バックアップ無し
set nobackup
"swpファイル無し
set noswapfile
"自動再読み込み
set autoread
"Undoファイルの場所を変更する
set undodir=~/.vim/undotmp

"タブをスペース展開しない
autocmd FileType tex,java set noexpandtab

"Makefileではタブをスペース展開しない
autocmd FileType make set noexpandtab

"xmlではタブ幅を2文字にする
autocmd FileType xml set tabstop=2
autocmd FileType xml set shiftwidth=2

" reStructuredTextではタブ幅を3文字にする
autocmd FileType rst set tabstop=3
autocmd FileType rst set shiftwidth=3

"TypeScriptではタブ幅を2文字にする
autocmd BufRead,BufNewFile *.ts set filetype=typescript
autocmd FileType typescript set tabstop=2
autocmd FileType typescript set shiftwidth=2
autocmd FileType typescript set expandtab

"JavaScriptではタブ幅を2文字にする
autocmd BufRead,BufNewFile *.js set filetype=javascript
autocmd FileType javascript set tabstop=2
autocmd FileType javascript set shiftwidth=2
autocmd FileType javascript set expandtab

"React TypeScriptではタブ幅を2文字にする
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
autocmd FileType typescriptreact set tabstop=2
autocmd FileType typescriptreact set shiftwidth=2
autocmd FileType typescriptreact set expandtab

"css
autocmd BufRead,BufNewFile *.css set filetype=css
autocmd FileType css set tabstop=2
autocmd FileType css set shiftwidth=2
autocmd FileType css set expandtab

" ##########################################################################

"正規表現をVery Magicに
nnoremap / /\v

" TABキーで対応ペアにジャンプする
nnoremap <Tab> %
vnoremap <Tab> %

" 折り返されたテキストの上でいい感じに動く
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
" Ctrl + hjklでウインドウを移動する
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"Insertモード中でもhjklで移動する
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
" sは使わない
nnoremap s <Nop>
" Window自体の移動
nnoremap sj <C-w>J
nnoremap sk <C-w>K
nnoremap sh <C-w>H
nnoremap sl <C-w>L
nnoremap sr <C-w>L
" ^と$をSpace+hとSpace+lに割り当てる
noremap <Space>h ^
noremap <Space>l $
" カンマの後ろにスペースを入れる
" inoremap , ,<Space>

" ファイルの情報を表示
nnoremap <C-g> 1<C-g>

" vを2回たたくと行末まで選択する
vnoremap v $h

"現在の時刻を入力する
inoremap <expr> <C-x>date strftime("%c")

" タブとウインドウ関連の設定
" 垂直分割
nnoremap ww :<C-u>vs<CR>
" 水平分割
nnoremap wh :<C-u>sp<CR>
" 新しいタブ
nnoremap tt :<C-u>tabnew<CR>
" 次のタブ
nnoremap tn gt
" 前のタブ
nnoremap tp gT

" convert punctuation marks
nnoremap <Leader>cp :%s/、/，/ge<CR>:%s/。/．/ge<CR>
vnoremap <Leader>cp :s/、/，/ge<CR>gv:s/。/．/ge<CR>

nnoremap <Leader>ip :%s/，/、/ge<CR>:%s/．/。/ge<CR>
vnoremap <Leader>ip :s/，/、/ge<CR>gv:s/．/。/ge<CR>

" ##########################################################################

" 印刷の設定
" set printheader=%t\ Page\ %N\ (%{strftime('%c')})%=
" set printoptions=wrap:y,number:y
" set printfont=MigMix\ 1M:h12

command Hardcopy call Hardcopy()
function! Hardcopy()
    let colors_save = g:colors_name
    colorscheme default
    hardcopy
    execute 'colorscheme' colors_save
endfun

