local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
-- Varible for function name
local k = vim.api.nvim_set_keymap

-- disabling space
k("", "<Space>", "<Nop>", opts)

-- Keymaps general
k("n", "<leader>e", ":Ex <cr>", opts)
k('n', '<Esc>', ':noh<CR><Esc>', opts)

-- Center screen after movement
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

k("n", "<A-j>", ":m .+1<CR>==", opts) -- move line up(n)
k("n", "<A-k>", ":m .-2<CR>==", opts) -- move line down(n)

-- Visual
k("v", "<", "<gv", opts)                  -- Code remains marked after indenting
k("v", ">", ">gv", opts)
k("v", "p", '"_dp', opts)                 -- Keep the previous word when pasting over another

k("v", "<A-j>", ":m '>+1<CR>gv=gv", opts) -- move line up(v)
k("v", "<A-k>", ":m '<-2<CR>gv=gv", opts) -- move line down(v)

-- Terminal
k("t", "<ESC><ESC>", "<C-\\><C-n>", opts)

-- Disabling arrows lol
k('i', '<Up>', '<Nop>', opts)
k('i', '<Down>', '<Nop>', opts)
k('i', '<Left>', '<Nop>', opts)
k('i', '<Right>', '<Nop>', opts)
k('n', '<Up>', '<Nop>', opts)
k('n', '<Down>', '<Nop>', opts)
k('n', '<Left>', '<Nop>', opts)
k('n', '<Right>', '<Nop>', opts)
k('i', '<C-Up>', '<Nop>', opts)
k('i', '<C-Down>', '<Nop>', opts)
k('i', '<C-Left>', '<Nop>', opts)
k('i', '<C-Right>', '<Nop>', opts)
k('n', '<C-Up>', '<Nop>', opts)
k('n', '<C-Down>', '<Nop>', opts)
k('n', '<C-Left>', '<Nop>', opts)
k('n', '<C-Right>', '<Nop>', opts)
k('i', '<S-Up>', '<Nop>', opts)
k('i', '<S-Down>', '<Nop>', opts)
k('i', '<S-Left>', '<Nop>', opts)
k('i', '<S-Right>', '<Nop>', opts)
k('n', '<S-Up>', '<Nop>', opts)
k('n', '<S-Down>', '<Nop>', opts)
k('n', '<S-Left>', '<Nop>', opts)
k('n', '<S-Right>', '<Nop>', opts)


-- LSP Keymaps
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspKeymaps", {}),
  callback = function(args)
    local lspOpts = { buffer = args.buf, silent = true, noremap = true }
    local map = function(mode, lhs, rhs)
      vim.keymap.set(mode, lhs, rhs, lspOpts)
    end

    map("n", "gd", vim.lsp.buf.definition)
    map("n", "gr", vim.lsp.buf.references)
    map("n", "gi", vim.lsp.buf.implementation)
    map("n", "K", vim.lsp.buf.hover)
    map("n", "gq", vim.diagnostic.open_float)
    map("n", "<leader>rn", vim.lsp.buf.rename)
    map("n", "<leader>ca", vim.lsp.buf.code_action)
  end,
})


-- File movement
k('n', '<leader>sk', ":e ~/.config/nvim/lua/keymaps.lua <CR>", opts)


local M = {}

function M.setup()
  local harpoon = require("harpoon")
  local list = harpoon:list()
  local map = function(lhs, fn)
    vim.keymap.set("n", lhs, fn, { noremap = true, silent = true })
  end

  -- Telescope
  map("<leader>sf", function()
    require("telescope.builtin").find_files()
  end)
  map("<leader>sg", function()
    require("telescope.builtin").live_grep()
  end)
  map("<leader><leader>", function()
    require("telescope.builtin").buffers()
  end)
  map("gD", function()
    require("telescope.builtin").diagnostics()
  end)

  -- Harpoon
  map("<leader>a", function() list:add() end)
  map("<leader>h", function() harpoon.ui:toggle_quick_menu(list) end)
  map("<leader>1", function() list:select(1) end)
  map("<leader>2", function() list:select(2) end)
  map("<leader>3", function() list:select(3) end)
  map("<leader>4", function() list:select(4) end)
  map("<leader>5", function() list:select(5) end)
  map("<leader>6", function() list:select(6) end)
end

return M
