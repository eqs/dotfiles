if has("win64")
	let &guifont=iconv('Osaka－等幅:h12:cSHIFTJIS', &encoding, 'cp932')
endif

"ツールバーを消す
set guioptions-=T
"画面をでかくする
"set lines=90 columns=200

"ウインドウを半透明にしたい
"autocmd GUIEnter * set transparency=128
