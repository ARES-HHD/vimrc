" YouCompleteMe

NeoBundle 'Valloric/YouCompleteMe'

let g:ycm_python_binary_path = '/usr/bin/python3'

nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>ga :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
