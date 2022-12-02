local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    return
end
bufferline.setup {
    options = {
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        numbers = function(opts)
            return opts.raise(opts.id)
        end,
    }
}
