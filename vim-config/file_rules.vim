" Add line length autowrap for git commits
autocmd FileType gitcommit set colorcolumn=72

" Add indentation rules for file extensions
autocmd BufRead,BufNewFile *.py set shiftwidth=4 tabstop=4 expandtab autoindent
autocmd BufRead,BufNewFile *.cpp set shiftwidth=2 tabstop=2 expandtab autoindent
autocmd BufRead,BufNewFile *.hpp set shiftwidth=2 tabstop=2 expandtab autoindent
autocmd BufRead,BufNewFile *.h set shiftwidth=2 tabstop=2 expandtab autoindent
autocmd BufRead,BufNewFile *.yaml set shiftwidth=2 tabstop=2 expandtab autoindent

