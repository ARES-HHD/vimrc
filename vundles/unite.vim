" Unite and create user interfaces
NeoBundle 'Shougo/unite.vim'
" MRU plugin of unite
NeoBundle 'Shougo/neomru.vim'
" outline source for unite.vim
NeoBundle 'Shougo/unite-outline'
NeoBundle 'soh335/unite-outline-go'

let g:unite_abbr_highlight = 'Comment' 

let g:unite_source_history_yank_enable    = 1
let g:unite_source_rec_max_cache_files    = 5000

if !exists('g:unite_source_menu_menus')
    let g:unite_source_menu_menus = {}
endif
let g:unite_source_menu_menus.git = {
    \ 'description' : '            gestionar repositorios git
        \                            ⌘ [espacio]g',
    \}
let g:unite_source_menu_menus.git.command_candidates = [
    \['▷ tig                                                        ⌘ ,gt',
        \'normal ,gt'],
    \['▷ git status       (Fugitive)                                ⌘ ,gs',
        \'Gstatus'],
    \['▷ git diff         (Fugitive)                                ⌘ ,gd',
        \'Gdiff'],
    \['▷ git commit       (Fugitive)                                ⌘ ,gc',
        \'Gcommit'],
    \['▷ git log          (Fugitive)                                ⌘ ,gl',
        \'exe "silent Glog | Unite quickfix"'],
    \['▷ git blame        (Fugitive)                                ⌘ ,gb',
        \'Gblame'],
    \['▷ git stage        (Fugitive)                                ⌘ ,gw',
        \'Gwrite'],
    \['▷ git checkout     (Fugitive)                                ⌘ ,go',
        \'Gread'],
    \['▷ git rm           (Fugitive)                                ⌘ ,gr',
        \'Gremove'],
    \['▷ git mv           (Fugitive)                                ⌘ ,gm',
        \'exe "Gmove " input("destino: ")'],
    \['▷ git push         (Fugitive, salida por buffer)             ⌘ ,gp',
        \'Git! push'],
    \['▷ git pull         (Fugitive, salida por buffer)             ⌘ ,gP',
        \'Git! pull'],
    \['▷ git prompt       (Fugitive, salida por buffer)             ⌘ ,gi',
        \'exe "Git! " input("comando git: ")'],
    \['▷ git cd           (Fugitive)',
        \'Gcd'],
    \]

function! s:unit_settings()
    nmap <buffer> Q <Plug>(unite_exit)
    nmap <buffer> <Esc> <Plug>(unite_exit)
endfunction
autocmd FileType unite call s:unit_settings()

if executable('hw')
  " Use hw (highway)
  " https://github.com/tkengo/highway
  let g:unite_source_grep_command = 'hw'
  let g:unite_source_grep_default_opts = '--no-group --no-color'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ag')
  " Use ag (the silver searcher)
  " https://github.com/ggreer/the_silver_searcher
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
    \ '-i --vimgrep --hidden --ignore ' .
    \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''
elseif executable('pt')
  " Use pt (the platinum searcher)
  " https://github.com/monochromegane/the_platinum_searcher
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
  " Use ack
  " http://beyondgrep.com/
  let g:unite_source_grep_command = 'ack-grep'
  let g:unite_source_grep_default_opts =
    \ '-i --no-heading --no-color -k -H'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('jvgrep')
  " Use jvgrep
  " https://github.com/mattn/jvgrep
  let g:unite_source_grep_command = 'jvgrep'
  let g:unite_source_grep_default_opts =
    \ '-i --exclude ''\.(git|svn|hg|bzr)'''
  let g:unite_source_grep_recursive_opt = '-R'
endif

nmap <Space> [unite]
nnoremap [unite] <Nop>
nnoremap <silent> [unite]<space> :<C-U>Unite -auto-resize -buffer-name=mixed -toggle buffer file_mru file bookmark file_rec/async:!<CR><C-U>
nnoremap <silent> [unite]f :<C-U>Unite -auto-resize -silent -buffer-name=files -start-insert -toggle file<CR><C-U>
nnoremap <silent> [unite]e :<C-U>Unite -auto-resize -silent -buffer-name=recent -start-insert file_mru<CR>
nnoremap <silent> [unite]y :<C-U>Unite -auto-resize -silent -buffer-name=yanks history/yank<CR>
nnoremap <silent> [unite]l :<C-U>Unite -auto-resize -silent -buffer-name=line -start-insert line<CR>
nnoremap <silent> [unite]b :<C-U>Unite -auto-resize -silent -buffer-name=buffers buffer<CR>
nnoremap <silent> [unite]/ :<C-U>Unite -auto-resize -silent -buffer-name=search -no-quit grep:.<CR>
nnoremap <silent> [unite]m :<C-U>Unite -auto-resize -silent -buffer-name=mappings mapping<CR>
nnoremap <silent> [unite]o :<C-U>Unite -auto-resize -silent -buffer-name=outline outline<CR>
nnoremap <silent> [unite]g :<C-U>Unite -auto-resize -silent -buffer-name=menu -start-insert menu:git<CR>
