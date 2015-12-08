
"エンコーディング指定
set encoding=utf-8

if has("win64")
	"ターミナルでのエンコーディング
	set termencoding=cp932
endif

"タブ幅の設定
set shiftwidth=4
set tabstop=4
"どこで改行するか
set whichwrap=b,s,h,l,<,>,[,]
"オートインデント
set autoindent
"行番号表示
set number
"検索結果を見えるようにする
set showmatch
"シンタックス
syntax on
"タブを賢くする
set smarttab
"タブ文字を展開する
set expandtab
"backspaceの挙動を普通のエディタと同じにする
set backspace=start,eol,indent

"Ctrl-vの矩形選択で，行末より後ろにカーソルを置ける
set virtualedit=block

"アンダーラインを引く
set cursorline
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE

"正規表現をVery Magicに
nnoremap / /\v

if has("win32")
	"フォントの設定
	set guifont=Osaka－等幅\ レギュラー－等幅:h12:cSHIFTJIS
	let s:using_font= 'Osaka' . "\x81\x7c\x93\x99\x95\x9d"
	let &guifont=s:using_font . ':h12:cSHIFTJIS'
	unlet s:using_font
	"標準でIMEをオフにする (起動時のデフォルトを全角入力にしない)
	set iminsert=0
	set imsearch=-1
endif

"Pythonファイルを作るときはテンプレートを挿入
autocmd BufNewFile *.py 0r ~/dotfiles/templates/python.txt
"LaTeXファイルを作るときはテンプレートを挿入
autocmd BufNewFile *.tex 0r ~/dotfiles/templates/latex.txt

" 改行とかタブとかを表示する
set list
set listchars=eol:$,tab:>\ ,trail:-,extends:<

" 折り返されたテキストの上でいい感じに動く
nnoremap j gj
nnoremap k gk
" Ctrl + hjklでウインドウを移動する
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"カラースキーマを変える
colorscheme desert

"現在の時刻を入力する
inoremap <expr> <C-x>date strftime("%c")

"command Puttime "=strftime("%c")

" 印刷の設定
set printheader=%t\ Page\ %N\ (%{strftime('%c')})%=
set printoptions=wrap:y,number:y

