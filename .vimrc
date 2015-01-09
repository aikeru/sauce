" Don't need compatibility with vi
" Fixes things like scrolling with arrow keys in cygwin
set nocompatible
" Show line number
set number
" Tabs should be 4 columns
set tabstop=4
" When indenting, use 4 columns
set shiftwidth=4
" Make 4 spaces when I hit tab in insert mode
set expandtab
" Copy the indentation of the previous line when starting a new line
set autoindent

" //TODO: remove? (force vim to act like term is 256 colors)
set t_Co=256
" Required for Vundle
filetype off
" Set runtime path to include vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Ignore files I will never open with vim
set wildignore+=*.zip,*.exe,*.dll,*.pdb,*.jpg,*.jpeg,*.png,*.gif
"let g:ctrlp_custom_ignore = {
            "\ 'dir': '\v[\/]\.(git|hg|svn)$'
            "\ 'file': '\v\.(exe|so|dll|pdb|jpg|zip|gif|jpeg|png)$',
            "\ }


" ========== MAPPINGS ==========

map <F2> :NERDTreeTabsToggle<CR>
map <F12> :YcmCompleter GoToImplementationElseDeclaration<CR>

" ========== PLUGINS ===========

" The Silver Searcher (use ag over ack over grep)
Plugin 'rking/ag.vim'

" Awesome footer status bar
Plugin 'bling/vim-airline'
" Take advantage of Ubuntu Powerline font
let g:airline_powerline_fonts = 1

" Competitor to NERDTree for file browsing:
" https://github.com/Shougo/vimfiler.vim
" https://github.com/Shougo/unite.vim

" Persist NERDTree across tabs
Plugin 'jistr/vim-nerdtree-tabs'
" Integrate with git (and add branch name to airline)
Plugin 'tpope/vim-fugitive'

" Show me a pretty color table when I type :XtermColorTable 
Plugin 'guns/xterm-color-table.vim'
" Tell me how a symbol gets highlighted when I type :call SyntaxAttr()
Plugin 'SyntaxAttr.vim'
" Vundle package manager for vim
Plugin 'gmarik/Vundle.vim'

" Fast, lightweight syntax highlighting for lots of languages
Plugin 'sheerun/vim-polyglot'
" React jsx highlighting for vim
Plugin 'mxw/vim-jsx'
" SCSS highlighting
Plugin 'cakebaker/scss-syntax.vim'
" Fuzzy file finder
" <c-p> Open ctrlp
" <ESC> Close ctrlp
" Once ctrlp is open ...
" <F5>  Purge the cache
" <c-d> Filename search only (instead of path too)
" <c-j> <c-k> arrow keys    Navigate results
" <c-t> <c-v> <c-x> open selected entry in new tab, vertical split or
" horizontal split
" <c-y> Create a new file and its parent directories
" <c-z> Mark/unmark multiple files <c-o> opens them
Plugin 'kien/ctrlp.vim'
" No maximum number of cached files for ctrlp (stupid massive solutions)
let g:ctrlp_max_files=0
" Show me indentation
" <Leader>ig    Toggle showing identation
" :help indent-guides   to get help on this plugin
Plugin 'nathanaelkane/vim-indent-guides'
" Auto-completion for quotes, parens, brackets, etc.
Plugin 'Raimondi/delimitMate'

" Syntax checking
" - Check when I open a file
" - Check JSON files using jsonlint (not on by default)
" - Recognize json files (also not default)
Plugin 'scrooloose/syntastic'
let g:syntastic_check_on_open=1
let g:syntastic_json_checkers=['jsonlint']
au BufRead,BufNewFile *.json set filetype=json

" File tree browser
Plugin 'scrooloose/nerdtree'

" Rapidly comment/uncomment lines
"   <Leader>cc  Comment line(s)
"   <Leader>cn  Comment line(s) and nest
"   <Leader>cu  Uncomment line(s)
"   <Leader>cs  Comment 'sexily' (ie: /* */ in C#)
Plugin 'scrooloose/nerdcommenter'

" Intellisense-like tab completion
" - Don't ask me if it's safe to load .ycm_extra_conf.py
" - Keep logfiles on shutdown of ycmd server
" - Set YCM server log level to Debug
Plugin 'Valloric/YouCompleteMe'
"let g:ycm_add_preview_to_completeopt=0 //TODO: remove
let g:ycm_confirm_extra_conf=0 " //TODO: set to 1?
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
" Don't have Scratch window pop up at the top of the screen when using
" omnicompletion
" http://stackoverflow.com/questions/15962421/how-can-i-disable-scratch-preview-window
set completeopt-=preview

" Intellisense-like tab completion ... for node/javascript
" TernDef   Jump to definition under cursor
" TernDoc   Look up documentation
" TernType  Find the type of thing under cursor
" TernRefs  Show all references to variable/prop under cursor
" TernRename    Rename the variable under cursor
Plugin 'marijnh/tern_for_vim'
Plugin 'tpope/vim-dispatch'
" Plugin 'nosami/Omnisharp'

call vundle#end()

" Turn this stuff back on for plugins etc. that use it
filetype plugin indent on

" Switch to the awesome color scheme 'Lucius'
" let g:lucius_style dark
colorscheme lucius
" Black is where I spend most of my time (coding). LuciusLight or
" LuciusLightHighContrast may be useful for presenting...
LuciusBlack

" Turn on syntax highlighting (so you actually see the colors)
syntax on

" I want to see vim airline's status bar at the bottom
set laststatus=2

" Use Silver Searcher instead of grep
"if executable('ag')
"    " Note we extract the column as well as the file and line number
""    set grepprg=ag\ --nogroup\ --nocolor\ --column
""    set grepformat=%f:%l:%c%m
"endif

" Use silver searcher to find the word under the cursor with K
"xnoremap  K y:<c-u>Ag <C-R>=shellescape(expand(@"),1)<CR>:copen<CR>
"nnoremap  K :<c-u>Ag <c-r>=shellescape(expand("<cword>"),1)<cr>:copen<cr>
