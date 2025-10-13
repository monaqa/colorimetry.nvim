local M = {}

---@param r number
---@param g number
---@param b number
---@return number L
---@return number a
---@return number b
function M.rgb_to_oklab(r, g, b)
    local function srgb_to_linear(c)
        if c >= 0.04045 then
            return math.pow((c + 0.055) / 1.055, 2.4)
        else
            return c / 12.92
        end
    end

    local r_lin = srgb_to_linear(r)
    local g_lin = srgb_to_linear(g)
    local b_lin = srgb_to_linear(b)

    local l = 0.4122214708 * r_lin + 0.5363325363 * g_lin + 0.0514459929 * b_lin
    local m = 0.2119034982 * r_lin + 0.6806995451 * g_lin + 0.1073969566 * b_lin
    local s = 0.0883024619 * r_lin + 0.2817188376 * g_lin + 0.6299787005 * b_lin

    l = math.pow(l, 1 / 3)
    m = math.pow(m, 1 / 3)
    s = math.pow(s, 1 / 3)

    local L = 0.2104542553 * l + 0.7936177850 * m - 0.0040720468 * s
    local a = 1.9779984951 * l - 2.4285922050 * m + 0.4505937099 * s
    local b = 0.0259040371 * l + 0.7827717662 * m - 0.8086757660 * s

    return L, a, b
end

---@param L number
---@param a number
---@param b number
---@return number r
---@return number g
---@return number b
function M.oklab_to_rgb(L, a, b)
    local l_prime = L + a * 0.3963377774 + b * 0.2158037573
    local m_prime = L - a * 0.1055613458 - b * 0.0638541728
    local s_prime = L - a * 0.0894841775 - b * 1.2914855480

    local l = l_prime * l_prime * l_prime
    local m = m_prime * m_prime * m_prime
    local s = s_prime * s_prime * s_prime

    local r_lin = 4.0767416621 * l - 3.3077115913 * m + 0.2309699292 * s
    local g_lin = -1.2684380046 * l + 2.6097574011 * m - 0.3413193965 * s
    local b_lin = -0.0041960863 * l - 0.7034186147 * m + 1.7076147010 * s

    local function linear_to_srgb(c)
        if c <= 0.0031308 then
            return c * 12.92
        else
            return 1.055 * math.pow(c, 1.0 / 2.4) - 0.055
        end
    end

    local r = linear_to_srgb(r_lin)
    local g = linear_to_srgb(g_lin)
    local b = linear_to_srgb(b_lin)

    -- 値を 0.0 から 1.0 の範囲にクランプ（丸め込み）
    local function clamp(val)
        return math.max(0.0, math.min(1.0, val))
    end

    return clamp(r), clamp(g), clamp(b)
end

function M.rgb_to_hex(r, g, b)
    local function number_to_hex(v)
        local v_int = math.floor(v * 255.0 + 0.5)
        v_int = math.max(0, math.min(255, v_int))
        return string.format("%02x", v_int)
    end
    return "#" .. number_to_hex(r) .. number_to_hex(g) .. number_to_hex(b)
end

---@param key string
---@return string?
---@return number?
function M.parse_color_index(key)
    local hue = string.sub(key, 1, 1)
    local num_str = string.sub(key, 2)

    local level
    local num_len = #num_str

    if num_len == 0 then
        level = 1.0
    else
        local num_int = tonumber(num_str)
        if not num_int then
            return nil
        end

        if num_len == 1 then
            level = num_int / 10.0
        elseif num_len == 2 then
            level = num_int / 100.0
        elseif num_len == 3 then
            level = num_int / 1000.0
        else
            return nil
        end
    end

    return hue, level
end

return M
