
" Install vim-plug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin()


if has('nvim')
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/denite.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'shougo/neoyank.vim'

Plug 'sheerun/vim-polyglot'

" lint / fix / complete
Plug 'dense-analysis/ale'
Plug 'autozimu/languageclient-neovim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'google/yapf'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Git
Plug 'tpope/vim-fugitive'

" Tmux
Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'

" HTML
Plug 'mattn/emmet-vim'
Plug 'slim-template/vim-slim'
Plug 'mustache/vim-mustache-handlebars'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'claco/jasmine.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'lfilho/cosco.vim'

" python
Plug 'davidhalter/jedi-vim'
Plug 'jeetsukumaran/vim-pythonsense'
"Plug 'zchee/deoplete-jedi'
Plug 'liuchengxu/vista.vim'
" Plug 'jiangmiao/auto-pairs'
"Plug 'numirias/semshi'
Plug 'plasticboy/vim-markdown'
"Plug 'sbdchd/neoformat'
Plug 'tpope/vim-surround'

" utilities
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'junegunn/fzf.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'tmhedberg/SimpylFold'
Plug 'thaerkh/vim-workspace'
Plug 'farmergreg/vim-lastplace'


" zo： Open fold in current cursor postion
" zO： Open fold and sub-fold in current cursor postion recursively
" zc： Close the fold in current cursor position
" zC： Close the fold and sub-fold in current cursor position recursively
Plug 'mbbill/undotree'
Plug 'fholgado/minibufexpl.vim'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'vim-scripts/sudo.vim'
"Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-path'
" Plug 'ncm2/ncm2-jedi'

" status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" appearance
"Plug 'baskerville/bubblegum'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'nathanaelkane/vim-indent-guides'

Plug 'tpope/vim-sensible'
Plug 'lilydjwg/colorizer', { 'on': 'ColorToggle' }
Plug 'myusuf3/numbers.vim'
Plug 'wavded/vim-stylus'
Plug 'ryanoasis/vim-devicons'

call plug#end()


syntax enable
syntax on
set hlsearch
set incsearch
set ignorecase
set smartcase
nmap <leader>/ :nohlsearch<CR>
set splitbelow
set splitright
set foldmethod=indent
set foldlevel=80
nnoremap <space> za

set encoding=utf-8
set nu
set cursorline
set cursorcolumn "guibg=#404040
set relativenumber
set cc=80

set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set shiftround
set autoindent
set smartindent
set fileformat=unix

set pastetoggle=<F3>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


set bg=dark
" colorscheme gruvbox
colorscheme dracula

autocmd VimEnter *
    \ call MyPlugs()
  " \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  " \|   PlugInstall --sync | q
  " \| endif
" BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw

function MyPlugs()
    if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
        echom 'plug it up'
        PlugInstall --sync | q
    endif
endfunction

if has ('autocmd')
 augroup vimrc
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC
                \| call MyPlugs()
                \| redraw
  augroup END
endif " has autocmd
nnoremap <leader>% :source %<CR>
nnoremap gev :e $MYVIMRC<CR>
nnoremap gsv :so $MYVIMRC<CR>


let g:indent_guides_enable_on_vim_startup = 1
" nmap <leader>! <leader>% | :PlugInstall --sync<CR>

" plugin settings
"
" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction
"
"
" ale
let g:ale_linters = {
    \   'css': ['csslint', 'prettier'],
    \   'git': ['gitlint'],
    \   'python': ['flake8'],
    \   'ruby': ['standardrb', 'rubocop'],
    \   'javascript': ['eslint'],
    \    'vim': ['vint']
      \}
let b:ale_fixers = {
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \   'sh': ['bash_language_server', 'start'],
            \   'python': [
            \       'black',
            \       'yapf',
            \       'add_blank_lines_for_python_control_statements',
            \       'autopep8',
            \       'isort',
            \       'reorder-python-imports'
            \   ]
            \}
let g:ale_fixers = ['remove_trailing_lines', 'trim_whitespace']

nmap <F10> :ALEFix<CR>
nmap <silent> <C-e> <Plug>(ale_next_wrap)
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:ale_linters_explicit = 0

let g:ale_completion_enabled = 0
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_sign_column_always = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_completion_symbols = {
            \ 'text': '',
            \ 'method': '',
            \ 'function': '',
            \ 'constructor': '',
            \ 'field': '',
            \ 'variable': '',
            \ 'class': '',
            \ 'interface': '',
            \ 'module': '',
            \ 'property': '',
            \ 'unit': 'unit',
            \ 'value': 'val',
            \ 'enum': '',
            \ 'keyword': 'keyword',
            \ 'snippet': '',
            \ 'color': 'color',
            \ 'file': '',
            \ 'reference': 'ref',
            \ 'folder': '',
            \ 'enum member': '',
            \ 'constant': '',
            \ 'struct': '',
            \ 'event': 'event',
            \ 'operator': '',
            \ 'type_parameter': 'type param',
            \ '<default>': 'v'
            \ }
