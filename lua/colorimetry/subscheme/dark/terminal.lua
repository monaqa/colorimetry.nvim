---@param fg colorimetry.Ground
---@param bg colorimetry.Ground
return function(ns_id, fg, bg)
    ---@param name string
    local function sethl(name)
        ---@param val vim.api.keyset.highlight
        return function(val)
            vim.api.nvim_set_hl(ns_id, name, val)
        end
    end

    vim.g.terminal_color_0 = bg.w1
    vim.g.terminal_color_1 = fg.r3
    vim.g.terminal_color_2 = fg.g4
    vim.g.terminal_color_3 = fg.y4
    vim.g.terminal_color_4 = fg.b5
    vim.g.terminal_color_5 = fg.p5
    vim.g.terminal_color_6 = fg.e4
    vim.g.terminal_color_7 = fg.w3
    vim.g.terminal_color_8 = fg.w5
    vim.g.terminal_color_9 = fg.r3
    vim.g.terminal_color_10 = fg.g1
    vim.g.terminal_color_11 = fg.y1
    vim.g.terminal_color_12 = fg.b1
    vim.g.terminal_color_13 = fg.p1
    vim.g.terminal_color_14 = fg.e1
    vim.g.terminal_color_15 = fg.w1
end
