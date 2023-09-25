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
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
      },
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V',  -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
      include_surrounding_whitespace = true,
    },
    -- swap = {
    --   enable = true,
    --   swap_next = {
    --     ["<leader>a"] = "@parameter.inner",
    --   },
    --   swap_previous = {
    --     ["<leader>A"] = "@parameter.inner",
    --   },
    -- },
    -- move = {
    --   enable = true,
    --   set_jumps = true, -- whether to set jumps in the jumplist
    --   goto_next_start = {
    --     ["]m"] = "@function.outer",
    --     ["]]"] = { query = "@class.outer", desc = "Next class start" },
    --     --
    --     ["]o"] = "@loop.*",
    --     --
    --     ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
    --     ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
    --   },
    --   goto_next_end = {
    --     ["]M"] = "@function.outer",
    --     ["]["] = "@class.outer",
    --   },
    --   goto_previous_start = {
    --     ["[m"] = "@function.outer",
    --     ["[["] = "@class.outer",
    --   },
    --   goto_previous_end = {
    --     ["[M"] = "@function.outer",
    --     ["[]"] = "@class.outer",
    --   },
    --   goto_next = {
    --     ["]d"] = "@conditional.outer",
    --   },
    --   goto_previous = {
    --     ["[d"] = "@conditional.outer",
    --   }
    -- },
  },
})
