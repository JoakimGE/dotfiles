return {
  'scottmckendry/cyberdream.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('cyberdream').setup {
      -- ... other config

      variant = 'auto',
      options = {
        theme = 'auto', -- "auto" will set the theme dynamically based on the colorscheme
        -- sets the background to be transparent
      },
      -- ... other config
      transparent = true,
    }
  end,
}
