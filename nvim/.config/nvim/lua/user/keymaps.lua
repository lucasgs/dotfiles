local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.keymap.set

-- General

-- Quit
-- keymap("n", "<Leader>q", "<cmd>q<CR>", opts)
-- keymap("n", "<Leader>q", "<cmd>bd %<CR>", opts)
keymap("n", "<Leader>qq", "<cmd>qa<CR>", { desc = 'Quit all' })
keymap("n", "<Leader>w", "<cmd>w<CR>", { desc = 'Write buffer' })

-- Explorer
-- keymap('n', '<Leader>e', '<cmd>NvimTreeToggle<CR>', opts)
-- keymap('n', '<Leader>e', '<cmd>Ex<CR>', { desc = 'Open Explorer' })
-- keymap('n', '<Leader>e', '<cmd>Telescope file_browser<CR>', opts)

-- Integrated terminal
--keymap("n", "<F4>", "<cmd>terminal<CR>", opts)
-- keymap("n", "<F4>", "<cmd>sp term://zsh<CR>", opts)
-- keymap('n', '<Leader>t', '<cmd>sp term://zsh<CR>', opts)
-- keymap('n', '<Leader>t', '<cmd>ToggleTerm<CR>', opts)

-- Lazy git
keymap('n', '<Leader>lz', '<cmd>lua _LAZYGIT_TOGGLE()<CR>', { desc = 'Toggle LazyGit' })

-- make current file executable
keymap('n', '<Leader>xe', '<cmd>!chmod +x %<CR>', { desc = 'Make current file executable' })

-- select all text
keymap('n', '<Leader>a', 'gg<S-v>G', { desc = 'Select all text' })

-- yank all text
keymap('n', '<Leader>ya', 'gg<S-v>Gy', { desc = 'Yank all text' })

-- duplicate line
keymap('n', '<C-y>', 'yyp', { desc = 'Duplicate line' })

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<A-Up>", "<cmd>resize +3<CR>", opts)
keymap("n", "<A-Down>", "<cmd>resize -3<CR>", opts)
keymap("n", "<A-Left>", "<cmd>vertical resize +3<CR>", opts)
keymap("n", "<A-Right>", "<cmd>vertical resize -3<CR>", opts)

-- Change 2 split windows from vert to horiz or horiz to vert
keymap("n", "<leader>th", "<C-w>t<C-w>H", opts)
keymap("n", "<leader>tk", "<C-w>t<C-w>K", opts)

-- Buffers
keymap("n", "<S-l>", "<cmd>bnext<CR>", opts)
keymap("n", "<S-h>", "<cmd>bprevious<CR>", opts)

keymap("n", "<leader>n", "<cmd>bnext<cr>", { desc = 'Next buffer' })
keymap("n", "<leader>p", "<cmd>bp<cr>", { desc = 'Prev buffer' })
keymap("n", "<leader>x", "<cmd>bd<cr>", { desc = 'Delete buffer' })
keymap('n', '<Leader>so', '<cmd>so %<CR>', { desc = 'Source current buffer' })

-- Splits
keymap("n", "<leader>|", "<cmd>vsplit<CR>", { desc = 'Split vertically' })
keymap("n", "<leader>-", "<cmd>split<CR>", { desc = 'Split horizontally' })
keymap("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = 'Open floating terminal' })
keymap("n", "<leader>tj", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = 'Open below terminal' })
keymap("n", "<leader>tl", "<cmd>ToggleTerm direction=vertical<cr>", { desc = 'Open right terminal' })

-- Find files using Telescope command-line sugar.
keymap("n", "<leader>ff", "<cmd>lua require('user.plugins.telescope-func').find_files()<cr>", { desc = 'Find files' })
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = 'Grep files' })
keymap("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", { desc = 'Find symbols' })
keymap("n", "<leader>fr", "<cmd>Telescope lsp_references<cr>", { desc = 'Find references' })
keymap("n", "<leader>fb", "<cmd>lua require('user.plugins.telescope-func').buffers()<cr>", { desc = 'Find buffer' })
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = 'Find tags' })
keymap("n", "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find sorting_strategy=ascending prompt_position=top<CR>",
    { desc = 'Fuzzy current buffer' })
keymap("n", "<leader>fw", "<cmd>lua require'telescope.builtin'.grep_string()<CR>", { desc = 'Find current word' })
keymap("n", "<leader>fn", "<cmd>lua require('user.plugins.telescope-func').find_notes()<CR>", { desc = 'Find note' })
keymap("n", "<leader>nv", "<cmd>lua require('user.plugins.telescope-func').edit_nvim()<CR>",
    { desc = 'Edit configuration' })

