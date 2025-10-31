return {
  -- ...
  {
    'github/copilot.vim',
    lazy = false,
    config = function() -- Mapping tab is already used in NvChad
      vim.g.copilot_no_tab_map = true -- Disable tab mapping
      vim.g.copilot_assume_mapped = true -- Assume that the mapping is already done

      -- Starts neovim with copilot disabled
      vim.g.copilot_enabled = false

      -- Custom mapping for accepting Copilot suggestions
      vim.keymap.set('i', '<C-j>', 'copilot#Accept("<CR>")', { silent = true, expr = true, noremap = true, replace_keycodes = false })
      vim.keymap.set('n', '<leader>cpd', ':Copilot disable<cr>', { silent = true, noremap = true })
      vim.keymap.set('n', '<leader>cpe', ':Copilot enable<cr>', { silent = true, noremap = true })
    end,
  },
}
