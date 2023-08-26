local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup({
  -- ensure_installed = "all", -- one of "all" or a list of languages
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
  sync_install = false,
  -- ignore_install = { "phpdoc", "tree-sitter-phpdoc" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  autopairs = {
    enable = true,
  },
  indent = { enable = true, },
})
