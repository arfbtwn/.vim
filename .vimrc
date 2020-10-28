set background=dark
set number relativenumber
set ruler

set laststatus=2

set hlsearch

set scrolloff=3

set foldmethod=syntax
set foldnestmax=10
set foldlevelstart=1

set expandtab
set shiftwidth=4
set softtabstop=-1
 
set autoindent
set smartindent
set smarttab

set statusline=%<%t\ %h%m%r%=%-14.(%o,%l,%c%V%)\ %P
set wildmenu
set mouse=a

set hidden

set autochdir

set splitright
set splitbelow

set cursorline
set cursorcolumn

set breakindent
set breakindentopt=sbr
" I use a unicode curly array with a <backslash><space>
set showbreak=↪

set sidescroll=1
set sidescrolloff=10

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

augroup markdown
    autocmd!
    autocmd FileType markdown set spell spelllang=en_gb
augroup END

let g:xml_syntax_folding=1
augroup xml
    autocmd!
    autocmd fileType xml set foldmethod=syntax
augroup END

augroup git
    autocmd!
    autocmd FileType gitcommit set textwidth=72
    autocmd FileType gitcommit set spell spelllang=en_gb
augroup END

augroup tmux
    autocmd!
    autocmd BufNewFile,BufRead *.tmux set filetype=tmux
    autocmd BufNewFile,BufRead *.tmux set nospell
augroup END

syntax on
filetype plugin indent on

command! -nargs=* -range=% Xml <line1>,<line2>!xmllint --format <args> -
command! -nargs=* -range=% Column <line1>,<line2>!column -t -o ' ' <args>
command! -nargs=* -range=% Json <line1>,<line2>!json_pp --json_opt=canonical,pretty <args>
