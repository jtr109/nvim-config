local status_ok, tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end
tree.setup({
    view = {
        mappings = {
            list = {
                { key = "", action = "" }
            }
        }
    }
})

-- Auto close nvim when nvim-tree is the last window.
-- Copy from: https://github.com/nvim-tree/nvim-tree.lua/wiki/Auto-Close
-- nvim-tree is also there in modified buffers so this function filter it out
local modifiedBufs = function(bufs)
    local t = 0
    for _, v in pairs(bufs) do
        if v.name:match("NvimTree_") == nil then
            t = t + 1
        end
    end
    return t
end
vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        if #vim.api.nvim_list_wins() == 1 and
            vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil and
            modifiedBufs(vim.fn.getbufinfo({ bufmodified = 1 })) == 0 then
            vim.cmd "quit"
        end
    end
})
