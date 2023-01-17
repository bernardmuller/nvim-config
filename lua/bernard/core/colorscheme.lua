vim.g.material_style = "deep ocean"
local status, _ = pcall(vim.cmd, "colorscheme material")
if not status then
	print("Colorscheme not found!")
	return
end

require("material").setup()
