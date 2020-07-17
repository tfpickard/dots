" vim:fdm=marker
": Plugins {{{
" Install vim-plug if not installed


set verbose=2
set verbosefile=/tmp/nvim.log

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.local/nvim/plugged')
Plug 'vim-jp/vim-vimlparser'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-commentary'

Plug 'tpope/vim-obsession'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-unimpaired'
Plug 'terryma/vim-multiple-cursors'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'vim-scripts/DrawIt'
Plug 'machakann/vim-highlightedyank'
Plug 'Yggdroot/indentLine'
Plug 'romainl/vim-cool'


Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'
Plug 'vim-scripts/Mouse-Toggle'


" completion/snippets/linters
  " Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/coc-actions', {'do': 'yarn install'}
Plug 'voldikss/coc-browser', {'do': 'yarn install --frozen-lockfile'}
Plug 'weirongxu/coc-explorer', {'do': 'yarn install'}
Plug 'neoclide/coc-git', {'do': 'yarn install'}
Plug 'fannheyward/coc-markdownlint', {'do': 'yarn install'}
Plug 'fannheyward/coc-marketplace', {'do': 'yarn install'}
Plug 'neoclide/coc-python', {'do': 'yarn install'}
Plug 'fannheyward/coc-pyright', {'do': 'yarn install'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install'}
Plug 'neoclide/coc-solargraph', {'do': 'yarn install'}
Plug 'voldikss/coc-template', {'do': 'yarn install'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-vimlsp', {'do': 'yarn install'}

" Plug 'dense-analysis/ale'
  Plug 'honza/vim-snippets'
  Plug 'Shougo/neosnippet-snippets'
  Plug 'tomtom/tlib_vim'
  Plug 'marcweber/vim-addon-mw-utils'
  Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
  Plug 'Shougo/denite.nvim', {'do': ':UpdateRemotePlugins'}
  Plug 'shougo/neoyank.vim'
  Plug 'fisadev/vim-isort', {'for': 'python'}
  Plug 'tell-k/vim-autoflake', {'for': 'python'}
  Plug 'nvie/vim-flake8'
  Plug 'rhysd/vim-clang-format', {'for': 'cpp'}

  " syntax
  Plug 'lervag/vimtex', {'for': 'tex'}
  Plug 'bfredl/nvim-ipy', {'for': 'python', 'do': ':UpdateRemotePlugins'}
  Plug 'vimjas/vim-python-pep8-indent'
  Plug 'fatih/vim-go', {'for': 'go'} ", 'do': ':GoUpdateBinaries'}
  Plug 'Glench/Vim-Jinja2-Syntax', {'for': 'jinja'}
  Plug 'chrisbra/csv.vim'
  Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
  Plug 'sheerun/vim-polyglot'
  Plug 'vim-python/python-syntax'
  Plug 'xuhdev/syntax-dosini.vim'


  " sessions
  Plug 'vim-scripts/restore_view.vim'
  Plug 'gioele/vim-autoswap'


" lint / fix / complete
Plug 'google/yapf'

" Git

" Tmux
Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
  Plug 'wellle/tmux-complete.vim'


" python
" Plug 'davidhalter/jedi-vim'
" Plug 'jeetsukumaran/vim-pythonsense'
" Plug 'liuchengxu/vista.vim'
Plug 'jiangmiao/auto-pairs'
" Plug 'numirias/semshi'
Plug 'plasticboy/vim-markdown'
" Plug 'sbdchd/neoformat'

" utilities
Plug 'preservim/nerdcommenter'
Plug 'tomtom/tcomment_vim'
Plug 'mhinz/vim-startify'
Plug 'vimwiki/vimwiki'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
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
Plug 'vim-scripts/sudo.vim'
Plug 'roxma/nvim-yarp'

" status line
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'liuchengxu/eleline.vim'

" Plug 'itchyny/lightline.vim'
" Plug 'mgee/lightline-bufferline' " For tabs on top
" appearance
"Plug 'baskerville/bubblegum'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'

Plug 'nathanaelkane/vim-indent-guides'

" Plug 'lilydjwg/colorizer', { 'on': 'ColorToggle' }
Plug 'norcalli/nvim-colorizer.lua'
Plug 'myusuf3/numbers.vim'
Plug 'wavded/vim-stylus'
Plug 'ryanoasis/vim-devicons'
Plug 'chrisbra/unicode.vim'

call plug#end()
set termguicolors
lua require'colorizer'.setup()

nnoremap <C-p> :Files<ENTER>
if has('nvim')
  aug fzf_setup
    au!
    au TermOpen term://*FZF tnoremap <silent> <buffer><nowait> <esc> <c-c>
  aug END
end
"
" " Format on save, if desired
" augroup fmt
"   autocmd!
"   autocmd BufWritePre * undojoin | Neoformat
" augroup END
"
" To Run Manually
" nnoremap <leader>fm :Neoformat<CR>

"
" ": directories {{{
" set browsedir=buffer
" set wildignore=*.o,*.pyc,*__pycache__/,*.egg-info/
" set wildmode=list:longest,list:full
" set wildignorecase
" set autochdir
" " }}}
"
" persistence {{{
set hidden
set undofile
set viewoptions=cursor,folds,slash,unix
set sessionoptions=buffers
" }}}

" visual elements {{{
set visualbell
set confirm
set showmatch
set hlsearch
set incsearch
set number
set cursorline
set cursorcolumn "guibg=#404040
set relativenumber
set cc=80
set splitbelow
set splitright
set spelllang=en_us.utf-8

set foldlevelstart=10   " open most folds by default
"
" ==================================================
" XML folding
" ==================================================
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

" ==================================================
" JSON folding
" ==================================================
au FileType json setlocal foldmethod=syntax
au FileType yaml setlocal foldmethod=syntax

" set foldlevel=80
" }}}

nmap <leader>/ :nohlsearch<CR>
nnoremap <space> za


" tab/indentation settings {{{
set modeline
set modelines=5
set modelineexpr

set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set shiftround
set autoindent
set smartindent
if has('linebreak')      " Break indent wrapped lines
  set breakindent
  let &showbreak = '↳ '
  set cpo+=n
end
" }}}


syntax enable
syntax on
" misc {{{
set infercase
set shell=/usr/bin/bash
" set omnifunc=syntaxcomplete#Complete
set grepprg=ag\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m
" set completeopt=menu
set mouse=a
set ignorecase
set smartcase
set infercase
" }}}
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

let g:python3_host_prog = '/usr/bin/python3'
let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'nvim',
      \ 'help'
      \]

set pastetoggle=<F3>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
noremap <silent> <m-h> :TmuxNavigateLeft<cr>
noremap <silent> <m-j> :TmuxNavigateDown<cr>
noremap <silent> <m-k> :TmuxNavigateUp<cr>
noremap <silent> <m-l> :TmuxNavigateRight<cr>

set bg=dark
" colorscheme gruvbox
" colorscheme dracula
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_enable_italic_comment = 1
colorscheme gruvbox-material

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

" Define mappings
autocmd FileType python map <buffer> <leader>af :call Autoflake()<CR>

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
" let g:ale_linters = {
"     \   'css': ['csslint', 'prettier'],
"     \   'c': ['clang', 'clangd', 'ccls','gcc'],
"     \   'cpp': ['clang', 'clangd', 'ccls','gcc','cpplint'],
"     \   'cuda': ['clang-format', 'nvcc'],
"     \   'cmake': ['cmakelint'],
"     \   'git': ['gitlint'],
"     \   'git commit': ['gitlint'],
"     \   'javascript': ['eslint'],
"     \   'json': ['jsonlint','jq'],
"     \   'lua': ['luac','luacheck'],
"     \   'python': ['flake8'],
"     \   'ruby': ['standardrb', 'rubocop'],
"     \   'sh': ['sh-language-server','shellcheck','shfmt'],
"     \    'vim': ['vimls','vint'],
"     \   'yaml': ['yamllint', 'prettier']
"       \}
"             " \   '*': ['remove_trailing_lines', 'trim_whitespace'],
" let g:ale_fixers = {
"             \   'sh': ['bash_language_server', 'start'],
"             \   'python': [
"             \       'black',
"             \       'yapf',
"             \       'add_blank_lines_for_python_control_statements',
"             \       'autopep8',
"             \       'isort',
"             \       'reorder-python-imports'
"             \   ],
"             \   'c': [
"             \       'clang',
"             \       'clangd',
"             \       'ccls',
"             \       'gcc'
"             \   ],
"             \   'yaml': ['prettier']
"             \}
" let g:ale_fixers = ['remove_trailing_lines', 'trim_whitespace']
" let g:ale_javascript_prettier_options = '--single-quote --trailing-comma all'
" let g:ale_yaml_prettier_options = '--single-quote --trailing-comma all'

" nmap <leader>ff <Plug>(ale_fix)
" nmap <leader>af ALEFix<CR>
" let g:ale_fix_on_save = 1
" nmap <silent> <C-e> <Plug>(ale_next_wrap)
" let g:ale_linters_explicit = 0

let g:ale_python_flake8_executable = '/usr/bin/flake8'
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
" let g:ale_completion_enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#coc#enabled = 1
let airline#extensions#ale#error_symbol = 'e:'
let airline#extensions#ale#warning_symbol = 'w:'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_echo_msg_error_str = 'e'
let g:ale_echo_msg_warning_str = 'w'
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
autocmd VimEnter * if argc() == 0 && !exists("s:std_in")
            \ && v:this_session == "" | NERDTree | endif

" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0])
"             \ && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene
"                 \ | exe 'cd '.argv()[0] | endif

map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
            \ && b:NERDTree.isTabTree()) | q | endif

