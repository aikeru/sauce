set nocompatible
set number
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

set t_Co=256

filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

set wildignore+=*.zip,*.exe,*.dll,*.pdb,*.jpg,*.jpeg,*.png,*.gif


" ========== MAPPINGS ==========

map <F2> :NERDTreeTabsToggle<CR>

" ========== PLUGINS ===========

" The Silver Searcher
Plugin 'rking/ag.vim'

Plugin 'bling/vim-airline'
let g:airline_powerline_fonts = 1

Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-fugitive'

Plugin 'xterm-color-table.vim'
Plugin 'SyntaxAttr.vim'
Plugin 'gmarik/Vundle.vim'

" Syntax files
" Plugin 'jelera/vim-javascript-syntax'
" Plugin 'mutewinter/vim-css3-syntax'
" Plugin 'groenewege/vim-less'
" Plugin 'olivierverdier/python-syntax.vim'
" Plugin 'othree/html5.vim'
" Plugin 'pangloss/vim-javascript'
" Plugin 'tpope/vim-git'
" Plugin 'tpope/vim-markdown'
" Plugin 'zaiste/tmux.vim'
" Plugin 'digitaltoad/vim-jade'

Plugin 'sheerun/vim-polyglot'
Plugin 'mxw/vim-jsx'
Plugin 'cakebaker/scss-syntax.vim'

" Plugin 'altercation/vim-colors-solarized'

Plugin 'kien/ctrlp.vim'
let g:ctrlp_max_files=0

Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'

Plugin 'scrooloose/syntastic'
let g:syntastic_check_on_open=1
let g:syntastic_json_checkers=['jsonlint']
au BufRead,BufNewFile *.json set filetype=json

Plugin 'scrooloose/nerdtree'

Plugin 'Valloric/YouCompleteMe'
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
set completeopt-=preview

Plugin 'marijnh/tern_for_vim'
Plugin 'tpope/vim-dispatch'
" Plugin 'nosami/Omnisharp'

Plugin 'file:///home/msnead/vimplugins/ragnarokcolor'

call vundle#end()

filetype plugin indent on

" let g:lucius_style dark
colorscheme lucius
LuciusBlack

" let g:solarized_termtrans=1
" let g:solarized_termcolors=256
" syntax enable
" set background=dark
" colorscheme solarized

" source /home/msnead/.vim/bundle/ragnarokcolor/autoload/ragnarokcolor.vim

syntax on

set laststatus=2

" Use Silver Searcher instead of grep
if executable('ag')
    " Note we extract the column as well as the file and line number
    set grepprg=ag\ --nogroup\ --nocolor\ --column
    set grepformat=%f:%l:%c%m
endif

xnoremap  K y:<c-u>Ag <C-R>=shellescape(expand(@"),1)<CR>:copen<CR>
nnoremap  K :<c-u>Ag <c-r>=shellescape(expand("<cword>"),1)<cr>:copen<cr>
