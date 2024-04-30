"" Neovim config
""
""
"" Symbolic link
"" ln -s ~/github/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
""
"" Use plug to install vim plugins
"" :PlugInstall

""
"" Auto install Plug
""
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif


""
"" Plug START
""
call plug#begin()

"" Vim-go (for help, see `:help vim-go`)
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

"" Nerdtree file explorer
Plug 'preservim/nerdtree'

"" Git gutter shows git changes
Plug 'airblade/vim-gitgutter'
set updatetime=100

"" Lightline status bar
Plug 'itchyny/lightline.vim'
let g:lightline = { 'colorscheme': 'gotham256' }
"let g:lightline = { 'colorscheme': 'nord' }
set noshowmode

"" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }

"" Themes
Plug 'whatyouhide/vim-gotham'
Plug 'arcticicestudio/nord-vim'

call plug#end()
""
"" Plug END
""

""""""""""""""""""""""

"" Syntax highlighting
syntax on

"" Tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

"" Hide vsplit border
highlight VertSplit cterm=NONE
set fillchars+=vert:\ 

"" Key mappings
let mapleader = "\<Space>"
let g:gitgutter_map_keys = 0 "" disable git-gutter keybindings
map <leader>h <C-w>h
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>l <C-w>l
map <leader># :set number!<CR> "" toggle line numbers
map <leader>m :MarkdownPreview<CR>
map <f12> :NERDTreeToggle<CR>

"" Set theme
set background=dark
"colorscheme gotham256
colorscheme nord

