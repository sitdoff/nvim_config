local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}
-----------------------------------------------------------
vim.g.mapleader = ' '
-----------------------------------------------------------
-- НАВИГАЦИЯ
-----------------------------------------------------------
-- Переключение вкладок
vim.api.nvim_set_keymap('n', '<S-l>', ':BufferLineCycleNext<CR>', default_opts)
vim.api.nvim_set_keymap('n', '<S-h>', ':BufferLineCyclePrev<CR>', default_opts)
-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
vim.keymap.set('n', '<C-Left>', require('smart-splits').resize_left)
vim.keymap.set('n', '<C-Down>', require('smart-splits').resize_down)
vim.keymap.set('n', '<C-Up>', require('smart-splits').resize_up)
vim.keymap.set('n', '<C-Right>', require('smart-splits').resize_right)
-- moving between splits
vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
-- swapping buffers between windows
vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)
-- для терминала
vim.keymap.set('t', '<C-[>', [[<Cmd>wincmd h<CR>]], opts)
-----------------------------------------------------------
-- РЕЖИМЫ
-----------------------------------------------------------

-----------------------------------------------------------
-- ПОИСК
-----------------------------------------------------------
-- Выключить подсветку поиска через комбинацию ,+<space>
--map('n', ',<space>', ':nohlsearch<CR>', {noremap = true})
-- Fuzzy Search. CTRL+a для поиска по файлам, CTRL+p для поиска по буфферам
vim.api.nvim_set_keymap('n', '<C-a>', [[ <cmd>lua require('telescope.builtin').find_files()<cr> ]], default_opts)
vim.api.nvim_set_keymap('n', '<C-p>', [[ <cmd>lua require('telescope.builtin').buffers()<cr> ]], default_opts)
-- <S-F5> Греповский поиск слова под курсором
vim.api.nvim_set_keymap('n', '<S-F5>', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], default_opts)
-- <S-F4> Греповский поиск слова в модальном окошке
vim.api.nvim_set_keymap('n', '<S-F4>', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], default_opts)
-----------------------------------------------------------
-- ФАЙЛЫ
-----------------------------------------------------------
-- <F8>  Показ дерева классов и функций, плагин majutsushi/tagbar
vim.api.nvim_set_keymap('n', '<F8>', ':TagbarToggle<CR>', default_opts)
-- Дерево файлов. Для иконок следует установить Nerd Font
vim.api.nvim_set_keymap('n', '<leader>e', ':Neotree toggle<CR>', default_opts)
-----------------------------------------------------------
-- УПРАВЛЕНИЕ БУФЕРАМИ И СПЛИТАМИ
-----------------------------------------------------------
vim.api.nvim_set_keymap('n', '<leader>c', ':Bdelete<CR>', default_opts)
vim.api.nvim_set_keymap('n', '<leader>rc', ':close<CR>', default_opts)
vim.api.nvim_set_keymap('n', '<leader>rs', ':ToggleTerm size=50 direction=vertical<CR>', default_opts)
