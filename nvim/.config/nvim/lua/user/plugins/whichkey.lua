local status_ok, whichkey = pcall(require, "which-key")
if not status_ok then
  return
end

whichkey.setup({})

whichkey.register({
  -- ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
  -- ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
  -- ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
  -- ['<leader>h'] = { name = 'More git', _ = 'which_key_ignore' },
  -- ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
  -- ['<leader>f'] = { name = '[F]ind', _ = 'which_key_ignore' },
  -- ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
})
