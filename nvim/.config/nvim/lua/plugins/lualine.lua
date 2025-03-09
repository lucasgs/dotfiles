return {
    'nvim-lualine/lualine.nvim',
    -- dependencies = { 'nvim-tree/nvim-web-devicons' }
    opts = {
        options = {
            icons_enabled = false,
            -- theme = 'tokyonight',
            -- theme = "onedark",
            -- theme = "catppuccin",
            -- theme = theme_name,
            theme = 'auto',
            section_separators = '',
            component_separators = '',
            globalstatus = true,
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', 'diff', 'diagnostics' },
            lualine_c = { { 'filename', path = 3 }, },
            -- lualine_x = { 'encoding', 'fileformat', 'filetype' },
            lualine_x = { 'filetype' },
            -- lualine_y = { 'progress' },
            lualine_y = {},
            lualine_z = { 'location' }
        }
    },
}
