return {
  "EdenEast/nightfox.nvim",
  config = function()
    require("nightfox").setup({
      options = {
        transparent = true,
      },
      -- You can specify a particular Nightfox variant here, e.g., "carbonfox"
      theme = "carbonfox",
    })
    -- Load the colorscheme after setup
    -- vim.cmd "colorscheme carbonfox" -- Or your chosen variant like "carbonfox"
  end,
}
