" deoplete
let g:deoplete#enable_at_startup = 1

" coc
source $HOME/.config/nvim/config/plugin-settings-coc.vim

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

