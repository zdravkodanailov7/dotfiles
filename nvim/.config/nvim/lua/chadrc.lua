---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "solarized_osaka",
  transparency = true,
  hl_override = {
    -- transplants from craftzdog's solarized-osaka (the base46 port covers ~98%;
    -- these are the only visible differences found by palette diff, 2026-06-12)
    LineNr = { fg = "#664d00" },           -- yellow700
    CursorLineNr = { fg = "#ca4c16" },     -- orange500
    Comment = { fg = "#586e74", italic = true },      -- base01 + italic
    ["@comment"] = { fg = "#586e74", italic = true },
    Keyword = { italic = true },           -- solarized's slanted keywords
    ["@keyword"] = { italic = true },
    -- hint diagnostics were near-invisible (dim grey + transparent bg); brighten to a
    -- readable cyan. lualine's diagnostics segment reads this group too.
    DiagnosticHint = { fg = "#2aeddd" },
  },
}

M.ui = {
  statusline = { enabled = false },
}

return M
