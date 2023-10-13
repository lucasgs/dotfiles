global_settings = {
  -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
  save_on_toggle = false,

  -- saves the harpoon file upon every change. disabling is unrecommended.
  save_on_change = true,

  -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
  enter_on_sendcmd = false,

  -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
  tmux_autoclose_windows = false,

  -- filetypes that you want to prevent from adding to the harpoon list menu.
  excluded_filetypes = { "harpoon" },

  -- set marks specific to each git branch inside git repository
  mark_branch = false,

  -- enable tabline with harpoon marks
  tabline = false,
  tabline_prefix = "   ",
  tabline_suffix = "   ",
}

local keymap = vim.keymap.set
keymap('n', '<leader>ha', require('harpoon.mark').add_file, { desc = 'Harpoon add' })
keymap('n', '<leader>hc', require('harpoon.mark').clear_all, { desc = 'Harpoon clear all' })
keymap('n', '<leader>hn', require('harpoon.ui').nav_next, { desc = 'Harpoon next' })
keymap('n', '<leader>hp', require('harpoon.ui').nav_prev, { desc = 'Harpoon prev' })
keymap('n', '<leader>hm', require('harpoon.ui').toggle_quick_menu, { desc = 'Harpoon quick menu' })
-- vim.keymap.set('n', 'hm', ':Telescope harpoon marks<CR>')
