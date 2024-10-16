require("luasnip").filetype_extend("javascript", { "javascriptreact" })
require("luasnip").filetype_extend("javascript", { "html" })
require("luasnip/loaders/from_vscode").lazy_load()

return {

  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },

  {
    "L3MON4D3/LuaSnip",
    keys = {
      { "<tab>", false, mode = { "i", "s" } },
    },
  },

  -- Create annotations with one keybind, and jump your cursor in the inserted annotation
  {
    "danymat/neogen",
    keys = {
      {
        "<leader>cc",
        function()
          require("neogen").generate {}
        end,
        desc = "Neogen Comment",
      },
    },
    opts = { snippet_engine = "luasnip" },
  },

  -- Incremental rename
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },

  -- Refactoring tool
  {
    "ThePrimeagen/refactoring.nvim",
    keys = {
      {
        "<leader>r",
        function()
          require("refactoring").select_refactor()
        end,
        mode = "v",
        noremap = true,
        silent = true,
        expr = false,
      },
    },
    opts = {},
  },

  -- Go forward/backward with square brackets
  {
    "echasnovski/mini.bracketed",
    event = "BufReadPost",
    config = function()
      local bracketed = require "mini.bracketed"
      bracketed.setup {
        file = { suffix = "" },
        window = { suffix = "" },
        quickfix = { suffix = "" },
        yank = { suffix = "" },
        treesitter = { suffix = "n" },
      }
    end,
  },

  -- Better increase/descrease
  {
    "monaqa/dial.nvim",
    -- stylua: ignore
    keys = {
      { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
      { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
    },
    config = function()
      local augend = require "dial.augend"
      require("dial.config").augends:register_group {
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.constant.alias.bool,
          augend.semver.alias.semver,
          augend.constant.new { elements = { "let", "const" } },
        },
      }
    end,
  },

  {
    "simrat39/symbols-outline.nvim",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    cmd = "SymbolsOutline",
    opts = {
      position = "right",
    },
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {

      {
        "supermaven-inc/supermaven-nvim",
        opts = {

          log_level = "off", -- set to "off" to disable logging completely
          keymaps = {
            accept_suggestion = "<Tab>",
            clear_suggestion = "<C-]>",
            accept_word = "<C-j>",
          },
        },
      },

      {
        "hrsh7th/cmp-cmdline",
        event = "CmdlineEnter",
        config = function()
          local cmp = require "cmp"

          cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = { { name = "buffer" } },
          })

          cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
            matching = { disallow_symbol_nonprefix_matching = false },
          })
        end,
      },
    },

    opts = function(_, opts)
      opts.sources[1].trigger_characters = { "-" }
      table.insert(opts.sources, 1, { name = "supermaven" })
      local cmp = require "cmp"
      opts.mapping = cmp.mapping.preset.insert()
      local config = require "nvchad.configs.cmp"
      config.mapping["<Tab>"] = nil
      config.mapping["<Enter>"] = cmp.mapping.confirm { select = false }
      return config
    end,
  },
}
