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

    sethl("fishStatement") { link = "@function" }
end
