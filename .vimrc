set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'

Plugin 'scroolose/syntastic'

Plugin 'airblade/vim-gitgutter'

Plugin 'bling/vim-airline'

Plugin 'kien/ctrlp.vim'

Plugin 'edsono/vim-matchit'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

Plugin 'scrooloose/nerdcommenter'
call vundle#end()
filetype plugin indent on
"  General {{{ 
" Sets how many lines of history VIM has to remember
set history=700
" Set to auto read when a file is changed from the outside
set autoread
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
" Fast saving
nmap <leader>w :w!<cr>
" }}}
"  VIM user interface{{{
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7
" Always show tabs
set showtabline=2
" Max show 15 tabs
set tabpagemax=15
" Show mode
set showmode
" Show partial commands in status and selected characters/lines in visual mode
set showcmd
" Show number line
set nu
" Turn on the WiLd menu
set wildmenu
set wildmode=list:longest
" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*/tmp/*,*.so,*.swp,*.zip
"Always show current position
set ruler
" Height of the command bar
set cmdheight=2
" Show cursor line
set cursorline
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases 
set smartcase
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch
" Don't redraw while executing macros (good performance config)
set lazyredraw
" For regular expressions turn magic on
set magic
" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=2000
" default add g
set gdefault
" send more chars at given time
set ttyfast
" Window title bar shows filename
set title
" }}}
"  Code Folding{{{
" Keep all folds closed by default
" set foldlevelstart=0
" Fold toggling
nnoremap <Space> za
" Use syntax based folding for ruby
" set foldmethod=marker
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
augroup filetype_ruby
  autocmd!
  autocmd FileType ruby setlocal foldmethod=syntax
augroup END
" }}}
"  Colors and Fonts{{{
" Enable syntax highlighting
syntax on
" set background=dark
" colorscheme solarized 
set t_Co=256
" let g:solarized_termcolors=256
colorscheme desert
" let g:molokai_original = 1
" let g:rehash256 = 1
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
" Use Unix as the standard file type
set ffs=unix,mac,dos
" }}}
"  Files, backups and undo{{{
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
" }}}
"  Text, tab and indent related{{{
" Use spaces instead of tabs
set expandtab
" Be smart when using tabs 
set smarttab
" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2
" Linebreak on 500 characters
set lbr
set tw=500
set ai "Auto indent
" set si "Smart indent
set wrap "Wrap lines
" }}}
"  Moving around, tabs, windows and buffers{{{
" Horizontal Split and Unsplit 
map <leader>! :on<cr>
map <leader>@ :vsplit ea<cr>
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
" }}}
"  Status line{{{
" Always show the status line
set laststatus=2
" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
" set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
" }}}
"  Miscellanous{{{
" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>
" Show hidden chars
set list
set lcs=tab:›\ ,trail:•,eol:¬,nbsp:.
" Remap :W to :w
command W w
" Faster split resizing
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif
" }}}
"  Helper Functions{{{
" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  en
  return ''
endfunction
" }}}
"  vim-airline settings{{{
let g:airline_powerline_fonts = 1

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" }}}
"  ctrlp settings{{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/].(git|hg|svn)$'
let g:ctrlp_user_command = 'find %s -type f'
"  }}}
"  syntastic settings{{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"  JS
let g:syntastic_javascript_checkers = ['jshint']
"  }}}
"  gitgutter settings{{{
let g:gitgutter_sign_column_always = 1
"  }}}

