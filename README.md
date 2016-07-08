vimrc
=====

My vimrc configuration.

# Setup

## Mac OS X / Linux


1. `sudo yum groupinstall "Development tools"`
1. `sudo yum install cmake python-devel`
1. `curl https://raw.githubusercontent.com/igotcha/vimrc/master/install.sh | sh`

**warning** Only tested in CentOS7
**note**: Need Vim 7.3.598 or higher with Python 2 or Python 3 support

## Windows

* Fuck Windows.

# Plugins

Plugins managed using [NeoBundle](https://github.com/Shougo/neobundle.vim). You can easily install, update or remove plugin with NeoBundle.

## YouCompleteMe

  **Key-map**

    * `<leader>gc` : GoToDeclaration
    * `<leader>gf` : GoToDefinition
    * `<leader>ga` : GoToDefinitionElseDeclaration


## [NERDTree](https://github.com/scrooloose/nerdtree) with [nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin)

The NERD tree allows you to explore your filesystem and to open files and directories. It presents the filesystem to you in the form of a tree which you manipulate with the keyboard and/or mouse. It also allows you to perform simple filesystem operations.

  **Note:** nerdtree-git-plugin is a plugin of NERDTree showing git status. Set `let g:NERDTreeShowGitStatus = 0` to disable it.

  **Key-map**

  * `<C-E>`:toggle nerdtree
  * `]c`: jump to next change
  * `[c`: jump to prev change

## [Fugitive](https://github.com/tpope/vim-fugitive)

Fugitive is a git wrapper.

  **Command**: `:h fugitive` for details.

## To be continue...
