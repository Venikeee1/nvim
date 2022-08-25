local status, term = pcall(require, 'toggleterm')
if not status then return end

term.setup({
  direction = 'float'
})

local wk = require('which-key')
local opts = {buffer = 0 }

wk.register({
  t = {
    t = {
      ':ToggleTerm<CR>',
      'toggle terminal'
    }
  },
})

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, bufnr })

function _lazygit_toggle()
  lazygit:toggle()
end

function _lazygit_close()
  lazygit:close()
end

wk.register({
  ['<leader>'] = {
    g = {
       ":lua _lazygit_toggle()<CR>",
      'toggle term open lazygit',
      noremap = true,
      silent = true
    },
  },
  ['<C-j>'] = {
    ":lua _lazygit_close()<CR>",
    'lazygit close in termial word',
    mode = 't',
  }
})

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<C-s>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-q>', [[<C-\><C-n>:ToggleTerm<CR>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')

