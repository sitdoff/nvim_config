set number
set encoding=utf-8
set mouse=a
set noswapfile
set cursorline
set showmatch
let python_highlight_all = 1

" set scrolloff=7

" Настройки табуляции
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set fileformat=unix
filetype indent on


" БЛОК ПЛАГИНОВ
" junegunn/vim-plug
call plug#begin()

Plug 'dense-analysis/ale'

"Находит и подсвечивает символы LSP, а также выводит обзор классов, функций и методов вашего проекта.
Plug 'liuchengxu/vista.vim'

" Текстовые объекты Python и перемещение по ним
Plug 'jeetsukumaran/vim-pythonsense'

" Файловое дерево слева
Plug 'preservim/nerdtree'

" Коментирование строк
Plug 'tpope/vim-commentary'

" Строка состояния
Plug 'itchyny/lightline.vim'

" Цветовые схемы
Plug 'morhetz/gruvbox'

call plug#end()
let g:is_pythonsense_suppress_motion_keymaps = 1

" БЛОК ХОТКЕЕВ
inorema jk <esc>
nnoremap <C-m> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

colorscheme gruvbox

let g:ale_linters = {'python': 'all'}
let g:ale_fixers = {'python': ['isort', 'yapf', 'remove_trailing_lines', 'trim_whitespace']}

let g:ale_lsp_suggestions = 1
let g:ale_fix_on_save = 1
let g:ale_go_gofmt_options = '-s'
let g:ale_go_gometalinter_options = '— enable=gosimple — enable=staticcheck'
let g:ale_completion_enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] [%severity%] %code: %%s'
