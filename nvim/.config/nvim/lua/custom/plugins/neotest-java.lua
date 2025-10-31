return {
  {
    'rcasia/neotest-java',
    ft = 'java',
    dependencies = {
      'mfussenegger/nvim-jdtls',
      'mfussenegger/nvim-dap', -- for the debugger
      'rcarriga/nvim-dap-ui', -- recommended
      'theHamsta/nvim-dap-virtual-text', -- recommended
    },
  },
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    keys = {
      {
        '<leader>tr',
        function()
          require('neotest').run.run()
        end,
        desc = 'Neotest run',
      },
      {
        '<leader>tf',
        function()
          require('neotest').run.run(vim.fn.expand '%')
        end,
        desc = 'Run File Tests',
      },
      {
        '<leader>ta',
        function()
          require('neotest').run.run { suite = true }
        end,
        desc = 'Run All Tests',
      },
      {
        '<leader>ts',
        function()
          require('neotest').summary.toggle()
        end,
        desc = 'Toggle Test Summary',
      },
      {
        '<leader>ti',
        function()
          require('neotest').output.open { enter = true }
        end,
        desc = 'Open Test Output',
      },
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-java' {
            -- config here
          },
        },
      }
    end,
  },
}
