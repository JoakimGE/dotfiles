-- lua/plugins/toggleterm.lua
return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      -- customize your settings here
      size = 20, -- height of the terminal
      open_mapping = [[<leader>tt]], -- keybinding to toggle the terminal
      direction = 'horizontal', -- or 'vertical', 'float'
      terminal_mappings = true, -- allow terminal mappings
      -- ... other options
    }
  end,
}
