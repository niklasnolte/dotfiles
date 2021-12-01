source $VIMRUNTIME/defaults.vim

set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tomasiser/vim-code-dark'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
call vundle#end()
filetype plugin indent on

"commenting
let g:NERDCommentEmptyLines = 1
let g:NERDDefaultAlign = 'left'
let g:NERDUsePlaceHolders = 0
nnoremap <C-@> :call nerdcommenter#Comment(0,"toggle")<CR>
vnoremap <C-@> :call nerdcommenter#Comment(0,"toggle")<CR>

"for airline
let g:airline#extensions#tabline#enabled = 1

"for Ctrlp
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
  let g:ctrlp_working_path_mode = 0
  let g:ctrlp_open_multiple_files = 'i'
endif
let g:ctrlp_working_path_mode = 0

"misc
set hlsearch
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set viminfo='20,<10000
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
colorscheme codedark
let g:airline_theme = 'codedark'
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
nnoremap <C-n> :bprev<CR>
nnoremap <C-m> :bnext<CR>
nnoremap <C-b> :bd<CR>
"do not need to save buffer
set hidden
set ignorecase
set wildignorecase

" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction
map <F2> :call TrimWhiteSpace()<CR>

"coc configuration

"fix current line
nmap <leader>qf  <Plug>(coc-fix-current)
"show docs
nnoremap <silent> K :call <SID>show_documentation()<CR>
"goto definition
nnoremap <silent> <leader>go :call CocAction('jumpDefinition')<CR>
"format
nnoremap <silent> <leader>ff :call CocAction('format')<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Close preview window after completion is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" swapping elements
:vnoremap <C-X> <Esc>`.``gvP``P
