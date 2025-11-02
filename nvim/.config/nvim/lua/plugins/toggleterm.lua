return    {
  "akinsho/toggleterm.nvim",
  version = "*", -- or specify a commit/tag
  config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<leader>tt]],
        direction = "horizontal",
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved",
          winblend = 0,
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
      })
  end,
}
