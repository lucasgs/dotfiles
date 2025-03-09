return {
    'ThePrimeagen/harpoon',
    opts = {},
    keys = {
        {"<leader>hm", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Harpoon quick menu" },
        {"<leader>ha", function() require("harpoon.mark").add_file() end, desc = "Harpoon add" },
        {"<leader>hn", function() require("harpoon.ui").nav_next() end, desc = "Harpoon next" },
        {"<leader>hp", function() require("harpoon.ui").nav_prev() end, desc = "Harpoon prev" },
        {"<leader>hc", function() require("harpoon.mark").clear_all() end, desc = "Harpoon clear all" },
        {"<leader>h1", function() require("harpoon.ui").nav_file(1) end, desc = "Harpoon nav file 1" },
        {"<leader>h2", function() require("harpoon.ui").nav_file(2) end, desc = "Harpoon nav file 2" },
        {"<leader>h3", function() require("harpoon.ui").nav_file(3) end, desc = "Harpoon nav file 3" },
        {"<leader>h4", function() require("harpoon.ui").nav_file(4) end, desc = "Harpoon nav file 4" },
        {"<leader>h5", function() require("harpoon.ui").nav_file(5) end, desc = "Harpoon nav file 5" },
        {"<leader>h6", function() require("harpoon.ui").nav_file(6) end, desc = "Harpoon nav file 6" },
    }
}
