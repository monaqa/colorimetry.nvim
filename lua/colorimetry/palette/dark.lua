---@type colorimetry.generator.cone.Config
local fg_config = {
    l0 = 0.9,
    l1 = 0.55,
    r0 = { long = 0.08, short = 0.05 },
    r1 = { long = 0.15, short = 0.12 },
    offset = { 0.0, 0.01 },
    phi = 0.6,
    hues = {
        w = "center",
        g = 0.125,
        e = 0.250,
        b = 0.375,
        v = 0.500,
        p = 0.625,
        r = 0.720,
        o = 0.850,
        y = 0.950,
    },
}

---@type colorimetry.generator.cone.Config
local bg_config = {
    l0 = 0.25,
    l1 = 0.4,
    r0 = { long = 0.08, short = 0.06 },
    r1 = { long = 0.04, short = 0.03 },
    offset = { 0.0, -0.02 },
    phi = 0.5,
    hues = {
        w = "center",
        y = 0.0,
        g = 0.2,
        b = 0.4,
        p = 0.6,
        r = 0.8,
    },
}

return {
    fg = require("colorimetry.generator").with_cone(fg_config),
    bg = require("colorimetry.generator").with_cone(bg_config),
}
