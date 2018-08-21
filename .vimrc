
"*****************************************************************************
"" Dein Script
"*****************************************************************************

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/chunchun/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/chunchun/.vim/dein')
  call dein#begin('/Users/chunchun/.vim/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/chunchun/.vim/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('scrooloose/nerdtree')
  call dein#add('vim-syntastic/syntastic')
  call dein#add('alvan/vim-closetag')
  call dein#add('fatih/vim-go')
  call dein#add('pangloss/vim-javascript')
  call dein#add('mxw/vim-jsx')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('jiangmiao/auto-pairs')
"  call dein#add('vim-scripts/vim-auto-save')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable


" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif


"*****************************************************************************
"" Must have options
"*****************************************************************************

" These are highly recommended options.

" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window for multiple buffers, and/or:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches
set hlsearch

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" Modelines have historically been a source of security vulnerabilities.  As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline



"*****************************************************************************
"" Usability options
"*****************************************************************************

" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
" set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
" set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell.  If visualbell is set, and
" this line is also included, vim will neither flash nor beep.  If visualbell
" is unset, this does nothing.
" set t_vb=

" Enable use of the mouse for all modes
" set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
" set cmdheight=2

" Display line numbers on the left
set number
:highlight LineNr ctermfg=grey

" Highlight cursor line
hi CursorLine term=bold cterm=bold guibg=Grey40 ctermbg=DarkGrey
set cursorline

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>


"*****************************************************************************
"" Indentation options
"*****************************************************************************

" Indentation settings according to personal preference.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab


"*****************************************************************************
"" Mappings
"*****************************************************************************

" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$


" use <ctrl>+j/k/h/l to switch between panes
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"*****************************************************************************
"" Customer features
"*****************************************************************************

" SuperTab Autocompletion
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
au BufRead,BufNewFile *.py hi self ctermfg=blue
"ctermbg=black
au BufRead,BufNewFile *.py syn match self /\zsself\ze[,.)]/

"-------------------------------------------------------------
au BufNewFile,BufRead *.iced set filetype=coffee

" Remove trailing whitespace from files on save
autocmd BufWritePre * :%s/\s\+$//e

" Exclude <> from delimit, so html autoclose works normal
let delimitMate_matchpairs = "(:),[:],{:}"
" Autoclose html
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

" JSX / React stuff
let g:jsx_ext_required = 0
autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab

" Go stuff
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
"let g:go_metalinter_autosave = 1
"let g:go_metalinter_autosave_enabled = ['vet']

let g:deoplete#enable_at_startup = 1

" Fix escape slowness because of powerline
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

" NERDTREE
map <C-n> :NERDTreeToggle<CR>

" Insert Mode: backspace = 'x' to delete
set backspace=indent,eol,start

" Share clipboard with system
set clipboard=unnamed

" tagbar: class outline viewer
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
map <F8> :TagbarToggle<CR>

" Enable AutoSave on Vim startup
"let g:auto_save = 1

" Theme color
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

" do not save while in insert mode
let g:auto_save_in_insert_mode = 0

" turn off vim-go warning
let g:go_version_warning = 0

