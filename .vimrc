
"ã¨ã³ã³ã¼ã?ã£ã³ã°æ?å®?
set encoding=utf-8

"ã¿ã¼ããã«ã§ã®ã¨ã³ã³ã¼ã?ã£ã³ã°
set termencoding=cp932

"ã¿ãå¹?ã®è¨­å®?
set shiftwidth=4
set tabstop=4
"ã©ãã§æ¹è¡ããã
set whichwrap=b,s,h,l,<,>,[,]
"ãªã¼ãã¤ã³ã?ã³ã?
set autoindent
"è¡çªå·è¡¨ç¤º
set number
"æ¤ç´¢çµæãè¦ãããã?ã«ãã
set showmatch
"ã·ã³ã¿ã?ã¯ã¹
syntax on
"ã¿ããè³¢ããã?
set smarttab
"ã¿ãæå­ãå±éãã
"set expandtab
"backspaceã®æåãæ®éã?®ã¨ã?ã£ã¿ã¨åãã«ãã
set backspace=start,eol,indent

"æ­£è¦è¡¨ç¾ãVery Magicã«
nnoremap / /\v

if has("win64")
	"ãã©ã³ãã?®è¨­å®?
	set guifont=Osaka?¼ç­å¹?\ ã¬ã®ã¥ã©ã¼?¼ç­å¹?:h12:cSHIFTJIS
	let s:using_font= 'Osaka' . "\x81\x7c\x93\x99\x95\x9d"
	let &guifont=s:using_font . ':h12:cSHIFTJIS'
	unlet s:using_font
endif

autocmd BufNewFile *.py 0r ~/dotfiles/templates/python.txt

