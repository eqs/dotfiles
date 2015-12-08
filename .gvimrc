if has("win32")
	"フォントの設定
	set guifont=Osaka－等幅:h12:cSHIFTJIS
	"let s:using_font= 'Osaka' . "\x81\x7c\x93\x99\x95\x9d"
	"let &guifont=s:using_font . ':h12:cSHIFTJIS'
	"unlet s:using_font
endif

"カラースキーマを変える
colorscheme desert

"ツールバーを消す
set guioptions-=T
"メニューバーを消す
set guioptions-=m
"メニューバーを消す
set guioptions-=r
"画面をでかくする
"set lines=90 columns=200

"アンダーラインを引く
set cursorline
highlight CursorLine gui=underline guifg=NONE guibg=NONE
