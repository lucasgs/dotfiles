local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
  return
end
bufferline.setup {
  options = {
    mode = "buffers",
    numbers = "none", -- "buffer_id",
    modified_icon = "樂", --"ﰂ", -- "[+]",
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = true,
    -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
    --   return "(" .. count .. ")"
    -- end,
    always_show_bufferline = true,
    show_buffer_icons = false, -- disable filetype icons for buffers
    show_buffer_close_icons = false,
    name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
      return buf.bufnr .. ":[" .. buf.name .. "]"
    end,
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
  }
}
