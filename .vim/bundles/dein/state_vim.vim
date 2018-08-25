if g:dein#_cache_version !=# 100 || g:dein#_init_runtimepath !=# '/Users/vivo/.vim,/usr/share/vim/vimfiles,/usr/share/vim/vim80,/usr/share/vim/vimfiles/after,/Users/vivo/.vim/after,/Users/vivo/.vim/bundles/dein/repos/github.com/Shougo/dein.vim' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/Users/vivo/.vimrc'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/vivo/.vim/bundles/dein'
let g:dein#_runtime_path = '/Users/vivo/.vim/bundles/dein/.cache/.vimrc/.dein'
let g:dein#_cache_path = '/Users/vivo/.vim/bundles/dein/.cache/.vimrc'
let &runtimepath = '/Users/vivo/.vim,/usr/share/vim/vimfiles,/Users/vivo/.vim/bundles/dein,/Users/vivo/.vim/bundles/dein/.cache/.vimrc/.dein,/usr/share/vim/vim80,/Users/vivo/.vim/bundles/dein/.cache/.vimrc/.dein/after,/usr/share/vim/vimfiles/after,/Users/vivo/.vim/after,/Users/vivo/.vim/bundles/dein/repos/github.com/Shougo/dein.vim'