let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeCascadeSingleChildDir=0
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

command! -nargs=0 Prettier :CocCommand prettier.formatFile
map <leader>L :Prettier

" tagbar
nmap <C-b> :TagbarToggle<CR>



" All status line configuration goes here
set cmdheight=2
set display+=lastline
set updatetime=300
set shortmess+=c
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" general config
set laststatus=2 " always show status line
set showtabline=2 " always show tabline
set noshowmode " hide default mode text (e.g. INSERT) as airline already displays it


": {{{ lightline config
let g:lightline#bufferline#enable_devicons = 1
let g:lightline = {
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ 'tabline': {
      \   'left': [['buffers']],
      \   'right': [[ 'exit' ]],
      \ },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers',
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ }
let g:lightline#bufferline#shorten_path = 1
": }}}

" ========================================================
" airline config

let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1  " buffers at the top as tabs
let g:airline#extensions#tabline#show_tab_type=1
let g:airline#extensions#tmuxline#enabled=0
let g:airline_theme = 'gruvbox_material'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1
let g:airline_symbols.linenr = '#'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.readonly = ''
let g:airline#extensions#quickfix#quickfix_text = 'QF'
let g:airline#extensions#quickfix#location_text = 'LL'

" disable unused extensions (performance)
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#capslock#enabled   = 0
let g:airline#extensions#csv#enabled        = 0
let g:airline#extensions#ctrlspace#enabled  = 0
let g:airline#extensions#eclim#enabled      = 1
let g:airline#extensions#hunks#enabled      = 1
let g:airline#extensions#nrrwrgn#enabled    = 0
let g:airline#extensions#promptline#enabled = 0
let g:airline#extensions#syntastic#enabled  = 0
let g:airline#extensions#taboo#enabled      = 0
let g:airline#extensions#tagbar#enabled     = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#whitespace#enabled = 1

