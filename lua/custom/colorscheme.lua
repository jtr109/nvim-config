-- vim.cmd "colorscheme darkblue" -- set default color scheme

local colorscheme = "darkblue"
-- local colorscheme = "tokyonight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
end

