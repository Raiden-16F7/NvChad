return {
  -- messages, cmdline and the popupmenu
  {
    "goolord/alpha-nvim",
    dependencies = {
      "echasnovski/mini.icons",
      "nvim-lua/plenary.nvim",
    },
    event = "VimEnter",
    config = function()
      dofile(vim.g.base46_cache .. "syntax")
      -- Import the necessary modules
      local alpha = require "alpha"
      local dashboard = require "alpha.themes.theta"

      -- Define your logo (ASCII art)
      local logo = [[
      ⠀⠀⣀⣀⡀⠀⠀⣀⣀⣀⣀⣀⣀⠀⠀⠀⣀⣀⣀⠀⠀⠀⠀⠀⣀⣀⠀⠀⠀⠀⣀⣀⡀⠀⢀⣀⡀⠀⢀⣀⣀⣀⣀⣀⡀⠀⠀
      ⣴⣿⠟⠛⢿⣦⡀⣿⡟⠛⠛⠛⣿⣷⣰⣿⠟⠛⢿⣷⡄⢠⣠⣤⣿⠻⠗⠀⣴⣿⠟⠛⢿⣦⣸⣿⣧⣾⡿⢛⣿⡿⠟⠻⣿⣦⠀
      ⣿⡇⠀⠀⠀⣿⡇⣿⣷⣄⡀⠀⠉⠁⣿⣇⠀⠀⠀⣿⡇⣀⡉⠻⢿⣶⣄⡰⣿⣇⠀⠀⠀⣿⡿⣿⣿⣅⡀⢸⣿⡀⠀⠀⢸⣿⠀
      ⠙⠿⣷⣶⣦⣿⡇⠛⠋⠛⢿⣷⣤⡀⠙⠿⣷⣶⡦⣿⡇⢿⣷⣶⣶⣿⣿⣿⠙⠿⣷⣶⡆⣿⡟⠛⠋⠻⢿⣶⣿⣿⣷⣶⣼⣿
    ]]

      -- Set header of the dashboard
      dashboard.header.val = vim.split(logo, "\n")

      -- Setup alpha with the dashboard configuration
      alpha.setup(dashboard.config)
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },

  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",

    config = function()
      require("notify").setup {
        background_color = "#000000",
      }
    end,
  },

  { "nvchad/volt", lazy = true },

  {
    "nvchad/minty",
    cmd = { "Shades", "Huefy" },
  },
}
