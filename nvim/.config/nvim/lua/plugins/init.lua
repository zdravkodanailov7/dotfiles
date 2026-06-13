return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      -- theme-file donor for lualine only; do NOT :colorscheme solarized-osaka (base46 owns editor colors)
      "craftzdog/solarized-osaka.nvim",
    },
    event = "VeryLazy",
    opts = {
      options = { theme = "solarized_dark" }, -- lualine's bundled classic-solarized (trying vs craftzdog's osaka)
      sections = {
        -- default b is { branch, diff, diagnostics }; re-stated so we can recolor the
        -- statusline hint to the dark "Top"-text color (base04) — readable on this
        -- light section bg, independent of the in-editor DiagnosticHint (cyan, on dark).
        lualine_b = {
          "branch",
          "diff",
          {
            "diagnostics",
            -- dark, saturated colors so each severity reads on the light section bg,
            -- independent of the in-editor Diagnostic* groups (bright, on dark).
            diagnostics_color = {
              error = { fg = "#8b0000" }, -- dark red
              warn = { fg = "#8a5500" }, -- dark amber (ts_ls rarely emits warnings; here if it ever does)
              hint = { fg = "#00141a" }, -- dark navy, matches the "Top"/location text
            },
          },
        },
        -- default x is { "encoding", "fileformat", "filetype" }; dropped the always-utf-8 and the penguin
        lualine_x = {
          "filetype",
          -- project folder (tail of cwd), like NvChad's statusline showed
          function()
            return "󰉋 " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
          end,
        },
      },
    },
  },

  {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter", "LazyGitFilterCurrentFile" },
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    lazy = false,
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },

  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    opts = {
      easing = "sine",
      duration_multiplier = 0.7,
      hide_cursor = true,
    },
  },

  {
    "sphamba/smear-cursor.nvim",
    event = "VeryLazy",
    opts = {
      smear_insert_mode = true,
    },
  },

  {
    "nvzone/showkeys",
    cmd = "ShowkeysToggle",
    keys = {
      { "<leader>ks", "<cmd>ShowkeysToggle<CR>", desc = "Toggle showkeys" },
    },
    opts = {
      position = "top-right",
      maxkeys = 3,
      show_count = true,
      winopts = {
        focusable = false,
        relative = "editor",
        style = "minimal",
        border = "single",
        height = 1,
        row = 1,
        col = 0,
      },
    },
  },
  {
    "m4xshen/hardtime.nvim",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
