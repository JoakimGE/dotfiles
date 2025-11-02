
-- lua/plugins/cmp.lua
return {
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      { "rafamadriz/friendly-snippets" },
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- LuaSnip setup
      require("luasnip.loaders.from_vscode").lazy_load()
      -- Optional: regex-powered snippet features (needs build step on install)
      -- LuaSnip is declared without build here because some systems lack make

      cmp.setup({
        snippet = {
          expand = function(args) luasnip.lsp_expand(args.body) end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-y>"]      = cmp.mapping.confirm({ select = true }),
          ["<C-n>"]     = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<C-p>"]   = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
          { name = "buffer" },
        },
        completion = { completeopt = "menu,menuone,noinsert" },
        preselect = cmp.PreselectMode.Item,
      })

      -- Small UX tweaks
      vim.o.completeopt = "menu,menuone,noselect"
      vim.o.updatetime = 300
    end,
  },

}
