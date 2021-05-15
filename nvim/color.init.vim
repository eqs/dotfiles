colorscheme molokai

" 改行とかタブとかを表示する
set list
set listchars=eol:$,tab:>\ ,trail:_,extends:<

"全角スペースを表示する
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

"アンダーラインを引く
set cursorline
highlight CursorLine gui=underline guifg=NONE guibg=NONE

" 80文字目に線をいれる
set colorcolumn=80

" フォントの設定
set guifont=MigMix\ 1M:h12

"メニューを英語にする
source $VIMRUNTIME/delmenu.vim
"set langmenu=ja_jp.utf-8
set langmenu=none
source $VIMRUNTIME/menu.vim
if has("multi_lang")
    language C
endif

" マウスの設定
set mouse=ar
set mousemodel=popup

