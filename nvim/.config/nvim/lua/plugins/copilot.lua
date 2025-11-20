return {
  "github/copilot.vim",
  config = function()
    vim.g.copilot_no_tab_map = true
    vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { expr = true, silent = true })
    vim.api.nvim_set_keymap("i", "<C-n>", 'copilot#Next()', { expr = true, silent = true })
    vim.api.nvim_set_keymap("i", "<C-p>", 'copilot#Previous()', { expr = true, silent = true })
    -- Disable Copilot by default
    vim.g.copilot_enabled = 0
    -- Toggle Copilot
    vim.keymap.set("n", "<leader>ct", function()
      if vim.g.copilot_enabled == 1 then
        vim.g.copilot_enabled = 0
        print("Copilot Disabled")
      else
        vim.g.copilot_enabled = 1
        print("Copilot Enabled")
      end
    end, { noremap = true, silent = true })
  end,
}
