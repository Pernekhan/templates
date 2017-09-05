"Pathogen for plugins management
filetype off
set nocompatible
"execute pathogen#infect()
"execute pathogen#helptags()
syntax on
filetype plugin indent on
set autoindent
set copyindent
set tabstop=4
set shiftwidth=4
set expandtab
set hlsearch " highlight search
set ignorecase " Ignore case when searching
set smartcase " Ignore case when searching lowercase
hi Search ctermfg=Blue ctermbg=Yellow cterm=bold,underline
hi Visual ctermbg=Yellow cterm=bold
hi CursorLine ctermbg=Yellow cterm=bold

"Highlighting the word in cursor
:nnoremap <tab> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

"when forgeting sudo before editing
cmap w!! w !sudo tee % >/dev/null

"Set to store large amount of history lines, default is 20
set history=700

"Search result appear in the middle of screen
:nnoremap n nzz
:nnoremap N Nzz
:nnoremap * *zz
:nnoremap # #zz
:nnoremap g* g*zz
:nnoremap g# g#zz

"Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"Replacing hightlighted search removal
nmap <silent> ,/ :nohlsearch<CR>

"Powerline settings
set laststatus=2   " Always show the statusline
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set encoding=utf-8 " Necessary to show Unicode glyphs
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors

"make every *.md a markdown file, not only the README.md
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

"mappings for not using <Esc> key and arrows for navigation
inoremap kj <Esc>
inoremap KJ <Esc>
noremap <Left>  <NOP>
noremap <Right> <NOP>
noremap <Up>    <NOP>
noremap <Down>  <NOP>

"Uppercase version for saving and closing
:command! W w
:command! Q q
:command! WQ wq
:command! Wq wq

" CDC = Change to Directory of Current file
:command! CDC lcd %:p:h

"4 spaces for tabs
set ts=4 sw=4 sts=4

"Command for soft wrapping of the text
command! -nargs=* Wrap set wrap linebreak nolist

"Highlight exceeding characters in Python (limit to 80 chars)
augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 80
    autocmd FileType python highlight Excess ctermbg=Red guibg=Black
    autocmd FileType python match Excess /\%80v.*/
    autocmd FileType python set nowrap
augroup END

"Do not change cursor after yank
:vmap y ygv<Esc>

" Omni autocompletion
set omnifunc=syntaxcomplete#Complete
" remove empty lines on save
autocmd BufWritePre * :%s/\s\+$//e

au BufWritePost .vimrc so ~/.vimrc
