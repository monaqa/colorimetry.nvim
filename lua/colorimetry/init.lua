local M = {}

function M.load(ns_id, subscheme)
    if ns_id == nil then
        ns_id = 0
    end
    if subscheme == nil then
        subscheme = "dark"
    end

    require("colorimetry.subscheme." .. subscheme).load(ns_id)
end

return M
