" clang コマンドの設定
let g:marching_clang_command = "clang"

" オプションを追加する場合
let g:marching#clang_command#options = {
            \"cpp" : "-std=c++17",
            \"cuda" : "-std=c++11"
            \}


" インクルードディレクトリのパスを設定
let g:marching_include_paths = [
            \   "/usr/include/",
            \   "/usr/include/c++/4.9.3/",
            \   "/usr/include/boost/",
            \   "/usr/local/cuda-8.0/include/"
            \]

" neocomplete.vim と併用して使用する場合
let g:marching_enable_neocomplcache = 1

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.cpp = 
            \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

" 処理のタイミングを制御する
" 環境に合わせて間隔を短くする
" set updatetime=200

" オムニ補完時に補完ワードを挿入したくない場合
imap <buffer> <C-x><C-o> <Plug>(marching_start_omni_complete)
