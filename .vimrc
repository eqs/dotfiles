
if has('vim_starting')
    if &compatible
        set nocompatible
    endif
    " neobundleがなければ自動インストール
    if !isdirectory(expand("~/.vim/bundle/neobundle.vim"))
        echo "installing neobundle ... "
        :call system("git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
    endif

    set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))

"Bundles
NeoBundle 'sophacles/vim-processing'
NeoBundleLazy 'hynek/vim-python-pep8-indent', {"autoload" : {"filetypes" : ['python', 'python3']}}
NeoBundle 'lambdalisue/vim-fullscreen'
"NeoBundle 'ivanov/vim-ipython'
"NeoBundle 'Shougo/vimproc.vim', {'build' : {'windows' : 'make -f make_mingw32.mak', 'cygwin' : 'make -f make_cygwin.mak', 'mac' : 'make', 'linux' : 'make', 'unix' : 'gmake'}}
"NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'chrisbra/csv.vim'
NeoBundleLazy 'lambdalisue/vim-gista', {
            \ 'autoload': {
            \   'commands': ['Gista'],
            \   'mappings': '<Plug>(gista-',
            \   'unite_sources': 'gista',
            \}}

NeoBundle 'zah/nimrod.vim'

call neobundle#end()

filetype plugin indent on

"vim-gistaで使うユーザネーム
let g:gista#client#default_username = 'eqs'

let g:tex_flavor = 'tex'

"エンコーディング指定
set encoding=utf-8

if has("win32")
	"ターミナルでのエンコーディング
	set termencoding=cp932
	"PythonのDLL
	let $PYTHON3_DLL="~/Miniconda35/python35.dll"
	"標準でIMEをオフにする (起動時のデフォルトを全角入力にしない)
	set iminsert=0
	set imsearch=-1
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

"スクロール時の余白
set scrolloff=3

"バックアップ無し
set nobackup
"swpファイル無し
set noswapfile
"自動再読み込み
set autoread

"正規表現をVery Magicに
nnoremap / /\v

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

" IPythonを非同期で実行する
command! IPythonh :VimShellInteractive --split=split ipython
command! IPythonv :VimShellInteractive --split=vsplit ipython

" 80文字目に線をいれる
set colorcolumn=80

" 印刷の設定
set printheader=%t\ Page\ %N\ (%{strftime('%c')})%=
set printoptions=wrap:y,number:y
set printfont=MigMix\ 1M:h12

"タブをスペース展開しない
autocmd FileType tex,java,c,cs,cpp,h,hpp set noexpandtab

"Makefileではタブをスペース展開しない
autocmd FileType make set noexpandtab

"全角スペースを表示する
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

"メニューを英語にする
source $VIMRUNTIME/delmenu.vim
"set langmenu=ja_jp.utf-8
set langmenu=none
source $VIMRUNTIME/menu.vim
if has("multi_lang")
language C
endif

"括弧の自動補完
inoremap { {}<LEFT>
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap } <RIGHT>
inoremap ) <RIGHT>
inoremap ] <RIGHT>
"LaTeX書くときだけインライン数式も補完する
autocmd FileType tex inoremap $ $$<LEFT>

