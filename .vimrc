
"エンコー�?ィング�?�?
set encoding=utf-8

"ターミナルでのエンコー�?ィング
set termencoding=cp932

"タブ�?の設�?
set shiftwidth=4
set tabstop=4
"どこで改行するか
set whichwrap=b,s,h,l,<,>,[,]
"オートイン�?ン�?
set autoindent
"行番号表示
set number
"検索結果を見えるよ�?にする
set showmatch
"シンタ�?クス
syntax on
"タブを賢くす�?
set smarttab
"タブ文字を展開する
"set expandtab
"backspaceの挙動を普通�?�エ�?ィタと同じにする
set backspace=start,eol,indent

"正規表現をVery Magicに
nnoremap / /\v

if has("win64")
	"フォント�?�設�?
	set guifont=Osaka?��等�?\ レギュラー?��等�?:h12:cSHIFTJIS
	let s:using_font= 'Osaka' . "\x81\x7c\x93\x99\x95\x9d"
	let &guifont=s:using_font . ':h12:cSHIFTJIS'
	unlet s:using_font
endif

autocmd BufNewFile *.py 0r ~/dotfiles/templates/python.txt

