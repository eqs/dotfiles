scriptencoding utf-8

runtime plugins.init.vim
runtime main.init.vim
runtime color.init.vim

if filereadable("local.init.vim")
    runtime local.init.vim
endif
