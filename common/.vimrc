set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" move backups files to other directory
set backupdir=~/.vimtemp,.
set dir=~/.vimtemp//,.

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set number              " show line numbers
set cf                  " Enable error files & error jumping.
set clipboard+=unnamed  " Yanks go on clipboard instead.

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'sheerun/vimrc'
Plugin 'sheerun/vim-polyglot'
Plugin 'scrooloose/nerdTree'
Plugin 'OmniCppComplete'
Plugin 'avakhov/vim-yaml'
Plugin 'altercation/vim-colors-solarized'
Plugin 'taglist.vim'
Plugin 'rails.vim'
Plugin 'hashivim/vim-vagrant'

" All of your Plugins must be added before the following line
call vundle#end()            " required

autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter * wincmd p
map <c-f> mzgg=G`z

