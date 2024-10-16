-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme_toggle = { "tundra" },
  theme = "tundra",
  transparency = true,
  integrations = { "alpha" },

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}
M.lsp = {
  signature = false,
}
M.plugins = {
  options = {
    lsp_config = {
      setup_lspconf = "config.lspconfig",
    },
  },
}

M.ui = { telescope = { style = "bordered" } }
M.ui.extended_integrations = {
  "alpha",
}

M.nvdash = {
  load_on_startup = false,
}

return M
