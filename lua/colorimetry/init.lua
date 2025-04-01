local M = {}

function M.load(ns_id, offset)
    if offset == nil then
        offset = 0
    end
    if ns_id == nil then
        ns_id = 0
    end

    require("colorimetry.base")(ns_id, offset)

    require("colorimetry.extensions.gitsigns")(ns_id)
    require("colorimetry.extensions.terminal")(ns_id)
    require("colorimetry.extensions.filetype")(ns_id)
end

return M
