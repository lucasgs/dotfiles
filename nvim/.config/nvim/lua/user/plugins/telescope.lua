local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
    return
end

telescope.setup({
    defaults = {
        --   mappings = {
        --     i = {
        --       ["<esc>"] = actions.close
        --     },
        --   },
        -- path_display = { "smart" },
        path_display = { "filename_first" },
        file_ignore_patterns = { "^node_modules/", "^.git/" },
    },
})

telescope.load_extension('fzf')

telescope.load_extension('file_browser')

-- telescope.load_extension('harpoon')
