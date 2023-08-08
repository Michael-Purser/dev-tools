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

" Lighline (better statusline) & gitbranch (show git branch in statusline)
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'

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

" Fuzzy-searching (with post install hook to get latest version)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Icons for NERDTree
Plug 'ryanoasis/vim-devicons'

call plug#end()

" ---------------------
" Settings for NERDTree
" ---------------------
map <F2> :NERDTreeToggle<CR>
map <F3> :NERDTreeToggle %<CR>

" ----------------------
" Settings for lightline
" ----------------------
"  Turn off mode in (n)vim, because lightline does that now
set noshowmode
" lightline settings
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'absolutepath', 'gitbranch', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" -----------------------
" Settings for indentLine
" -----------------------
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
let g:vim_json_conceal=0
let g:markdown_syntax_conceal=0
let g:indentLine_fileTypeExclude = ["nerdtree"] " Don't show indent lines in NERDTree

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
noremap <F5> :Autoformat<CR>

" -----------------------------
" Settings for markdown-preview
" -----------------------------
map <C-m> :MarkdownPreview<CR>

" -------------------------
" Settings for vim-fugitive
" -------------------------
map <F4> :Git blame<CR>

" ----------------
" Settings for FZF
" ----------------
"  Bind to CTRL-T
"  (we do not use CTRL-P because this key binding triggers something else in
"  docker containers)
map <C-t> :FZF<CR>
" Set layout to be a window anchored to th ebottom of the screen
let g:fzf_layout = { 'window': { 'width': 1.0, 'height': 0.4, 'relative': v:true, 'yoffset': 1.0 } }

" ---------------
" Set colorscheme
" ---------------
silent! colorscheme codedark
