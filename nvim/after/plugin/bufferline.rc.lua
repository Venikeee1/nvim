local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

local colors = {
  active = '#073642'
}

bufferline.setup({
  options = {
    mode = "buffers",
    separator_style = 'padded_slant',
    always_show_bufferline = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    color_icons = true,
    diagnostics = 'nvim_lsp',
    offsets = {
      {
        filetype = "NvimTree",
        text = "    ' ﬦ", -- Color
        highlight = "Directory"
      }
    }
  },
})

local wk = require('which-key');
wk.register({
  ['<leader>'] = {
    c = {
      ':bd<CR>',
      'close current buffer'
    }
  }
})

vim.keymap.set('n', '[b', ':BufferLineCycleNext<CR>', {})
vim.keymap.set('n', ']b', ':BufferLineCyclePrev<CR>', {})
vim.keymap.set('n', '<leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>', {})
vim.keymap.set('n', '<leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>', {})
vim.keymap.set('n', '<leader>3', '<Cmd>BufferLineGoToBuffer 3<CR>', {})
vim.keymap.set('n', '<leader>4', '<Cmd>BufferLineGoToBuffer 4<CR>', {})
vim.keymap.set('n', '<leader>5', '<Cmd>BufferLineGoToBuffer 5<CR>', {})
vim.keymap.set('n', '<leader>6', '<Cmd>BufferLineGoToBuffer 6<CR>', {})
vim.keymap.set('n', '<leader>7', '<Cmd>BufferLineGoToBuffer 7<CR>', {})
vim.keymap.set('n', '<leader>8', '<Cmd>BufferLineGoToBuffer 8<CR>', {})
vim.keymap.set('n', '<leader>9', '<Cmd>BufferLineGoToBuffer 9<CR>', {})
