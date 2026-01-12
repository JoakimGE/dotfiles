return -- lsp.lua or wherever
{
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local on_attach = function(client, bufnr)
      -- your keymaps etc
    end

    -- Global defaults for *all* servers
    vim.lsp.config("*", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- List the servers you want
    local servers = {
      "ts_ls", -- or "tsserver" if that’s what you use
      "lua_ls",
      "gopls",
      "rust_analyzer",
      "pyright",
      "texlab",
      "jdtls",
      "zls",
      -- add more…
    }

    for _, server in ipairs(servers) do
      -- extra per-server settings can go in the 2nd arg
      vim.lsp.config(server, {})
      vim.lsp.enable(server)
    end

    vim.diagnostic.config({
      virtual_text = true,
      float = { border = "rounded" },
      severity_sort = true,
    })
  end,
}
