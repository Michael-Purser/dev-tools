" ---------------------------------------------------------------------
" Install vim-plug plugin manager: https://github.com/junegunn/vim-plug
" ---------------------------------------------------------------------
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ------------
" List plugins
" ------------
call plug#begin()

" NERDTree file explorer
Plug 'preservim/NERDTree'

" CTRLP fuzzy search plugin
Plug 'ctrlpvim/ctrlp.vim'

" Lighline (better statusline)
Plug 'itchyny/lightline.vim'

" Show indents
Plug 'Yggdroot/indentLine'

" GitGutter (see what changed for git)
Plug 'airblade/vim-gitgutter'

" Plugin to toggle commenting
Plug 'tpope/vim-commentary'

if !has('nvim')
  " YouCompleteMe
  Plug 'Valloric/YouCompleteMe'
endif

if has('nvim')
  " Coc
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Github Copilot
  Plug 'github/copilot.vim'
endif

" Autoformat
Plug 'vim-autoformat/vim-autoformat'

" Markdown preview plugin
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Git plugin
Plug 'tpope/vim-fugitive'

" Theme Vim-Code-Dark
Plug 'tomasiser/vim-code-dark'

call plug#end()

" ---------------------
" Settings for NERDTree
" ---------------------
map <F2> :NERDTreeToggle<CR>

" ---------------------
" Settings for ctrlpvim
" ---------------------
let g:ctrlp_map = '<c-p>'

" -----------------------
" Settings for indentLine
" -----------------------
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
let g:vim_json_conceal=0
let g:markdown_syntax_conceal=0

" --------------------------
" Settings for YouCompleteMe
" --------------------------
let g:ycm_enable_semantic_highlighting=1
let g:ycm_clangd_args=['--header-insertion=never']
let g:ycm_autoclose_preview_window_after_completion=1

" ----------------
" Settings for CoC
" ----------------
let g:coc_disable_startup_warning = 1
let g:coc_default_semantic_highlight_groups = 1

" ---------------------------
" Settings for vim-autoformat
" ---------------------------
noremap <F3> :Autoformat<CR>

" -----------------------------
" Settings for markdown-preview
" -----------------------------
map <C-m> :MarkdownPreview<CR>

" -------------------------
" Settings for vim-fugitive
" -------------------------
map <F4> :Git blame<CR>


" ---------------
" Set colorscheme
" ---------------
silent! colorscheme codedark
