return {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
        require("peek").setup()
        vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
        vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
    keys = {
        {"<leader>mo", "<cmd>PeekOpen<CR>", desc = "Open markdown preview" },
        {"<leader>mc", "<cmd>PeekClose<CR>", desc = "Close markdown preview" },
    }
}
