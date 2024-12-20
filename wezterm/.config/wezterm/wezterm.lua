local wezterm                       = require 'wezterm'
local act                           = wezterm.action

local config                        = {}

config.font                         = wezterm.font('Hack Nerd Font Mono')
config.font_size                    = 14.0

-- config.color_scheme                 = 'tokyonight-storm'
--config.color_scheme                 = 'kanagawabones'
config.color_scheme                 = 'Kanagawa (Gogh)'

config.hide_tab_bar_if_only_one_tab = true

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar            = false
config.tab_bar_at_bottom            = true

-- config.window_decorations = "RESIZE"
-- config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

-- window_background_opacity = 0.95,
config.window_background_opacity    = 1.00

config.initial_cols                 = 150
config.initial_rows                 = 40

wezterm.on('update-right-status', function(window, pane)
    window:set_right_status(window:active_workspace())
end)

config.leader = { key = 'w', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
    {
        key = '|',
        mods = 'LEADER',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
        key = '-',
        mods = 'LEADER',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
        key = 'h',
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Left',
    },
    {
        key = 'l',
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Right',
    },
    {
        key = 'j',
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Down',
    },
    {
        key = 'k',
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Up',
    },
    {
        key = 'r',
        mods = 'LEADER',
        action = wezterm.action.ShowLauncher
    },

    {
        key = 'p',
        mods = 'LEADER',
        action = wezterm.action.ActivateCommandPalette
    },
    {
        key = 'd',
        mods = 'LEADER',
        action = act.SwitchToWorkspace {
            name = 'default',
        },
    },
    {
        key = 'n',
        mods = 'CTRL',
        action = act.SwitchWorkspaceRelative(1)
    },

    {
        key = 'p',
        mods = 'CTRL',
        action = act.SwitchWorkspaceRelative(-1)
    },
    {
        key = 'w',
        mods = 'LEADER',
        action = act.PromptInputLine {
            description = wezterm.format {
                { Attribute = { Intensity = 'Bold' } },
                { Foreground = { AnsiColor = 'Fuchsia' } },
                { Text = 'Enter name for new workspace' },
            },
            action = wezterm.action_callback(function(window, pane, line)
                -- line will be `nil` if they hit escape without entering anything
                -- An empty string if they just hit enter
                -- Or the actual line of text they wrote
                if line then
                    window:perform_action(
                        act.SwitchToWorkspace {
                            name = line,
                        },
                        pane
                    )
                end
            end),
        },
    }
}

config.launch_menu = {
    {
        -- args = { 'top' },
    },
}

return config