let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'jsformatter'
"
" " unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.maxlinenr = '☰'
" let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'
" let g:pymode_rope_completion = 0
let g:pymode_folding = 0
let g:pymode_rope = 0
let g:pymode_trim_whitespaces = 0
let g:pymode_lint = 0
let g:pymode_doc = 0




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neoclide/coc.nvim plugin configurations.

" Table of contents:
" => Vim settings
" => Usage keymaps
" => CocList
" => Autocommands
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Some servers have issues with backup files.
set nobackup
set nowritebackup

" Bigger messages display.
"TODO consider changing this.
set cmdheight=1

" Faster diagnostic messages (defaults 4000)
set updatetime=200

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Have a signs colum on the left
set signcolumn=yes

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Usage keymaps.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use tab to trigger completion and navigate.
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" ctrl-space to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to comfirm completion.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Keys for gotos.
" Add any filetype with an lsp to this au.
autocmd FileType c,cpp nmap <silent> gd <Plug>(coc-declaration)
nmap <silent> gw <Plug>(coc-type-definition)
nmap <silent> gy <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window (Or :help for vim keywords).
nnoremap <silent> K :call <SID>show_documentation()<CR>
" Close a help floating window.
nmap <silent> <c-[> <esc>:noh<cr><Plug>(coc-float-hide)

" Rename current word.
"TODO it works in a weird way, that until you save all buffer, the new name is
"not recognized. Do that it will keep analytics before saving.
nmap <leader>lr <Plug>(coc-rename)

" Format selected region.
xmap <leader>lf  <Plug>(coc-format-selected)
nmap <leader>lf  <Plug>(coc-format-selected)

" Do codeAction for selected region, ex: `<leader>laap` for current paragraph.
"TODO realise how you choose the action.
"TODO look for useful actions, and maybe map them separately.
xmap <leader>la  <Plug>(coc-codeaction-selected)
nmap <leader>la  <Plug>(coc-codeaction-selected)

" Do codeAction of current line.
nmap <leader>lc  <Plug>(coc-codeaction)
" Fix autofix problem of current line.
nmap <leader>lq  <Plug>(coc-fix-current)

" Create mappings for function text object (requires document symbols feature of languageserver).
"TODO this is probably like i} and a} (like di}, da}). CONFIRM this!
"TODO this doesnt work!!!
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" Not supported by ccls.
"TODO understand what this does!
"nmap <silent> <C-d> <Plug>(coc-range-select)
"xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)
command! -nargs=? Unfold :0,$foldopen

" use `:OR` to organize imports of current buffer.
"TODO understand this. you seem to dont have this action. check if ccls has
"it, and generally what the hell is it.
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support for integration with other plugins. checkout `:h coc-status`
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CocList
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show all diagnostics.
nnoremap <silent> <leader>fa  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <leader>fe  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <leader>fc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <leader>fo  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <leader>fs  :<C-u>CocList -I symbols<cr>
" Do default action for next item in the last list.
nnoremap <silent> <leader>fj  :<C-u>CocNext<CR>
" Do default action for previous item in the last list.
nnoremap <silent> <leader>fk  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <leader>fp  :<C-u>CocListResume<CR>
" Find files in cwd.
nnoremap <silent> <leader>ff  :<C-u>CocList files<CR>
" List all errors (bugs).
nnoremap <silent> <leader>fb :<C-u>CocList locationlist<CR>
" Find buffers.
"TODO map <c-s> and <c-v> to open with splits.
nnoremap <silent> <leader>bf  :<C-u>CocList buffers<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Fix enter key behavior quickfix window
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType json setlocal formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    "TODO realise exactly what this does.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

nmap <space>e :CocCommand explorer<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction


function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction




function! Fzf_dev()
  function! s:files()
    let files = split(system($FZF_DEFAULT_COMMAND), '\n')
    return s:prepend_icon(files)
  endfunction

  function! s:prepend_icon(candidates)
    let result = []
    for candidate in a:candidates
      let filename = fnamemodify(candidate, ':p:t')
      let icon = WebDevIconsGetFileTypeSymbol(filename, isdirectory(filename))
      call add(result, printf("%s %s", icon, candidate))
    endfor

    return result
  endfunction

  function! s:edit_file(item)
    let parts = split(a:item, ' ')
    let file_path = get(parts, 1, '')
    execute 'silent e' file_path
  endfunction

  call fzf#run({
        \ 'source': <sid>files(),
        \ 'sink':   function('s:edit_file'),
        \ 'options': '-m -x +s',
        \ 'down':    '40%' })
endfunction

autocmd FileType json syntax match Comment +\/\/.\+$+
" define less filetype
au BufNewFile,BufRead *.less set filetype=less

" make the smarty .tpl files html files for our purposes
au BufNewFile,BufRead *.tpl set filetype=html

" json
au! BufRead,BufNewFile *.json set filetype=json
" yaml
au! BufRead,BufNewFile *.yaml set filetype=yaml
au! BufRead,BufNewFile *.yml set filetype=yaml

" jquery
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype xhtml setlocal ts=2 sw=2 expandtab
autocmd Filetype xml setlocal ts=2 sw=2 expandtab
autocmd Filetype css setlocal ts=2 sw=2 expandtab
autocmd Filetype less setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 noexpandtab
autocmd Filetype python setlocal omnifunc=jedi#completions tw=79
                                \ completeopt-=preview
                                \ formatoptions+=c

" RustFmt uses 100 for line width
autocmd bufreadpre *.rs setlocal colorcolumn=100

" snipMate
autocmd FileType html set ft=htmldjango.html " For SnipMate


" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>
" command! FilesWithIcon :call Fzf_dev()
" vim: set ts=4 sw=4 tw=79 et :
