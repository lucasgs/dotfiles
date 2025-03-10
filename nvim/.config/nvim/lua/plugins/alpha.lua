return {
    "goolord/alpha-nvim",
    config = function()
        local status_ok, alpha = pcall(require, "alpha")
        if not status_ok then
            return
        end

        local icons = require("config.icons")

        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
            [[  ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
            [[  ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
            [[  ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
            [[  ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
            [[  ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
            [[  ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
        }

        dashboard.section.buttons.val = {
            dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("f", string.format("%s  %s", icons.ui.FindFile, "Find file"), "<cmd>FzfLua files<CR>"),
            dashboard.button("t", string.format("%s  %s", icons.ui.FindText, "Find text"), "<cmd>FzfLua live_grep<CR>"),
            dashboard.button("r", string.format("%s  %s", icons.ui.Files, "Recently used files"), "<cmd>FzfLua oldfiles <CR>"),
            dashboard.button("q", string.format("%s  %s", icons.ui.BoldClose, "Quit Neovim"), ":qa<CR>"),
        }

        local function footer()
            return "Opportunities don't happen, you create them"
        end

        -- dashboard.section.footer.val = footer()
        local fortune = require("alpha.fortune")
        dashboard.section.footer.val = fortune()

        dashboard.section.footer.opts.hl = "Type"
        dashboard.section.header.opts.hl = "Include"
        dashboard.section.buttons.opts.hl = "Keyword"

        dashboard.opts.opts.noautocmd = true
        alpha.setup(dashboard.opts)
    end,
}
