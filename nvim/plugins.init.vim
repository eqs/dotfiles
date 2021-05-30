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




    call dein#end()
    call dein#save_state()
endif

" filetype別のプラグイン/インデントを有効にする
filetype plugin indent on

let g:latex_to_unicode_auto = 1
