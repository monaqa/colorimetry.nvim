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

    sethl("fishStatement") { link = "@function" }
end