" deoplete
" let g:deoplete#enable_at_startup = 1

" coc
"source $HOME/.config/nvim/config/plugin-settings-coc.vim
nmap <silent> gd <Plug>(coc-definition)
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nmap <leader>rn <Plug>(coc-rename)



" vim-highlightedyank
hi HighlightedyankRegion cterm=reverse gui=reverse

" nerdcommenter
let g:NERDSpaceDelims            = 1  " space after comment delimiter
let g:NERDCompactSexyComs        = 1  " prettify multi-line
let g:NERDDefaultAlign           = 'left'
let g:NERDCustomDelimiters       = { 'c' : { 'left' : '//', 'right' : '' } }
let g:NERDCommentEmptyLines      = 1  " comment blank lines
let g:NERDTrimTrailingWhitespace = 1  " trim trailing whitespace

" <leader>cs to force commenting of first line comment
map  <leader>c <Plug>NERDCommenterToggle
imap ,c        <C-o>:execute "normal \<Plug>NERDCommenterToggle"<CR>

" nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeCascadeSingleChildDir=0
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

" tagbar
nmap <C-b> :TagbarToggle<CR>


" enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()

" set completeopt to be what ncm2 expects
" set completeopt=noinsert,menuone,noselect

" Format on save, if desired
" augroup fmt
"   autocmd!
"   autocmd BufWritePre * undojoin | Neoformat
" augroup END

" To Run Manually
nnoremap <leader>fm :Neoformat<CR>


" All status line configuration goes here
set cmdheight=1
set display+=lastline

" general config
set laststatus=2 " always show status line
set showtabline=2 " always show tabline
set noshowmode " hide default mode text (e.g. INSERT) as airline already displays it

" airline config
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1  " buffers at the top as tabs
" let g:airline#extensions#tabline#show_tabs=0
let g:airline#extensions#tabline#show_tab_type=0
let g:airline#extensions#tmuxline#enabled=0
let g:airline_theme = 'dracula'
" let g:airline_theme = 'gruvbox'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1
let g:airline_symbols.linenr = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.readonly = ''
let g:airline#extensions#quickfix#quickfix_text = 'QF'
let g:airline#extensions#quickfix#location_text = 'LL'

" disable unused extensions (performance)
let g:airline#extensions#ctrlp#color_template = 'insert'
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#capslock#enabled   = 0
let g:airline#extensions#csv#enabled        = 0
let g:airline#extensions#ctrlspace#enabled  = 0
let g:airline#extensions#eclim#enabled      = 1
let g:airline#extensions#hunks#enabled      = 0
let g:airline#extensions#nrrwrgn#enabled    = 0
let g:airline#extensions#promptline#enabled = 0
let g:airline#extensions#syntastic#enabled  = 0
let g:airline#extensions#taboo#enabled      = 0
let g:airline#extensions#tagbar#enabled     = 0
let g:airline#extensions#virtualenv#enabled = 0
let g:airline#extensions#whitespace#enabled = 0

" tmuxline config
" let g:tmuxline_preset = {
"         \ 'a': '#S',
"         \ 'b': '#F',
"         \ 'c': '#W',
"         \ 'win': ['#I', '#W'],
"         \ 'cwin': ['#I', '#W'],
"         \ 'x': '#h',
"         \ 'y': '%b %d',
"         \ 'z': '%R'}
"
" " airline config
" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif
" "let g:airline_powerline_fonts = 1
"
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#buffer_idx_mode = 1
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline#extensions#tabline#left_sep = ''
" let g:airline#extensions#tabline#left_alt_sep = ''
" let g:airline#extensions#tabline#right_sep = ''
" let g:airline#extensions#tabline#right_alt_sep = ''
" let g:airline#extensions#tabline#formatter = 'default'
"
" " unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.crypt = '🔒'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.maxlinenr = '☰'
" let g:airline_symbols.maxlinenr = ''
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.spell = 'Ꞩ'
" let g:airline_symbols.notexists = '∄'
" let g:airline_symbols.whitespace = 'Ξ'
"
" " Theme ( github.com/vim-airline/vim-airline-themes
" let g:airline_theme= 'gruvbox'
