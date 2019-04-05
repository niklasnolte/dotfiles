source $VIMRUNTIME/defaults.vim

set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'arcticicestudio/nord-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Bundle 'nelstrom/vim-visual-star-search'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ctrlpvim/ctrlp.vim'
call vundle#end()
filetype plugin indent on

"commenting
let g:NERDCommentEmptyLines = 1
let g:NERDDefaultAlign = 'left'
let g:NERDUsePlaceHolders = 0
nnoremap <C-@> :call NERDComment(0,"toggle")<CR>
vnoremap <C-@> :call NERDComment(0,"toggle")<CR>

"for YCM
let g:ycm_global_ycm_extra_conf = '/home/nn/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1

"for airline
let g:airline#extensions#tabline#enabled = 1

"for Ctrlp
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

"clang formatting
map <C-K> :pyf /usr/share/clang/clang-format.py<cr>
imap <C-K> <c-o>:pyf /usr/share/clang/clang-format.py<cr>



set hlsearch
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set viminfo='20,<10000
set clipboard=unnamed
set paste
set backupdir=~/.vimbackup
set directory=~/.vimbackup
"persistent undo
set undofile
set undodir=~/.vimbackup

set shiftwidth=2
set expandtab
set tabstop=2
set showcmd
set wildmenu
let g:nord_comment_brightness = 1
colorscheme nord
set history=10000
set mouse=a
autocmd VimLeave * call system('echo ' . shellescape(getreg('+')) . ' | xclip -selection clipboard')
"better moving through multiple line instructions
nnoremap j gj
nnoremap k gk
"copying into clipboard
nnoremap <C-y> "*y
vnoremap <C-y> "*y
nnoremap <C-p> "*gP
vnoremap <C-p> "*gP
"multiple files handling
"nnoremap <C-t> :tabnew<CR>
"nnoremap <C-n> :tabnext<CR>
nnoremap <C-n> :bprev<CR>
nnoremap <C-m> :bnext<CR>
nnoremap <C-b> :bd<CR>
"do not need to save buffer
set hidden
set ignorecase
set wildignorecase

set foldmethod=syntax
set foldlevel=0
set foldnestmax=1
" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction
map <F2> :call TrimWhiteSpace()<CR>
