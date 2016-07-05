" YouCompleteMe

NeoBundle 'Valloric/YouCompleteMe'

let g:ycm_python_binary_path = '/usr/bin/python3'
set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口

nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>ga :YcmCompleter GoToDefinitionElseDeclaration<CR>
