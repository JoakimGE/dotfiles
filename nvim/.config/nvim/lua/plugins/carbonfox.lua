return {
  "EdenEast/nightfox.nvim", -- Replace with the actual GitHub path if different
  lazy = false,               -- Set to false to load on startup, or true if you want to load it only when needed
  priority = 1000,            -- Colorschemes should generally have a high priority
  config = function()
    vim.cmd.colorscheme 'carbonfox'
  end,
}
