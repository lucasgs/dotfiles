local status_ok, peek = pcall(require, 'peek')

if not status_ok then
    return
end

peek.setup()

local function toogle()
    if (peek.is_open) then peek.close() else peek.open() end
end

vim.api.nvim_create_user_command("PeekOpen", peek.open, {})
vim.api.nvim_create_user_command("PeekClose", peek.close, {})
vim.api.nvim_create_user_command("PeekToggle", toogle, {})
