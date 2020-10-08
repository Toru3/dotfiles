call plug#begin('~/.vim/plugged')
Plug 'Konfekt/FastFold'
Plug 'junegunn/vim-easy-align'
" lang
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
" LSP & complete
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-neosnippet.vim'
call plug#end()
syntax enable
filetype plugin indent on
set encoding=utf-8
scriptencoding utf-8

"vim-lsp
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
                \ 'name': 'pyls',
                \ 'cmd': {server_info->['pyls']},
                \ 'allowlist': ['python'],
                \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gy <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)

    " refer to doc to add more commands
endfunction

augroup lsp_install
    autocmd!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

"言語
set fileencodings=utf-8,iso-2022-jp,sjis,cp932,euc-jp
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
set softtabstop=-1
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
set formatoptions+=mMj
set number
set title
set wrap
set display=lastline
"下の表示
set laststatus=2
set statusline=%f%h%m%r%w%q%=[%{&ff},%{&fenc!=''?&fenc:&enc}%Y]\ %-14.(%l,%c%V%)\ %P
set showcmd
set cmdheight=2

"C++
" Don't indent namespace and template
function! CppNoNamespaceAndTemplateIndent()
    let l:cline_num = line('.')
    let l:cline = getline(l:cline_num)
    let l:pline_num = prevnonblank(l:cline_num - 1)
    let l:pline = getline(l:pline_num)
    while l:pline =~# '\(^\s*{\s*\|^\s*//\|^\s*/\*\|\*/\s*$\)'
        let l:pline_num = prevnonblank(l:pline_num - 1)
        let l:pline = getline(l:pline_num)
    endwhile
    let l:retv = cindent('.')
    let l:pindent = indent(l:pline_num)
    if l:pline =~# '^\s*template\s*\s*$'
        let l:retv = l:pindent
    elseif l:pline =~# '\s*typename\s*.*,\s*$'
        let l:retv = l:pindent
    elseif l:cline =~# '^\s*>\s*$'
        let l:retv = l:pindent - &shiftwidth
    elseif l:pline =~# '\s*typename\s*.*>\s*$'
        let l:retv = l:pindent - &shiftwidth
    elseif l:pline =~# '^\s*namespace.*'
        let l:retv = 0
    endif
    return l:retv
endfunction
augroup cplusplus
    autocmd!
    autocmd BufEnter *.{c,cpp,h,hpp,cu,cuh} setlocal indentexpr=CppNoNamespaceAndTemplateIndent()
augroup END

"TeX
let g:tex_conceal=''

"lisp
let g:is_chicken=1
let g:lisp_rainbow=1

"rust
let g:rustfmt_autosave = 0
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
set directory=~/.vim/swap

set backup
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
set undodir=~/.vim/undo
