-- color config of terminal window

return function(ns_id)
    ---@param name string
    local function sethl(name)
        ---@param val vim.api.keyset.highlight
        return function(val)
            vim.api.nvim_set_hl(ns_id, name, val)
        end
    end

    local fg = require("colorimetry.palette").fg
    local bg = require("colorimetry.palette").bg

    vim.g.terminal_color_0 = bg.w1
    vim.g.terminal_color_1 = fg.r3
    vim.g.terminal_color_2 = fg.g2
    vim.g.terminal_color_3 = fg.y2
    vim.g.terminal_color_4 = fg.b2
    vim.g.terminal_color_5 = fg.p3
    vim.g.terminal_color_6 = fg.e2
    vim.g.terminal_color_7 = fg.w3
    vim.g.terminal_color_8 = bg.w4
    vim.g.terminal_color_9 = fg.r3
    vim.g.terminal_color_10 = fg.g1
    vim.g.terminal_color_11 = fg.y1
    vim.g.terminal_color_12 = fg.b1
    vim.g.terminal_color_13 = fg.p1
    vim.g.terminal_color_14 = fg.e1
    vim.g.terminal_color_15 = fg.w1
end
