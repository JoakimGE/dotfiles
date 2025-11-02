
-- mason.lua
return {
  -- Mason core UI/commands
  {
    "mason-org/mason.nvim",
    opts = {},  -- defaults are fine
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate" },
  },

  -- Bridge that auto-enables installed servers (default behavior)
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
    opts = {
      -- optional:
      -- ensure_installed = { "lua_ls", "pyright" },
      -- automatic_enable = true, -- this is the default
    },
    event = "BufReadPre",
  },

  -- You still need nvim-lspconfig on the runtimepath for server configs,
  -- but DO NOT call require('lspconfig') yourself (deprecated).
  { "neovim/nvim-lspconfig", lazy = true },
}
