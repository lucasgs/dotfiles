local status_ok, oil = pcall(require, 'oil')
if not status_ok then
    return
end

oil.setup({
    view_options = {
        show_hidden = true,
        -- This function defines what is considered a "hidden" file
        is_hidden_file = function(name, bufnr)
            return vim.startswith(name, ".")
        end,
        -- This function defines what will never be shown, even when `show_hidden` is set
        is_always_hidden = function(name, bufnr)
            return false
        end,
    }
})
