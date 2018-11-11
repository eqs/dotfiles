" release autogroup in MyAutoCmd
augroup MyAutoCmd
    autocmd!
augroup END

let g:vimproc#download_windows_dll = 1

if has('vim_starting')
    if &compatible
        set nocompatible
    endif

    " neobundleがなければ自動インストール
    if !isdirectory(expand("~/.vim/dein/repos/github.com/Shougo/dein.vim"))
        echo "installing dein ... "
        :call system("mkdir -p ~/.vim/dein/repos/github.com/Shougo/dein.vim")
        :call system("git clone https://github.com/Shougo/dein.vim.git ~/.vim/dein/repos/github.com/Shougo/dein.vim")
    endif
    
    set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
endif

" setting shell
if has('win64')
    set shell=cmd
elseif has('unix')
    set shell=bash\ -i
endif


call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})

call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/denite.nvim')

" Pythonの補完
call dein#add('davidhalter/jedi-vim')


"爆速HTMLコーディング
call dein#add('mattn/emmet-vim')
" VimでProcessing書くためのやつ
call dein#add('sophacles/vim-processing')
" Pythonのpep8インデント
call dein#add('hynek/vim-python-pep8-indent', {"autoload" : {"filetypes" : ['python', 'python3']}})
" かっこいい
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
let g:airline_theme = 'dark'

" おしゃれカラースキーム
call dein#add('tomasr/molokai')
" おしゃれカラースキーム
call dein#add('cocopon/iceberg.vim')
" フォントサイズを簡単にかえる
call dein#add('vim-scripts/zoom.vim')

" GLSL
call dein#add('tikhomirov/vim-glsl')
" in your .vimrc (_vimrc for Windows)
autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl

" Julia
call dein#add('JuliaEditorSupport/julia-vim')
let g:latex_to_unicode_auto = 1

" Stan
call dein#add('maverickg/stan.vim')

" " テンプレート管理
call dein#add('thinca/vim-template')
" テンプレートの場所を指定する
let g:template_basedir = '~/dotfiles/templates/'
let g:template_files = 'template.*'
let g:template_free_pattern = 'template'
" テンプレート中に含まれる特定文字列を置換する
autocmd MyAutoCmd User plugin-template-loaded call s:template_keywords()
function! s:template_keywords()
    silent! %s/<+DATE+>/\=strftime('%c')/g
endfunction
" テンプレート中に含まれる'<+CURSOR+>'にカーソルを移動する
autocmd MyAutoCmd User plugin-template-loaded
            \   if search('<+CURSOR+>')
            \ |     silent! execute 'normal! "_da>'
            \ | endif


call dein#end()

" ejs
au BufNewFile, BufRead *.ejs setlocal filetype=html

"エンコーディング指定
set encoding=utf-8

"標準でIMEをオフにする (起動時のデフォルトを全角入力にしない)
set iminsert=0
set imsearch=-1

"タブ幅の設定
set shiftwidth=4
set tabstop=4
"どこで改行するか
set whichwrap=b,s,h,l,<,>,[,]
"オートインデント
set autoindent
"行番号表示
set number
"括弧の対応をハイライトする
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

"スクロール時の余白
set scrolloff=3

"バックアップ無し
set nobackup
"swpファイル無し
set noswapfile
"自動再読み込み
set autoread
"Undoファイルの場所を変更する
set undodir=~/.vim/undotmp

"正規表現をVery Magicに
nnoremap / /\v

" 改行とかタブとかを表示する
set list
set listchars=eol:$,tab:>\ ,trail:_,extends:<

" TABキーで対応ペアにジャンプする
nnoremap <Tab> %
vnoremap <Tab> %

" 折り返されたテキストの上でいい感じに動く
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
" Ctrl + hjklでウインドウを移動する
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"Insertモード中でもhjklで移動する
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
" sは使わない
nnoremap s <Nop>
" Window自体の移動
nnoremap sj <C-w>J
nnoremap sk <C-w>K
nnoremap sh <C-w>H
nnoremap sl <C-w>L
nnoremap sr <C-w>L
" ^と$をSpace+hとSpace+lに割り当てる
noremap <Space>h ^
noremap <Space>l $
" カンマの後ろにスペースを入れる
inoremap , ,<Space>

" ファイルの情報を表示
nnoremap <C-g> 1<C-g>

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

" 80文字目に線をいれる
set colorcolumn=80

" 印刷の設定
set printheader=%t\ Page\ %N\ (%{strftime('%c')})%=
set printoptions=wrap:y,number:y
set printfont=MigMix\ 1M:h12

command Hardcopy call Hardcopy()
function! Hardcopy()
    let colors_save = g:colors_name
    colorscheme default
    hardcopy
    execute 'colorscheme' colors_save
endfun

"タブをスペース展開しない
autocmd FileType tex,java,c,cs,cpp,h,hpp set noexpandtab

"Makefileではタブをスペース展開しない
autocmd FileType make set noexpandtab

" reStructuredTextではタブ幅を3文字にする
autocmd FileType rst set tabstop=3
autocmd FileType rst set shiftwidth=3

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

" Windows以外の設定
if !has("win32")
    colorscheme molokai
    "アンダーラインを引く
    set cursorline
    highlight CursorLine gui=underline guifg=NONE guibg=NONE

    "全角スペースを表示する
    highlight ZenkakuSpace gui=underline guifg=lightblue guibg=darkgray
    match ZenkakuSpace /　/
endif

" molokai setting for bash on win
if &term == "xterm-256color"
    colorscheme molokai
    hi Comment ctermfg=102
    hi Visual ctermbg=236
endif
