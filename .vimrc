set nocompatible
set formatoptions+=j
set hidden
set history=1000
set nrformats-=octal
set shell=/bin/fish
set nojoinspaces
set dir=~/.cache/vim
set nobackup
set bdir=~/.cache/vim
set undofile
set udir=~/.cache/vim
set undolevels=1000
set t_vb=
set noerrorbells
set novisualbell
set complete-=i
set ttyfast
set belloff=all
set display+=lastline
set encoding=utf-8
set linebreak
set nowrap
set breakat=\ \	;:,!?
set nostartofline
set ignorecase
set smartcase
set infercase
set incsearch
set hlsearch
set wrapscan
set noshowmatch
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=0
set autoindent
set smarttab
set laststatus=0
set noruler
set tabpagemax=50
set nocursorline
set number
set mouse-=a
set title
set background=dark
set noshowmode
set shortmess=aoOTI
set t_Co=256
set t_ut=
set nolist
set winwidth=20
set winheight=1
set pumheight=15
set guioptions=M
set mouse-=a
set helpheight=12
set previewheight=12
set noshowcmd
set wildmenu
set wildchar=<TAB>
set wildmode=list:full
set wildignore=*.o,*.obj,*~,*.git*,*.meteor*,*vim/backups*,*logs*,*.jpg
set wildignore+=*.gem,*.png,*.jpg,*.gif,log/**,tmp/**,*cache*
set foldmethod=indent
set foldnestmax=3
set nofoldenable
set timeout
set ttimeout
set timeoutlen=1000
set updatetime=1000
set switchbuf=useopen,usetab
set showfulltag
set completeopt+=menuone
set completeopt+=noselect
set completeopt+=noinsert
set shortmess+=FcfilmnrxoOtT
set secure
set noswapfile
set clipboard&
set clipboard+=unnamedplus
set nonumber
set signcolumn=no

call plug#begin()
Plug 'dylanaraps/wal.vim'
Plug 'sheerun/vim-polyglot'
call plug#end()

silent! filetype plugin indent on
syntax enable

let g:ctrlp_map = '<c-p>'
let g:mapleader=' '

nnoremap Q q

tnoremap <ESC> <C-\><C-n>
tnoremap jj <C-\><C-n>
tnoremap j<Space> j
tnoremap <expr> ; vimrc#sticky_func()

vnoremap < <gv
vnoremap > >gv

imap <C-BS> <C-W>

cnoreabbrev q q!

for i in range(1, 8)
  execute "nmap \<Leader> " . i . "gt"
endfor

inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

function! s:tab_complete()
    if pumvisible()
        return "\<c-n>"
    else
        return "\<tab>"
    endif
endfunction

smap <silent><expr><TAB> <SID>tab_complete()
imap <silent><expr><TAB> <SID>tab_complete()

nnoremap <silent> <c-j> :m .+1<CR>==
nnoremap <silent> <c-k> :m .-1<CR>==
inoremap <silent> <c-j> <Esc>:m .+1<CR>==gi
inoremap <silent> <c-k> <Esc>:m .-2<CR>==gi
vnoremap <silent> <c-j> :m '>+1<CR>gv=gv
vnoremap <silent> <c-k> :m '<-2<CR>gv=gv

nnoremap <silent> <c-l>  "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>:nohlsearch<CR>
nnoremap <silent> <c-h> "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>:nohlsearch<CR>
nnoremap <silent> <c-p> {dap}p{

nnoremap j gj
nnoremap k gk
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

au BufRead,BufNewFile *.md setlocal wrap
au BufRead,BufNewFile *.md setlocal spell spelllang=en_us
autocmd BufNewFile,BufRead *.list set syntax=yaml

if has('termguicolors')
    set termguicolors
endif

syntax enable

colorscheme wal

