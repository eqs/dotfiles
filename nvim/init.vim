scriptencoding utf-8

runtime plugins.init.vim
runtime main.init.vim
runtime color.init.vim

if filereadable(expand(fnamemodify($MYVIMRC, ":p:h") . "/local.init.vim"))
    runtime local.init.vim
endif
