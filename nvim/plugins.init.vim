augroup MyAutoCmd
    autocmd!
augroup END

let s:dein_dir = expand('$HOME/.cache/dein')

if has('vim_starting')
    let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_repo_dir)
            echo "installing dein ... "
            :call system("mkdir -p " . s:dein_repo_dir)
            :call system("git clone https://github.com/Shougo/dein.vim.git " . s:dein_repo_dir)
    endif
    execute 'set runtimepath^=' . s:dein_repo_dir
endif

let g:dein#install_max_processes = 16
let g:dein#install_message_type = 'echo'

if dein#load_state(s:dein_dir)

    call dein#begin(s:dein_dir)

    call dein#add('Shougo/dein.vim')
    call dein#add('Shougo/vimproc.vim', {'build': 'make'})

    call dein#add('Shougo/deoplete.nvim')
    if !has('nvim')
        let s:dein_home_dir = expand(s:dein_dir)
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif
    let g:deoplete#enable_at_startup = 1

    call dein#add('wokalski/autocomplete-flow')
    call dein#add('Shougo/neosnippet')
    call dein#add('Shougo/neosnippet-snippets')
    let g:neosnippet#enable_completed_snippet = 1

    call dein#add('Shougo/denite.nvim')

    " プログラミング言語 ##################################################

    call dein#add('zchee/deoplete-jedi', {
        \ "autoload" : {
        \   "filetypes" : ['python']
        \}})
    let g:deoplete#sources#jedi#python_path=$PYTHONPATH . 'python'

    " Trailing
    call dein#add('bronson/vim-trailing-whitespace')

    " VimでProcessing書くためのやつ
    call dein#add('sophacles/vim-processing')
    " Pythonのpep8インデント
    call dein#add('Vimjas/vim-python-pep8-indent', {
        \ "autoload" : {
        \   "filetypes" : ['python']
        \}})

    " GLSL
    call dein#add('tikhomirov/vim-glsl')
    " in your .vimrc (_vimrc for Windows)

    " Julia
    call dein#add('JuliaEditorSupport/julia-vim')
    let g:latex_to_unicode_auto = 1

    " Stan
    call dein#add('maverickg/stan.vim')

    " Vue.js
    call dein#add('posva/vim-vue')

    " エディタの見た目 ##################################################

    " かっこいい
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    let g:airline_theme = 'dark'
    " フォントサイズを変える
    call dein#add('vim-scripts/zoom.vim')
    " おしゃれカラースキーム
    call dein#add('tomasr/molokai')
    call dein#add('cocopon/iceberg.vim')
    call dein#add('nanotech/jellybeans.vim')

    " Markdown Runner #########################################
    call dein#add('dbridges/vim-markdown-runner')

    call dein#end()
    call dein#save_state()
endif

" filetype別のプラグイン/インデントを有効にする
filetype plugin indent on

autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl

nnoremap <Leader>f :FixWhitespace<CR>

autocmd FileType markdown nnoremap <buffer> <Leader>r :MarkdownRunner<CR>
autocmd FileType markdown nnoremap <buffer> <Leader>R :MarkdownRunnerInsert<CR>

function! MyTex2imgRunner(src)
    let tmp = tempname() . ".tex"
    let src = a:src

    " コードの最初にコメントとして挿入されているファイル名を取得する
    " 無ければ`_output.svg`が標準のファイル名になる
    let matched = matchlist(src[0], "^\%\\s*\\(.*\.\\(svg\\|pdf\\|png\\)\\)")
    if len(matched) >= 2
        let out = matched[1]
    else
        let out = "_output.svg"
    endif

    " tex2imgに突っ込むコードを生成する
    let joined_src = join(src[1:], "\n")
    let src = split(
            \ "\\documentclass[fleqn,papersize,dvipdfmx]{jsarticle}\n"
            \. "\\usepackage{tikz,graphicx}\n"
            \. "\\usepackage{amsmath,amssymb}\n"
            \. "\\usepackage{color}\n"
            \. "\\pagestyle{empty}\n"
            \. "\\begin{document}\n"
            \. joined_src
            \. "\n\\end{document}\n", "\n")

    call writefile(src, tmp)
    let res = system("tex2imgc /transparent /embed-source /quiet /margins=8 " . tmp . " " . out)
    call delete(tmp)
    return res
endfunction

if !exists("g:markdown_runners")
    let g:markdown_runners = {
                \ '': getenv('SHELL'),
                \ 'go': function("markdown_runner#RunGoBlock"),
                \ 'js': 'node',
                \ 'javascript': 'node',
                \ 'vim': function("markdown_runner#RunVimBlock"),
                \ 'tex2img': function('MyTex2imgRunner')
                \ }
endif

