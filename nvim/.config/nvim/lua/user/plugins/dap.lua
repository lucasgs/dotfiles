local status_ok, dap = pcall(require, 'dap')
if not status_ok then
  return
end

local keymap = vim.keymap.set

keymap('n', '<F5>', function() require('dap').continue() end)
keymap('n', '<F8>', function() require('dap').step_over() end)
keymap('n', '<F9>', function() require('dap').step_into() end)
keymap('n', '<F10>', function() require('dap').step_out() end)
keymap('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
keymap('n', '<Leader>B', function() require('dap').set_breakpoint() end)
keymap('n', '<Leader>lp',
  function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
keymap('n', '<Leader>dr', function() require('dap').repl.open() end)
keymap('n', '<Leader>dl', function() require('dap').run_last() end)
keymap({ 'n', 'v' }, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
keymap({ 'n', 'v' }, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
keymap('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
keymap('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)

local dapui_status_ok, dapui = pcall(require, 'dapui')
if not dapui_status_ok then
  return
end

local vtext_ok, vtext = pcall(require, 'nvim-dap-virtual-text')
if not vtext_ok then
  return
end

dapui.setup()

vtext.setup {
  enabled = true,                     -- enable this plugin (the default)
  enabled_commands = true,            -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
  highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
  highlight_new_as_changed = false,   -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
  show_stop_reason = true,            -- show stop reason when stopped for exceptions
  commented = false,                  -- prefix virtual text with comment string
  only_first_definition = true,       -- only show virtual text at first definition (if there are multiple)
  all_references = false,             -- show virtual text on all all references of the variable (not only definitions)
  --- A callback that determines how a variable is displayed or whether it should be omitted
  --- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
  --- @param buf number
  --- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
  --- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
  --- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
  display_callback = function(variable, _buf, _stackframe, _node)
    return variable.name .. ' = ' .. variable.value
  end,

  -- experimental features:
  virt_text_pos = 'eol',  -- position of virtual text, see `:h nvim_buf_set_extmark()`
  all_frames = false,     -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
  virt_lines = false,     -- show virtual lines instead of virtual text (will flicker!)
  virt_text_win_col = nil -- position the virtual text at a fixed window column (starting from the first text column) ,
  -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
}

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

local HOME = os.getenv "HOME"
local DEBUGGER_LOCATION = HOME .. "/.local/share/nvim/mason/packages/kotlin-debug-adapter"

dap.adapters.kotlin = {
  type = "executable",
  command = DEBUGGER_LOCATION .. "/adapter/bin/kotlin-debug-adapter",
  args = { "--interpreter=vscode" }
}

dap.configurations.kotlin = {
  {
    type = "kotlin",
    name = "launch - kotlin",
    request = "launch",
    program = "${file}",
    projectRoot = vim.fn.getcwd() .. "/app",
    mainClass = function()
      return vim.fn.input("Path to main class > ", "kt.test.AppKt", "file")
    end,
    -- mainClass = "${file}",
  }
}
