source $HOME/.config/nvim/config/plugins.vim
source $HOME/.config/nvim/config/statusline.vim

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
colorscheme gruvbox


