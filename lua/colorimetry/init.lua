local M = {}

function M.load(ns_id)
    if ns_id == nil then
        ns_id = 0
    end

    require("colorimetry.base")(ns_id)

    require("colorimetry.extensions.gitsigns")(ns_id)
    require("colorimetry.extensions.terminal")(ns_id)
end

return M
