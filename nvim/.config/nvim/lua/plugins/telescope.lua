return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  -- or                              , branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim',
    "nvim-tree/nvim-web-devicons",
    "sharkpd/fd",
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
  },
  config = function()
    require('telescope').setup {
      defaults = {
        theme = 'ivy' -- this is one option
        -- theme = 'dropdown', --another example
        -- other options...
      },
      -- other configurations...
    }
  end
}
