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

    sethl("GitSignsStagedAddNr") { bg = bg.g3, fg = fg.g0 }
    sethl("GitSignsStagedChangeNr") { bg = bg.b3, fg = fg.b0 }
    sethl("GitSignsStagedDeleteNr") { bg = bg.r3, fg = fg.r0 }
    sethl("GitSignsStagedChangeDeleteNr") { bg = bg.p3, fg = fg.p0 }

    sethl("GitSignsAddNr") { bg = bg.g1, fg = fg.g1 }
    sethl("GitSignsChangeNr") { bg = bg.b1, fg = fg.b1 }
    sethl("GitSignsDeleteNr") { bg = bg.r1, fg = fg.r1 }
    sethl("GitSignsChangeDeleteNr") { bg = bg.p1, fg = fg.p1 }
end
