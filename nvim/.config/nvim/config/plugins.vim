" Install vim-plug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin()
" lint / fix / complete
Plug 'dense-analysis/ale'
Plug 'autozimu/languageclient-neovim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'google/yapf'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Git
Plug 'tpope/vim-fugitive'

" Tmux
Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'

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
Plug 'jiangmiao/auto-pairs'
"Plug 'numirias/semshi'
Plug 'plasticboy/vim-markdown'
"Plug 'sbdchd/neoformat'

" utilities
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'tmhedberg/SimpylFold'
" zo： Open fold in current cursor postion
" zO： Open fold and sub-fold in current cursor postion recursively
" zc： Close the fold in current cursor position
" zC： Close the fold and sub-fold in current cursor position recursively
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
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-sensible'
Plug 'lilydjwg/colorizer', { 'on': 'ColorToggle' }
Plug 'myusuf3/numbers.vim'
Plug 'wavded/vim-stylus'
Plug 'ryanoasis/vim-devicons'

call plug#end()


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
