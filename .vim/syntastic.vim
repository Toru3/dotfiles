set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_c_compiler = 'gcc'
let g:syntastic_c_compiler_options = ' -std=c11 -Wall -Wextra'

let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++1z -Wall -Wextra'

let g:syntastic_cuda_checkers = ['gcc -std=c++1y -Wall -Wextra']

let g:syntastic_tex_checkers = []

let g:syntastic_rust_rustc_exe = 'cargo check'
let g:syntastic_rust_rustc_fname = ''
let g:syntastic_rust_rustc_args = '--'
let g:syntastic_rust_checkers = ['rustc']
