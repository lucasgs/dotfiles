return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    keys = {
        {"<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find files" },
        {"<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Find buffers"},
        {"<leader>fw", "<cmd>FzfLua grep_cword<cr>", desc = "Grep word" },
        {"<leader>fc", "<cmd>FzfLua lgrep_curbuf<cr>", desc = "Grep current buffer" },
        {"<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Grep" },
        {"<leader>fn", "<cmd>FzfLua files cwd=~/notes<cr>", desc = "Find note" },
        {"<leader>fd", "<cmd>FzfLua lsp_document_diagnostics<cr>", desc = "Document diagnostics" },
        {"<leader>nv", "<cmd>FzfLua files cwd=~/.config/nvim<cr>", desc = "Edit neovim config file" },
        {"<leader>fs", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "Find symbols" },
        {"<leader>fr", "<cmd>FzfLua lsp_references<cr>", desc = "Find references" },
        {"<leader>fh", "<cmd>FzfLua helptags<cr>", desc = "Help tags" },
        {"<leader>fk", "<cmd>FzfLua keymaps<cr>", desc = "Find keymaps" },
    }
}
