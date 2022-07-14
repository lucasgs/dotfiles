local options = {
	backup = false,
	clipboard = "unnamedplus",
	--completeopt = "menu,menuone,noselect",
	completeopt = "menu,menuone,noinsert",
	cursorline = true,
	fileencoding = 'utf-8',
	guifont = "monospace:h14",
	hlsearch = true,
	ignorecase = true,
	incsearch = true,
	expandtab = true,
	mouse = "a",
	number = true,
	pumheight = 10,
	relativenumber = false,
	scrolloff = 8,
	showmode = true,
	shiftwidth = 4,
	sidescrolloff = 8,
	smartcase = true,
	smartindent = true,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	termguicolors = true,
	tabstop = 2,
	wrap = false,
}

for k,v in pairs(options) do
	vim.opt[k] = v
end
