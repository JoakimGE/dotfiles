
-- lsp.lua
return {
  {
    -- this module only sets global LSP defaults for all servers
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      -- Global defaults for *all* LSP configs (new 0.11 API)
      -- No touching lspconfig.setup anywhere.
      vim.lsp.config("*", {
        capabilities = capabilities,
        on_attach = on_attach,
        -- you can add flags/settings here that should apply to all servers
      })

      -- nicer diagnostics
      vim.diagnostic.config({
        virtual_text = true,
        float = { border = "rounded" },
        severity_sort = true,
      })
    end,
  },
}
