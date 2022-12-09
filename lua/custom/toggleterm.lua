local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end
toggleterm.setup({
  open_mapping = [[<Leader>tt]],
  direction = "float",
  insert_mappings = false, -- whether or not the open mapping applies in insert mode
})

-- lazygit integration
local Terminal = require('toggleterm.terminal').Terminal
local lazygit  = Terminal:new({
  cmd = "lazygit",
  hidden = true,
})
local function lazygit_toggle()
  lazygit:toggle()
end

vim.keymap.set({"n", "t"}, "<leader>tg", lazygit_toggle, { desc = "Toggle lazygit" })
