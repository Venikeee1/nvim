local status, prettier = pcall(require, "prettier")
if (not status) then return end

prettier.setup {
  bin = 'prettier',
  filetypes = {
    "css",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "json",
    "scss",
    "less"
  },
  -- ["null-ls"] = {
  --   runtime_condition = function(params)
  --     -- return false to skip running prettier
  --     return false
  --   end,
  --   timeout = 5000,
  -- }
}
