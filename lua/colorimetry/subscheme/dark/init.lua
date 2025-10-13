local M = {}

---@type colorimetry.generator.cone.Config
M.fg_config = {
    l0 = 0.9,
    l1 = 0.55,
    r0 = { long = 0.08, short = 0.05 },
    r1 = { long = 0.15, short = 0.12 },
    offset = { 0.00, 0.01 },
    phi = 0.6,
    hues = {
        w = "center",
        y = 0.950,
        g = 0.125,
        e = 0.250,
        b = 0.375,
        v = 0.500,
        p = 0.625,
        r = 0.720,
        o = 0.850,
    },
}

---@type colorimetry.generator.cone.Config
M.bg_config = {
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

M.fg = require("colorimetry.generator").with_cone(M.fg_config)
M.bg = require("colorimetry.generator").with_cone(M.bg_config)

function M.load(ns_id)
    ---@param name string
    local function sethl(name)
        ---@param val vim.api.keyset.highlight
        return function(val)
            vim.api.nvim_set_hl(ns_id, name, val)
        end
    end

    local fg = M.fg
    local bg = M.bg

    sethl("Normal") { fg = fg.w0 }

    sethl("ColorColumn") { bg = bg.w5 }
    sethl("Conceal") { fg = fg.w6 }
    sethl("Cursor") { reverse = true }
    sethl("CursorColumn") { bg = bg.w75 }
    sethl("CursorLine") { link = "CursorColumn" }
    sethl("Directory") { fg = fg.g4 }
    sethl("DiffAdd") { bg = bg.g25 }
    sethl("DiffChange") { bg = bg.b25 }
    sethl("DiffDelete") { bg = bg.r25 }
    sethl("DiffText") { bg = bg.b5 }
    sethl("EndOfBuffer") {}
    sethl("TermCursor") { reverse = true }
    sethl("ErrorMsg") { fg = fg.r8 }
    sethl("WinSeparator") { fg = fg.w4 }
    sethl("Folded") { fg = fg.v2 }
    sethl("FoldColumn") { bg = bg.w25, fg = fg.w8 }
    sethl("SignColumn") { bg = bg.w25, fg = fg.w8 }
    sethl("Substitute") { bg = bg.b5 }

    sethl("LineNr") { bg = bg.w25 }
    sethl("CursorLineNr") { bg = bg.w25, bold = true }
    sethl("MatchParen") { bg = bg.p8, bold = true }
    sethl("ModeMsg") { bold = true }
    sethl("MoreMsg") { fg = fg.b4 }
    sethl("NonText") { fg = fg.w8, bg = bg.w5 }
    sethl("SpecialKey") { fg = fg.w8, bg = bg.w5 }

    sethl("NormalFloat") { fg = fg.w0, bg = bg.w5 }
    sethl("FloatBorder") { link = "WinSeparator" }
    sethl("FloatTitle") { bold = true }
    sethl("FloatFooter") { italic = true }
    sethl("PmenuSel") { bg = bg.g }
    sethl("Question") { fg = fg.o }
    sethl("QuickfixLine") { fg = fg.e6 }

    sethl("WinBar") { bg = bg.r }
    sethl("WinBarNC") { bg = "NONE" }

    sethl("Search") { bg = bg.b }
    sethl("CurSearch") { bg = bg.b, bold = true }
    sethl("IncSearch") { bg = bg.b75 }

    sethl("SpellBad") { undercurl = true, sp = fg.r6 }
    sethl("SpellCap") { undercurl = true, sp = fg.b6 }
    sethl("SpellLocal") { undercurl = true, sp = fg.g6 }
    sethl("SpellRare") { undercurl = true, sp = fg.y6 }
    sethl("StatusLine") { link = "WinSeparator" }
    sethl("StatusLineNC") { link = "WinSeparator" }
    sethl("Visual") { bg = bg.p }
    sethl("WarningMsg") { fg = fg.y2 }
    sethl("Whitespace") { fg = fg.v }

    sethl("@winbar.reset") { bg = "NONE" }

    sethl("@attribute") { fg = fg.o0 }
    sethl("@attribute.builtin") { fg = fg.o4 }
    sethl("@boolean") { fg = fg.p4 }
    sethl("@character") { fg = fg.y4 }
    sethl("@character.special") { fg = fg.y6 }
    sethl("@comment") { fg = fg.w8 }
    sethl("@comment.documentation") { fg = fg.w4 }
    sethl("@conditional") { link = "@keyword" }
    sethl("@constant") { fg = fg.p2 }
    sethl("@constant.builtin") { fg = fg.p6 }
    sethl("@constant.macro") {}
    sethl("@constructor") {}
    sethl("@debug") {}
    sethl("@define") {}
    sethl("@exception") {}
    sethl("@float") {}
    sethl("@function") { fg = fg.e4 }
    sethl("@function.method") { fg = fg.e2 }
    sethl("@function.builtin") { fg = fg.e6 }
    sethl("@function.call") { fg = fg.e2 }
    sethl("@function.macro") { fg = fg.e4 }
    sethl("@include") {}
    sethl("@keyword") { fg = fg.y2 }
    sethl("@label") { fg = fg.v4 }
    sethl("@markup.raw") { fg = fg.g2 }
    sethl("@markup.heading") { fg = fg.y2, bold = true }
    sethl("@markup.heading.weak") { fg = fg.y4 }
    sethl("@method") {}
    sethl("@method.call") {}
    sethl("@module") { fg = fg.o2 }
    sethl("@namespace") {}
    sethl("@none") { bg = "NONE", fg = "NONE" }
    sethl("@number") { fg = fg.p4 }
    sethl("@number.float") { fg = fg.p4 }
    sethl("@operator") { fg = fg.v2 }
    sethl("@parameter") { fg = fg.b0 }
    sethl("@preproc") {}
    sethl("@property") { fg = fg.b0 }
    sethl("@punctuation") { fg = fg.o6 }
    sethl("@punctuation.delimiter") { fg = fg.o8 }
    sethl("@punctuation.bracket") { fg = fg.o6 }
    sethl("@punctuation.special") { fg = fg.o6 }
    sethl("@repeat") { link = "@keyword" }
    sethl("@storageclass") {}
    sethl("@string") { fg = fg.g4 }
    sethl("@string.field") { fg = fg.g2 }
    sethl("@string.special") { fg = fg.g6 }
    sethl("@string.regexp") { fg = fg.g6 }
    sethl("@string.escape") { fg = fg.e8 }
    sethl("@string.documentation") { fg = fg.g0 }
    sethl("@symbol") { link = "@property" }
    sethl("@tag") { fg = fg.o0 }
    sethl("@tag.attribute") { fg = fg.o0 }
    sethl("@tag.delimiter") { fg = fg.o8 }
    sethl("@text") {}
    sethl("@text.danger") {}
    sethl("@text.diff.add") { link = "DiffAdd" }
    sethl("@text.diff.addsign") { fg = fg.g2, bold = true }
    sethl("@text.diff.change") { link = "DiffChange" }
    sethl("@text.diff.delete") { link = "DiffDelete" }
    sethl("@text.diff.delsign") { fg = fg.r2, bold = true }
    sethl("@text.diff.indicator") { bg = bg.w }
    sethl("@text.emphasis") { italic = true }
    sethl("@text.environment") {}
    sethl("@text.environment.name") {}
    sethl("@text.literal") { fg = fg.g0 }
    sethl("@text.math") {}
    sethl("@text.note") {}
    sethl("@text.quote") { fg = fg.w4 }
    sethl("@text.reference") { fg = fg.b0 }
    sethl("@text.strike") { strikethrough = true }
    sethl("@text.strong") { bold = true }
    sethl("@text.title") { fg = fg.y2, bold = true }
    sethl("@text.title.weak") { fg = fg.y0 }
    sethl("@text.todo") {}
    sethl("@text.underline") { underline = true }
    sethl("@text.uri") { fg = fg.v6 }
    sethl("@text.warning") {}
    sethl("@type") { fg = fg.b4 }
    sethl("@type.builtin") { fg = fg.b6 }
    sethl("@type.definition") {}
    sethl("@type.qualifier") {}
    sethl("@variable") {}
    sethl("@variable.parameter") { fg = fg.b0 }
    sethl("@variable.builtin") { fg = fg.v4 }
    sethl("@variable.member") {}

    sethl("Boolean") { link = "@boolean" }
    sethl("Character") { link = "@character" }
    sethl("Conditional") { link = "@conditional" }
    sethl("Constant") { link = "@constant" }
    sethl("Debug") { link = "@debug" }
    sethl("Define") { link = "@define" }
    sethl("Delimiter") { link = "@punctuation.delimiter" }
    sethl("Exception") { link = "@exception" }
    sethl("Float") { link = "@float" }
    sethl("Function") { link = "@function" }
    sethl("Identifier") { link = "@symbol" }
    sethl("Include") { link = "@include" }
    sethl("Keyword") { link = "@keyword" }
    sethl("Label") { link = "@label" }
    sethl("Macro") { link = "@function.macro" }
    sethl("Number") { link = "@number" }
    sethl("Operator") { link = "@operator" }
    sethl("PreProc") { link = "@preproc" }
    sethl("Quote") { link = "@text.quote" }
    sethl("Repeat") { link = "@repeat" }
    sethl("Special") { link = "@constant.builtin" }
    sethl("SpecialChar") { link = "@character.special" }
    sethl("SpecialComment") { link = "@text.note" }
    sethl("StorageClass") { link = "@storageclass" }
    sethl("String") { link = "@string" }
    sethl("Tag") { link = "@tag" }
    sethl("Title") { link = "@text.title" }
    sethl("Todo") { link = "@text.todo" }
    sethl("Type") { link = "@type" }
    sethl("Typedef") { link = "@type.definition" }
    sethl("Underlined") { link = "@text.uri" }

    require("colorimetry.subscheme.dark.gitsigns")(ns_id, fg, bg)
    require("colorimetry.subscheme.dark.terminal")(ns_id, fg, bg)
    require("colorimetry.subscheme.dark.fish")(ns_id, fg, bg)
end

return M
