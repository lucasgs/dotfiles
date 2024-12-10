local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

local context_ok, context = pcall(require, "treesitter-context")
if not context_ok then
    return
end

context.setup {
    enable = false,
}

configs.setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "bash", "html", "javascript" },
    sync_install = false,
    auto_install = true,
    modules = {},
    ignore_install = {},
    autopairs = { enable = true },
    indent = { enable = true },
    highlight = { enable = true },
    incremental_selection = {
        enable = true,
        keymaps = {
            node_incremental = "v",
            node_decremental = "V",
        },
    },
    -- textobjects = {
    --     select = {
    --         enable = true,
    --         lookahead = true,
    --         keymaps = {
    --             ["af"] = "@function.outer",
    --             ["if"] = "@function.inner",
    --             ["ac"] = "@class.outer",
    --             ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
    --             ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
    --         },
    --         selection_modes = {
    --             ['@parameter.outer'] = 'v', -- charwise
    --             ['@function.outer'] = 'V',  -- linewise
    --             ['@class.outer'] = '<c-v>', -- blockwise
    --         },
    --         include_surrounding_whitespace = true,
    --     },
    -- },
})
