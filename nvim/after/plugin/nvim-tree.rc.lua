local status, neo_vim = pcall(require, "nvim-tree")
if (not status) then return end

neo_vim.setup({
  sort_by = "case_sensitive",
  open_on_setup_file = false,
  open_on_tab = true,
  view = {
    adaptive_size = true,
    hide_root_folder = true
  },
  renderer = {
    group_empty = true,
    indent_markers = {
      enable = true
    },
    root_folder_modifier = ':'
  },
  filters = {
    dotfiles = false,
  },
  diagnostics = {
    enable = true
  }
})

-- mappings
local wk = require("which-key")

wk.register({
  name = 'tree_folder',
  t = {
    ":NvimTreeToggle<CR>" , "open tree file structure"
  },
  f = {
    ":NvimTreeFindFile<CR>", "show file in tree file structure"
  }

}, { prefix = '<leader>'})
