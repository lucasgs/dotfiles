local status_ok, nvimcommenter = pcall(require, "nvim-commenter")
if not status_ok then
	return
end

nvimcommenter.setup()
