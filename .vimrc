" --- Basic setup ---
set nocompatible              " be iMproved, required
filetype off                  " required

" --- Vundle setup ---
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" --- Plugins ---
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin '42paris/42header'
Plugin 'airblade/vim-gitgutter'
Plugin 'morhetz/gruvbox'
Plugin 'zekzekus/menguless'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'

call vundle#end()            " required
filetype plugin indent on    " required

" --- Editor settings ---
set nu
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
set cursorline
set smartindent
set termguicolors
set mouse=a
set colorcolumn=80
set signcolumn=yes           " show GitGutter signs
set laststatus=2             " always show statusline
set hlsearch
set clipboard=unnamedplus

" --- GitGutter configuration ---
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
highlight GitGutterAdd    ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1

" --- Statusline configuration ---
set statusline=%#StatusLine#
" File info
set statusline=%f%m%r

" Git branch and changes
set statusline+=\ [%{exists('b:gitgutter_head')?b:gitgutter_head:''}]
set statusline+=\ [%{exists('b:gitgutter_summary')?'+'.b:gitgutter_summary.added.'~'.b:gitgutter_summary.modified.'-'.b:gitgutter_summary.removed:''}]

" Align right
set statusline+=%=

" Filetype, percentage, position
set statusline+=%y
set statusline+=\ [%p%%]
set statusline+=\ [%l:%c]

" --- Appearance ---
colorscheme gruvbox
set background=dark

" Force colorcolumn highlight to red (ignore colorscheme)
highlight ColorColumn ctermbg=red guibg=#ff0000
augroup PersistentColorColumn
  autocmd!
  autocmd ColorScheme * highlight ColorColumn ctermbg=red guibg=#ff0000
augroup END

" --- 42 school header settings ---
let $MAIL = "ryatan@student.42singapore.sg"
let g:user42 = 'ryatan'
let g:mail42 = 'ryatan@student.42singapore.sg'

" --- Auto refresh GitGutter on buffer events ---
autocmd BufEnter,BufWritePost * GitGutter

" --- netrw file display ---
let g:netrw_liststyle = 1

" --- for fzf --
nnoremap <C-f> :Files<Cr>
nnoremap <C-s> :Rg<Cr>

" --- for removing hl when search --
nnoremap <esc><esc> :noh<cr> 
