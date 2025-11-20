-- Setting leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
require("config.lazy")
require "keymaps"
require("keymaps").setup()
require "options"
require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/snippets" })

vim.cmd("colorscheme cyberdream")

-- Check if on NixOS, disable automatic_installation if true
local on_nixos = vim.env.NIXOS == "true"

if not on_nixos then
  require("mason").setup()
  require("mason-lspconfig").setup {
    automatic_installation = true,
  }
end

-- Auto-format on save using the active LSP
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = true }),
  callback = function(args)
    -- Protect against LSPs that don’t support formatting
    local clients = vim.lsp.get_clients({ bufnr = args.buf })
    for _, client in ipairs(clients) do
      if client.supports_method("textDocument/formatting") then
        vim.lsp.buf.format({ bufnr = args.buf, async = false })
        return
      end
    end
  end,
})
