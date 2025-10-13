-- Palette generator.
local convert = require("colorimetry.convert")

local M = {}

---@class colorimetry.generator.cone.Config
---@field l0 number L value when t = 0
---@field l1 number L value when t = 1
---@field r0 {long: number, short: number} radius when t = 0
---@field r1 {long: number, short: number} radius when t = 0
---@field offset [number, number] offset from L-axis
---@field phi number phase offset divided by pi (from 0 to 1)
---@field hues {[string]: number | "center"} phase indices

---@param config colorimetry.generator.cone.Config
---@return colorimetry.Ground
function M.with_cone(config)
    local phi = math.pi * config.phi
    local cos_phi = math.cos(phi)
    local sin_phi = math.sin(phi)
    local r0_long = config.r0.long
    local r1_long = config.r1.long
    local r0_short = config.r0.short
    local r1_short = config.r1.short

    ---@param hue string
    ---@param level number
    ---@return string
    local f = function(hue, level)
        local theta = config.hues[hue]

        local l = (1 - level) * config.l0 + level * config.l1
        local a, b

        if theta == "center" then
            a = config.offset[1]
            b = config.offset[2]
        else
            local cos_theta = math.cos(2 * math.pi * theta)
            local sin_theta = math.sin(2 * math.pi * theta)
            local a_point0 = cos_phi * r0_long * cos_theta - sin_phi * r0_short * sin_theta
            local b_point0 = sin_phi * r0_long * cos_theta + cos_phi * r0_short * sin_theta
            local a_point1 = cos_phi * r1_long * cos_theta - sin_phi * r1_short * sin_theta
            local b_point1 = sin_phi * r1_long * cos_theta + cos_phi * r1_short * sin_theta

            a = config.offset[1] + (1 - level) * a_point0 + level * a_point1
            b = config.offset[2] + (1 - level) * b_point0 + level * b_point1
        end

        return convert.rgb_to_hex(convert.oklab_to_rgb(l, a, b))
    end

    return setmetatable({
        hues = config.hues,
        cache = {},
    }, {
        __index = function(self, key)
            if self.cache[key] ~= nil then
                return self.cache[key]
            end
            local hue, level = convert.parse_color_index(key)
            if hue == nil or level == nil then
                return nil
            end
            local color = f(hue, level)
            self.cache[key] = color
            return color
        end,
        __call = f,
    })
end

return M
