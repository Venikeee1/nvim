local status, indent_line = pcall(require, 'indent_blankline')
if not status then return end

vim.opt.list = true

indent_line.setup {
 -- for example, context is off by default, use this to turn it on
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
}
