local M = {}

M.fg = {
    w0 = "#e0ded7",
    y0 = "#efde9b",
    g0 = "#cae9b8",
    e0 = "#bbe9e3",
    b0 = "#c4e1ff",
    v0 = "#ddd7ff",
    p0 = "#f5d1f3",
    r0 = "#ffd0d5",
    o0 = "#fdd7ab",
    w1 = "#cac7c0",
    y1 = "#dcc778",
    g1 = "#add59d",
    e1 = "#99d5cf",
    b1 = "#a6cbf5",
    v1 = "#c6befb",
    p1 = "#e3b7e0",
    r1 = "#efb6bd",
    o1 = "#edbd8b",
    w2 = "#b3b1aa",
    y2 = "#c9b054",
    g2 = "#90c183",
    e2 = "#75c1bc",
    b2 = "#88b6e5",
    v2 = "#b0a7ec",
    p2 = "#d19dcd",
    r2 = "#df9ca5",
    o2 = "#dca46c",
    w3 = "#9e9b94",
    y3 = "#b69927",
    g3 = "#73ad69",
    e3 = "#4eada9",
    b3 = "#6aa0d6",
    v3 = "#9a8fdc",
    p3 = "#bf84ba",
    r3 = "#ce828e",
    o3 = "#cb8c4b",
    w4 = "#88867f",
    y4 = "#a38300",
    g4 = "#55994f",
    e4 = "#129997",
    b4 = "#4a8bc7",
    v4 = "#8578cd",
    p4 = "#ad6ba7",
    r4 = "#bd6978",
    o4 = "#ba7325",
    w5 = "#74716b",
    y5 = "#916c00",
    g5 = "#358634",
    e5 = "#008685",
    b5 = "#2676b7",
    v5 = "#7160bd",
    p5 = "#9b5295",
    r5 = "#ac4f62",
    o5 = "#a95a00",
}

M.bg = {
    w0 = "#1e212b",
    y0 = "#2d2000",
    g0 = "#002a20",
    b0 = "#00224a",
    p0 = "#251549",
    r0 = "#37141e",
    w1 = "#272a35",
    y1 = "#342909",
    g1 = "#04332b",
    b1 = "#002c51",
    p1 = "#2c2150",
    r1 = "#3f2029",
    w2 = "#30343f",
    y2 = "#3c331b",
    g2 = "#173b36",
    b2 = "#103658",
    p2 = "#352c56",
    r2 = "#462b34",
    w3 = "#3a3d49",
    y3 = "#443d2c",
    g3 = "#274441",
    b3 = "#21405e",
    p3 = "#3d375d",
    r3 = "#4d363f",
    w4 = "#434753",
    y4 = "#4c473c",
    g4 = "#354d4d",
    b4 = "#314a65",
    p4 = "#464364",
    r4 = "#54414b",
}

function M.fg_with_offset(offset)
    if offset == nil then
        offset = 0
    end
    return setmetatable({}, {
        __index = function(_, k)
            local kind = k:sub(1, 1)
            local num = tonumber(k:sub(2, 2))
            local newnum = num + offset
            if newnum < 0 then
                newnum = 0
            end
            if newnum > 5 then
                newnum = 5
            end
            return M.fg[kind .. tostring(newnum)]
        end,
    })
end

function M.bg_with_offset(offset)
    if offset == nil then
        offset = 0
    end
    return setmetatable({}, {
        __index = function(_, k)
            local kind = k:sub(1, 1)
            local num = tonumber(k:sub(2, 2))
            local newnum = num + offset
            if newnum < 0 then
                newnum = 0
            end
            if newnum > 3 then
                newnum = 3
            end
            return M.bg[kind .. tostring(newnum)]
        end,
    })
end

return M
