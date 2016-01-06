
if has('vim_starting')
    if &compatible
        set nocompatible
    endif
    " neobundleがなければ自動インストール
    if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
        echo "installing neobundle ... "
        :call system("git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
    endif

    set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))

"Bundles
NeoBundle 'sophacles/vim-processing'
NeoBundleLazy 'hynek/vim-python-pep8-indent', {"autoload" : {"filetypes" : ['python', 'python3']}}

call neobundle#end()

filetype plugin indent on

let g:tex_flavor = 'tex'

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
"beep音を切る，画面フラッシュも消す
set vb t_vb=

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

" sは使わない
nnoremap s <Nop>

"カラースキーマを変える
colorscheme desert

"現在の時刻を入力する
inoremap <expr> <C-x>date strftime("%c")

"command Puttime "=strftime("%c")

" 印刷の設定
set printheader=%t\ Page\ %N\ (%{strftime('%c')})%=
set printoptions=wrap:y,number:y

"タブをスペース展開しない
autocmd FileType tex,java,c,cs,cpp,h,hpp set noexpandtab

"Makefileではタブをスペース展開しない
autocmd FileType make set noexpandtab

"全角スペースを表示する
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

"括弧の自動補完
"autocmd FileType tex inoremap { {}<LEFT>
"autocmd FileType tex inoremap } <RIGHT>
"autocmd FileType tex inoremap [ []<LEFT>
"autocmd FileType tex inoremap ] <RIGHT>
"autocmd FileType tex inoremap \\[ \\[\\]<LEFT><LEFT>
"autocmd FileType tex inoremap \\] <RIGHT><RIGHT>
"autocmd FileType python inoremap ( ()<LEFT>
"autocmd FileType python inoremap ) <RIGHT>
"autocmd FileType python inoremap { {}<LEFT>
"autocmd FileType python inoremap } <RIGHT>
"autocmd FileType python inoremap [ []<LEFT>
"autocmd FileType python inoremap ] <RIGHT>
"autocmd FileType c,java inoremap ( ()<LEFT>
"autocmd FileType c,java inoremap ) <RIGHT>
"autocmd FileType c,java inoremap " ""<LEFT>
"autocmd FileType c,java inoremap ' ''<LEFT>
