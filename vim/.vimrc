set nocompatible              " be iMproved, required
filetype off                  " required
" install vundle if it isn't vundle
" from: https://github.com/VundleVim/Vundle.vim/issues/769
" thanks dude! ^^^
"
" START - Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
if iCanHazVundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :PluginInstall
endif
" END - Setting up Vundle - the vim plugin bundler

let g:clang_library_path='/usr/lib/libclang.so'
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'christoomey/vim-tmux-navigator'

Plugin 'vim-scripts/indentpython.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}


Plugin 'kabbamine/vcoolor.vim'
"Plugin 'kien/rainbow_parentheses.vim'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'gorodinskiy/vim-coloresque'
"Plugin 'jelera/vim-javascript-syntax'
"Plugin 'walm/jshint.vim'
"Plugin 'moll/vim-node'
Plugin 'airblade/vim-gitgutter'
Plugin 'Yggdroot/indentLine'
" Plugin 'nvie/vim-flake8'
if has('python')
Plugin 'davidhalter/jedi-vim'
"Plugin 'axiaoxin/vim-json-line-format'
Plugin 'SirVer/ultisnips'
endif
Plugin 'morhetz/gruvbox'
" Plugin 'axiaoxin/favorite-vim-colorscheme'
"Plugin 'junegunn/vim-emoji'
Plugin 'mhinz/vim-startify'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'suan/vim-instant-markdown'
Plugin 'tpope/vim-surround'
Plugin 'honza/vim-snippets'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"Plugin 'bling/vim-airline'
"Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'conradirwin/vim-bracketed-paste'
Plugin 'rip-rip/clang_complete'
Plugin 'tmhedberg/simpylfold'
Plugin 'kovetskiy/sxhkd-vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"
"
"""""""""""""""""""""""BASE CONFIG"""""""""""""""""""""""


set nobackup
set noswapfile
set noundofile
"
"
set laststatus=2
syntax enable
syntax on
autocmd! bufwritepost .vimrc source %
set autoread
"set clipboard=unnamed
set hlsearch
set incsearch
set ignorecase
set smartcase
set guifont=Hack:h12
" colorscheme Tomorrow-Night-Bright
colorscheme gruvbox
"colorscheme elflord
set background=dark
set showcmd
set showmatch
set autowrite

set number
set cursorline
set cursorcolumn "guibg=#404040
set relativenumber
set cc=80

set backspace=2
set smarttab
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePre * :%s/^$\n\+\%$//ge

set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set shiftround
set autoindent
set smartindent
set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" folding -- SimplyFold
"set foldmethod=indent
"set foldlevel=99
"nnoremap <space> za

set t_ti= t_te=
autocmd BufReadPost *
\ if ! exists("g:leave_my_cursor_position_alone") |
\     if line("'\"") > 0 && line ("'\"") <= line("$") |
\         exe "normal g'\"" |
\     endif |
\ endif
"
"
"

cnoremap ww execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

nmap <leader>/ :nohlsearch<CR>


imap jk <Esc>
imap kj <Esc>

nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
nnoremap [t :tabp<CR>
nnoremap ]t :tabn<CR>
nmap <C-c> gg"+yG
vmap <C-c> "+y
"inoremap <C-V> <ESC> "*pa
cmap w!! w !sudo tee >/dev/null %:p
nnoremap <F2> :set nonu!<CR>:set foldcolumn=0<CR>
nmap <silent> <F3> :NERDTreeToggle<CR>
nmap <silent> <F4> :TagbarToggle<CR>

"copy
vmap <F7> "+ygv"zy`>
"paste (Shift-F7 to paste after normal cursor, Ctrl-F7 to paste over visual selection)
nmap <F7> "zgP
nmap <S-F7> "zgp
imap <F7> <C-r><C-o>z
vmap <C-F7> "zp`]
cmap <F7> <C-r><C-o>z
"copy register

autocmd FocusGained * let @z=@+


""""""""""""""""""""""""""""""PLUGIN CONFIG""""""""""""""""""""""""""
" NerdCommenter
let g:NERDSpaceDelims=1
"
" " CtrlP
let g:ctrlp_show_hidden = 1
let g:ctrlp_cmd = 'CtrlPMixed'
"
"Ctrl-X Ctrl-U emoji
set completefunc=emoji#complete
"

"
" " airline
"let g:airline_section_y = '%{strftime("%H:%M")}'
" tabline
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline#extensions#tabline#buffer_nr_show = 1
"
" " jedi
autocmd FileType python setlocal completeopt-=preview
let g:jedi#completions_command = "<C-n>"
"
" " vim-table-mode: markdown
let g:table_mode_corner="|"
"
" " rainbow_parentheses
let g:rbpt_colorpairs = [
\ ['brown',       'RoyalBlue3'],
\ ['Darkblue',    'SeaGreen3'],
\ ['darkgray',    'DarkOrchid3'],
\ ['darkgreen',   'firebrick3'],
\ ['darkcyan',    'RoyalBlue3'],
\ ['darkred',     'SeaGreen3'],
\ ['darkmagenta', 'DarkOrchid3'],
\ ['brown',       'firebrick3'],
\ ['gray',        'RoyalBlue3'],
\ ['darkmagenta', 'DarkOrchid3'],
\ ['Darkblue',    'firebrick3'],
\ ['darkgreen','RoyalBlue3'],
\ ['darkcyan','SeaGreen3'],
\ ['darkred','DarkOrchid3'],
\ ['red','firebrick3'],
\ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle= 0


"
let g:vcoolor_map = '<leader>cp'
let g:vcool_ins_rgb_map = '<leader>cpr'

let g:vcool_ins_hsl_map = '<leader>cph'

let g:vcool_ins_rgba_map = '<leader>cpra'

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"let g:airline_theme='tomorrow'

