local M = {}

M.base_30 = {
  white = "#3760bf",
  darker_black = "#d0d5e3",
  black = "#e1e2e7",
  black2 = "#c4c8da",
  one_bg = "#d0d5e3",
  one_bg2 = "#c1c9df",
  one_bg3 = "#b7c1e3",
  grey = "#a8aecb",
  grey_fg = "#8990b3",
  grey_fg2 = "#68709a",
  light_grey = "#6172b0",
  red = "#f52a65",
  baby_pink = "#d20065",
  pink = "#9854f1",
  line = "#b4b5b9",
  green = "#587539",
  vibrant_green = "#38919f",
  nord_blue = "#2e7de9",
  blue = "#2e7de9",
  yellow = "#8c6c3e",
  sun = "#a27629",
  purple = "#7847bd",
  dark_purple = "#9854f1",
  teal = "#118c74",
  orange = "#b15c00",
  cyan = "#007197",
  statusline_bg = "#d0d5e3",
  lightbg = "#c4c8da",
  pmenu_bg = "#2e7de9",
  folder_bg = "#2e7de9",
}

M.base_16 = {
  base00 = "#e1e2e7",
  base01 = "#d0d5e3",
  base02 = "#c4c8da",
  base03 = "#8990b3",
  base04 = "#68709a",
  base05 = "#3760bf",
  base06 = "#2e5857",
  base07 = "#1f2335",
  base08 = "#f52a65",
  base09 = "#b15c00",
  base0A = "#8c6c3e",
  base0B = "#587539",
  base0C = "#007197",
  base0D = "#2e7de9",
  base0E = "#7847bd",
  base0F = "#c64343",
}

M.type = "light"

M.polish_hl = {
  nvimtree = {
    NvimTreeNormal = { fg = M.base_16.base05, bg = M.base_16.base00 },
    NvimTreeNormalNC = { fg = M.base_16.base05, bg = M.base_16.base00 },
    NvimTreeFolderName = { fg = M.base_30.blue },
    NvimTreeOpenedFolderName = { fg = M.base_30.blue },
    NvimTreeEmptyFolderName = { fg = M.base_30.blue },
    NvimTreeFolderIcon = { fg = M.base_30.blue },
    NvimTreeFolderArrowOpen = { fg = M.base_30.grey_fg2 },
    NvimTreeFolderArrowClosed = { fg = M.base_30.grey_fg2 },
    NvimTreeCursorLine = { bg = M.base_16.base02 },
    NvimTreeGitIgnored = { fg = M.base_30.grey_fg2 },
    NvimTreeIndentMarker = { fg = M.base_30.line },
    NvimTreeWinSeparator = { fg = M.base_30.line, bg = M.base_16.base00 },
  },
}

M = require("base46").override_theme(M, "tokyonight_day")

return M