-- See `:help telescope.builtin`
-- vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
-- vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
-- vim.keymap.set('n', '<leader>/', function()
--   -- You can pass additional configuration to telescope to change theme, layout, etc.
--   require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
--     winblend = 10,
--     previewer = false,
--   })
-- end, { desc = '[/] Fuzzily search in current buffer' })
--
-- vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
-- vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
-- vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
-- vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
-- vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
-- vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- no highlighting
-- keymap("n", "<F10>", "<cmd>nohl<CR>", opts)
-- keymap("n", "<C-l>", "<cmd>nohl<CR>", opts)
-- keymap("n", "<leader>h", "<cmd>nohl<CR>", opts)
keymap("n", "<esc>", "<cmd>noh<cr>", opts)

-- quick fix list
keymap("n", "<leader>co", "<cmd>copen<CR>", { desc = 'Open quick fix list' })
keymap("n", "<leader>cc", "<cmd>cclose<CR>", { desc = 'Close quick fix list' })

-- move page and center
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

keymap("n", "gh", "^", { desc = 'Goto start of the line' })
keymap("n", "gl", "$", { desc = 'Goto end of the line' })

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
-- keymap("v", "<A-j>", "<cmd>m >+1<CR>==", opts)
-- keymap("v", "<A-k>", "<cmd>m <-1<CR>==", opts)
keymap("n", "<A-j>", "<cmd>m .+1<CR>==")     -- move line up(n)
keymap("n", "<A-k>", "<cmd>m .-2<CR>==")     -- move line down(n)
keymap("v", "<A-j>", "<cmd>m '>+1<CR>gv=gv") -- move line up(v)
keymap("v", "<A-k>", "<cmd>m '<-2<CR>gv=gv") -- move line down(v)-

-- Paste and overwrite
keymap("v", "p", '"_dP', opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Rest client
keymap("n", "<leader>ro", "<cmd>Rest open<CR>", { desc = 'Rest open' })
keymap("n", "<leader>rr", "<cmd>Rest run<CR>", { desc = 'Rest run' })
keymap("n", "<leader>rw", "<cmd>Rest env show<CR>", { desc = 'Rest environment show' })
keymap("n", "<leader>rs", "<cmd>Rest env select<CR>", { desc = 'Rest environment select' })

-- undotree
keymap("n", "<leader>u", "<cmd>UndotreeToggle<cr>", { desc = 'Toggle Undotree' })

-- Diffview
keymap("n", "<leader>do", "<cmd>DiffviewOpen<cr>", { desc = 'Open Diffview' })
keymap("n", "<leader>dc", "<cmd>DiffviewClose<cr>", { desc = 'Close Diffview' })


-- Trouble
keymap("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Toggle trouble" })
keymap("n", "<leader>xb", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
    { desc = "Trouble buffer diagnostics" })
keymap("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>",
    { desc = "Trouble symbols" })
keymap("n", "<leader>xq", "<cmd>Trouble qflist toggle<CR>", { desc = "Trouble quickfix" })
keymap("n", "<leader>xl", "<cmd>Trouble loclist toggle<CR>", { desc = "Trouble loclist" })


-- Oil
keymap("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Harpoon
keymap('n', '<leader>hm', function() require('harpoon.ui').toggle_quick_menu() end, { desc = 'Harpoon quick menu' })
-- vim.keymap.set('n', 'hm', ':Telescope harpoon marks<CR>')
keymap('n', '<leader>ha', function() require('harpoon.mark').add_file() end, { desc = 'Harpoon add' })
keymap('n', '<leader>hn', function() require('harpoon.ui').nav_next() end, { desc = 'Harpoon next' })
keymap('n', '<leader>hp', function() require('harpoon.ui').nav_prev() end, { desc = 'Harpoon prev' })
keymap('n', '<leader>hc', function() require('harpoon.mark').clear_all() end, { desc = 'Harpoon clear all' })
keymap('n', '<leader>h1', function() require('harpoon.ui').nav_file(1) end, { desc = 'Harpoon nav file 1' })
keymap('n', '<leader>h2', function() require('harpoon.ui').nav_file(2) end, { desc = 'Harpoon nav file 2' })
keymap('n', '<leader>h3', function() require('harpoon.ui').nav_file(3) end, { desc = 'Harpoon nav file 3' })
keymap('n', '<leader>h4', function() require('harpoon.ui').nav_file(4) end, { desc = 'Harpoon nav file 4' })
keymap('n', '<leader>h5', function() require('harpoon.ui').nav_file(5) end, { desc = 'Harpoon nav file 5' })
keymap('n', '<leader>h6', function() require('harpoon.ui').nav_file(6) end, { desc = 'Harpoon nav file 6' })

-- Peek markdown preview
keymap('n', '<leader>mo', "<cmd>PeekOpen<CR>", { desc = 'Open markdown preview' })
keymap('n', '<leader>mc', "<cmd>PeekClose<CR>", { desc = 'Closw markdown preview' })
