if vim.g.colors_name ~= nil and vim.g.colors_name ~= "colorimetry" then
    vim.cmd("hi clear")
end
vim.g.colors_name = "colorimetry"
vim.opt.background = "dark"

require("colorimetry").load(nil, "dark")
