if &compatible
    set nocompatible
endif
set runtimepath^=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('~/.vim/dein'))
    call dein#begin(expand('~/.vim/dein'))

    call dein#add('Shougo/dein.vim')
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('Shougo/neocomplete')
    call dein#add('Shougo/vimproc.vim', {'build': 'make'})
    call dein#add('Konfekt/FastFold')
    call dein#add('osyo-manga/vim-reunions')
    call dein#add('osyo-manga/vim-marching')
    call dein#add('junegunn/vim-easy-align')
    call dein#add('scrooloose/syntastic.git')
    " Rust
    call dein#add('rust-lang/rust.vim.git')
    call dein#add('racer-rust/vim-racer.git')
    " OpenCL
    call dein#add('petRUShka/vim-opencl.git')

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable
set encoding=utf-8
scriptencoding utf-8

source ${HOME}/.vim/syntastic.vim
source ${HOME}/.vim/neocomplete.vim
source ${HOME}/.vim/neosnippet.vim
source ${HOME}/.vim/vim-marching.vim

"言語
set fileencodings=utf-8,sjis,iso-2022-jp,euc-jp
set fileformats=unix,dos,mac
set spelllang=en,cjk
set ambiwidth=double

"検索
set hlsearch
set smartcase
set wrapscan

"タブ・インデント
set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent

"対応する括弧
set showmatch
set matchtime=1

"補完
inoremap {<CR> {}<C-g>U<Left><CR><C-g>U<ESC>O

set foldmethod=syntax
set backspace=indent,eol,start
set scrolloff=3
set wildmode=longest:full
set formatoptions+=mM
set number
set ruler
set laststatus=2
set cmdheight=2
set showcmd
set title
set wrap
set display=lastline

"TeX
let g:tex_conceal=''

"lisp
let g:is_chicken=1
let g:lisp_rainbow=1

"rust
let g:rustfmt_autosave = 1
let g:rustfmt_command = $HOME . '/.cargo/bin/rustfmt'
let g:racer_cmd = $HOME . '/.cargo/bin/racer'

function! s:format_file()
    let view = winsaveview()
    normal gg=G
    call winrestview(view)
endfunction
nnoremap <Space>f :call <SID>format_file()<CR>

nnoremap Y y$
nnoremap <C-i> :set paste<CR>i
autocmd! InsertLeave * set nopaste

"中クリックでの誤爆防止
noremap <MiddleMouse> <Nop>
inoremap <MiddleMouse> <Nop>
noremap <2-MiddleMouse> <Nop>
inoremap <2-MiddleMouse> <Nop>
noremap <3-MiddleMouse> <Nop>
inoremap <3-MiddleMouse> <Nop>
noremap <4-MiddleMouse> <Nop>
inoremap <4-MiddleMouse> <Nop>

"swap, backup, undoファイルを $HOME/.vim/ の下に
set swapfile
let s:directory = expand("$HOME/.vim/swap")
if !isdirectory(s:directory)
    let s:retval = system("mkdir -p ".s:directory)
endif
execute "set directory=".s:directory
unlet s:directory

set backup
let s:backupdir = expand("$HOME/.vim/backup")
if !isdirectory(s:backupdir)
    let retval = system("mkdir -p ".s:backupdir)
endif
execute "set backupdir=".s:backupdir
unlet s:backupdir
function! s:UpdateBackupFile()
    let dir = expand(strftime("$HOME/.vim/backup/%Y/%m/%d", localtime()))
    if !isdirectory(dir)
        let s:retval = system("mkdir -p ".dir)
    endif
    execute "set backupdir=".dir
    let time = strftime("%H_%M_%S", localtime())
    execute "set backupext=.".time
endfunction
autocmd! BufWritePre,FileWritePre,FileAppendPre * call <SID>UpdateBackupFile()

set undofile
let s:undodir = expand("$HOME/.vim/undo")
if !isdirectory(s:undodir)
    let s:retval = system("mkdir -p ".s:undodir)
endif
execute "set undodir=".s:undodir
unlet s:undodir

