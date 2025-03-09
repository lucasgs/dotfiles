local options = {
    backup = false,
    background = "dark",
    clipboard = "unnamedplus",
    cmdheight = 0,
    completeopt = { "menuone", "noselect" },
    cursorline = true,
    fileencoding = 'utf-8',
    guifont = "monospace:h14",
    hlsearch = true,
    hidden = true,
    ignorecase = true,
    -- inccommand = "split",
    incsearch = true,
    expandtab = true,
    -- laststatus = 3,
    listchars = { eol = "↵", tab = ">>>", trail = "." },
    mouse = "a",
    number = true,
    pumheight = 10,
    relativenumber = true,
    scrolloff = 8,
    showmode = false,
    shiftwidth = 4,
    sidescrolloff = 8,
    smartcase = true,
    smartindent = true,
    softtabstop = 2,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    termguicolors = true,
    tabstop = 4,
    -- timeout = true,
    -- timeoutlen = 300,
    virtualedit = "block",
    wildmenu = true,
    wrap = true,
    updatetime = 50,
    -- colorcolumn = "80",
}

local globals = {
    --Remap space as leader key
    mapleader = " ",
    maplocalleader = "\\",

    netrw_banner = 0,       -- don't show the banner on top
    -- netrw_liststyle = 3,    -- show list as a tree
    netrw_browse_split = 0, -- reuse the same window
    netrw_winsize = 25
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

for k, v in pairs(globals) do
    vim.g[k] = v
end
