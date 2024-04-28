local map = vim.keymap.set

-- Move to previous/next
map('n', '<S-tab>', '<Cmd>BufferPrevious<CR>', { desc = 'Go to the previous buffer' })
map('n', '<tab>', '<Cmd>BufferNext<CR>', { desc = 'Go to the next buffer' })
map('n', '<leader>x', '<Cmd>BufferClose<CR>', { desc = 'Close the current buffer' })

return {
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      sidebar_filetypes = {
        NvimTree = true,
      },

      icons = {
        filetype = {
          enabled = false,
        },
      },
    },
  },
}
