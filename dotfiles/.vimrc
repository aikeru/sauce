" Want to reload this file?
" :so %
" Reload .vimrc specifically
" :so $MYVIMRC

" Turn off lazy redraw
set nolazyredraw
" Draw more characters at a time
set ttyfast

"set mouse=a " Enable the mouse

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
map <F12> :call GoToCurrentDefinition()<CR>

function! GoToCurrentDefinition()
    if (&filetype ==# 'javascript')
        TernDef
    elseif (&filetype ==# 'cs')
        YcmCompleter GoToImplementationElseDeclaration
    endif
endfunction

" ========== PLUGINS ===========

" - Syntax for .proj, .props, .targets
" - build open project with :make
"   ie: :make /t:rebuild
"
Plugin 'heaths/vim-msbuild'

" dbext.vim is like SMSS within vim
"  
Plugin 'vim-scripts/dbext.vim'

" shell within vim, use :VimShell or :VimShellTab to open it
Plugin 'Shougo/vimshell.vim'
" vim-lucius color scheme
Plugin 'jonathanfilip/vim-lucius'

" MiniBufExpl
" Does other things, but I mainly use it so I can click to select tabs
" Plugin 'fholgado/minibufexpl.vim'

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
" Within :Gstatus use U to checkout a file in the list
Plugin 'tpope/vim-fugitive'
" Visualize and explore git
Plugin 'gregsexton/gitv'
" Surround things with stuff like (), [], '', <tags>, etc.
" ie:
"   cs"' -- change surrounding " to be '
"   cs'<q> -- change surrounding ' to be <q></q>
"   cs]{ -- change [] to {} and add space
"   cs]} -- change [] to {} no added space
"   ds" -- delete surrounding "
"   ds{ -- delete surrounding { and space
"   yssb or yss) -- wrap entire line with parens
"   ys2aw"  -- surround 2 words, starting at beginning, with quotes
"   ys2w"   -- surround 2 words, starting at cursor, with quotes
"
" In Visual mode
"   S<p class="important"> will wrap the selected with <p..></p>
"   s<p> will wrap without indenting
Plugin 'tpope/vim-surround'

" Make more stuff (esp things like vim-surround) repeatable with dot . command
Plugin 'tpope/vim-repeat'

" Show me a pretty color table when I type :XtermColorTable 
Plugin 'guns/xterm-color-table.vim'
" Tell me how a symbol gets highlighted when I type :call SyntaxAttr()
Plugin 'SyntaxAttr.vim'
" Vundle package manager for vim
Plugin 'gmarik/Vundle.vim'

" Integration with typescript-tools server
Plugin 'clausreinke/typescript-tools.vim'
" TypeScript syntax and such
Plugin 'leafgarland/typescript-vim'
" Make YCM trigger on '.' with typescript, ie: foo.x
if !exists("g:ycm_semantic_triggers")
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

" Gives decent highlighting for Razor, web forms, etc.
"   Build/etc. features don't seem to work right under cygwin :(
Plugin 'OrangeT/vim-csharp'
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
" Allows some plugins to use deferred / threading
Plugin 'tpope/vim-dispatch'
" Plugin 'nosami/Omnisharp'
" Asynchronous process manager - used by vim-vebugger
" :VimProcBang to run command and echo result
" :VimProcRead to past output of command into current buffer
" vimproc#open vimproc#system
Plugin 'Shougo/vimproc.vim'
" Debugger for GDB, JDB (Java), Mdbg (.NET), PDB (Python), RDebug (Ruby, but
" not on Windows)
" :VBGstartGDB a.out
" :VBGtoggleBreakpointThisLine  Toggle a breakpoint
" :VBGcontinue  continue [after pause]
" :VBGeval  evaluate expression/variable
" :VBGstepOver  step over current line
" :VBGexecute i = 98    execute expression
Plugin 'idanarye/vim-vebugger'

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

autocmd FileType text call SetUpTextEditing()

function! SetUpTextEditing()
    if (&filetype ==# 'text')
        set wrap
        set linebreak
        set nolist
    endif
endfunction

set sc

au BufRead,BufNewFile *.ts setlocal filetype=typescript
autocmd FileType typescript setlocal omnifunc=TSScompleteFunc
" Use Silver Searcher instead of grep
"if executable('ag')
"    " Note we extract the column as well as the file and line number
""    set grepprg=ag\ --nogroup\ --nocolor\ --column
""    set grepformat=%f:%l:%c%m
"endif

" Use silver searcher to find the word under the cursor with K
"xnoremap  K y:<c-u>Ag <C-R>=shellescape(expand(@"),1)<CR>:copen<CR>
"nnoremap  K :<c-u>Ag <c-r>=shellescape(expand("<cword>"),1)<cr>:copen<cr>
"
"
" If using gvim, set guifont
if has("gui_running")
    set guifont=Ubuntu\ Mono\ For\ Powerline\ 13
endif

if filereadable(expand("~/.machinevimrc"))
    source ~/.machinevimrc
endif
