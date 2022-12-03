-- vim.cmd "colorscheme darkblue" -- set default color scheme

-- local colorscheme = "darkblue"
local colorscheme = "tokyonight"
-- local colorscheme = "tokyonight-day" -- light mode
-- local colorscheme = "material"

if colorscheme == 'material' then
  vim.g.material_theme_style  = 'lighter'
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
end
