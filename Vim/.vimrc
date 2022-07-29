"Plugin install
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'dense-analysis/ale' "https://github.com/dense-analysis/ale
Plugin 'Yggdroot/indentLine' "https://github.com/Yggdroot/indentLine
Plugin 'pedrohdz/vim-yaml-folds' "https://github.com/pedrohdz/vim-yaml-folds
Plugin 'airblade/vim-gitgutter' "https://github.com/airblade/vim-gitgutter
Plugin 'tpope/vim-fugitive' "https://tpope.io/vim/fugitive.git
Plugin 'tpope/vim-surround' "https://github.com/tpope/vim-surround
Plugin 'tpope/vim-commentary' "https://github.com/tpope/vim-commentary
Plugin 'tpope/vim-sensible' "https://github.com/ycm-core/YouCompleteMe
Plugin 'ycm-core/YouCompleteMe' "https://github.com/preservim/nerdcommenter
Plugin 'preservim/nerdcommenter' "https://github.com/tpope/vim-sensible
call vundle#end()
filetype plugin indent on

" Generic Settings
colorscheme zellner
syntax on

" Use the pathogen plugin manager
execute pathogen#infect()

" YAML Setup
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

set foldlevelstart=20

let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'
