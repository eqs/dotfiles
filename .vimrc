
"エンコーディング指定
set encoding=utf-8

"ターミナルでのエンコーディング
set termencoding=cp932

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
"set expandtab
"backspaceの挙動を普通のエディタと同じにする
set backspace=start,eol,indent

"正規表現をVery Magicに
nnoremap / /\v

"フォントの設定
set guifont=Osaka－等幅\ レギュラー－等幅:h12:cSHIFTJIS
let s:using_font= 'Osaka' . "\x81\x7c\x93\x99\x95\x9d"
let &guifont=s:using_font . ':h12:cSHIFTJIS'
unlet s:using_font

autocmd BufNewFile *.py 0r ~/dotfiles/templates/python.txt

