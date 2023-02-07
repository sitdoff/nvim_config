set number
set encoding=utf-8
set autoindent
set mouse=a
set noswapfile

" Настройки табов
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent


" БЛОК ПЛАГИНОВ
call plug#begin()

" Файловое дерево слева
Plug 'preservim/nerdtree'

" Коментирование строк
Plug 'tpope/vim-commentary'

" Строка состояния
Plug 'itchyny/lightline.vim'

" Цветовые схемы
Plug 'morhetz/gruvbox'

call plug#end()

" БЛОК ХОТКЕЕВ
inorema jk <esc>
nnoremap <C-m> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

colorscheme gruvbox

