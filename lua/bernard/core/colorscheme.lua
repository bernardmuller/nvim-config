local status, _ = pcall(vim.cmd, "colorscheme darkplus")
if not status then
	print("Colorscheme not found!")
	return
end
