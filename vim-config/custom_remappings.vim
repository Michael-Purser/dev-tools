nnoremap to :tabnew<CR>
nnoremap tn :tabm +1<CR>
nnoremap tp :tabm -1<CR>
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
