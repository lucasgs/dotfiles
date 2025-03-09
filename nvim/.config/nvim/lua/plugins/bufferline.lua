return { 
    'akinsho/bufferline.nvim', 
    version = "*", 
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("bufferline").setup({
            options = {
                -- close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
                mode = "buffers",
                numbers = "none",              -- "buffer_id",
                modified_icon = "[+]",         --"ﰂ", -- "[+]",
                separator_style = "thin",      -- | "thick" | "thin" | { 'any', 'any' },
                diagnostics = "nvim_lsp",
                always_show_bufferline = true,
                show_buffer_icons = false, -- disable filetype icons for buffers
                show_buffer_close_icons = false,
                truncate_names = false,
                offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
            }
        })
    end,
}
