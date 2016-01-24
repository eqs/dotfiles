if has("win32")
	"フォントの設定
	set guifont=MigMix\ 1M:h12
	"set guifont=Osaka－等幅:h12:cSHIFTJIS
	"let s:using_font= 'Osaka' . "\x81\x7c\x93\x99\x95\x9d"
	"let &guifont=s:using_font . ':h12:cSHIFTJIS'
	"unlet s:using_font
endif

"メニューを英語にする
source $VIMRUNTIME/delmenu.vim
"set langmenu=ja_jp.utf-8
set langmenu=none
source $VIMRUNTIME/menu.vim
if has("multi_lang")
language C
endif

"カラースキーマを変える
colorscheme desert

"ツールバーを消す
set guioptions-=T
"メニューバーを消す
set guioptions-=m
"スクロールバーを消す
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b
"画面をでかくする
"set lines=90 columns=200

"アンダーラインを引く
set cursorline
highlight CursorLine gui=underline guifg=NONE guibg=NONE

"全角スペースを表示する
highlight ZenkakuSpace gui=underline guifg=lightblue guibg=darkgray
match ZenkakuSpace /　/

"beep音を切る，画面フラッシュも消す
set vb t_vb=

au GUIEnter * simalt ~x
