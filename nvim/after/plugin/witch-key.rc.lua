local status, witch_key = pcall(require, 'whitch-key')
if not status then return end

witch_key.setup({
  plugins = {
    spelling = {
      enabled = true,
      suggestions = 25
    }
  },
  window = {
    border = "single", -- none, single, double, shadow
    position = "top", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0
  },
})
