local options = {
  -- autoindent = true,
	backup = false,
	clipboard = "unnamedplus",
	fileencoding = 'utf-8',
	-- hidden = true,
	hlsearch = true,
	ignorecase = true,
	incsearch = true,
	mouse = "a",
	number = true,
	pumheight = 10,
	-- relativenumber = true,
  -- showmatch = true,
	showmode = false,
	shiftwidth = 4,
	smartcase = true,
	smartindent = true,
	-- spell = true,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	termguicolors = true,
	tabstop = 2,
	cursorline = true,
	number = true,
	--completeopt = "menu,menuone,noselect",
	completeopt = "menu,menuone,noinsert",
	wildmenu = true,
	wrap = false,
	scrolloff = 8,
	sidescrolloff = 8,
	guifont = "monospace:h14",
}

for k,v in pairs(options) do
	vim.opt[k] = v
end
