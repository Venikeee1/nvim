local status, null_ls = pcall(require, 'null-ls')
if not status then return end

local status1, eslint = pcall(require, 'eslint')
if not status1 then return end

-- local function file_exists(name)
--   local f = io.open(name, "r")
--   if f ~= nil then io.close(f) return true else return false end
-- end
--
-- local has_eslint_config_in_package_json = function()
--   local file_name = 'package.json'
--   local has_package_json = file_exists(file_name);
--
--   if(not has_package_json) then
--     return false
--   end
--
--   local p_json = io.read(file_name, 'r')
--
--   -- local settings = vim.json.decode(p_json)
--   print(p_json)
--   print(has_package_json)
-- end

-- local hasEslintConfig = file_exists('.eslintrc.json') or file_exists('.eslintrc.js') or file_exists('.eslintrc.yml') or has_eslint_config_in_package_json()
-- local sourceSetup = {};
--
-- if hasEslintConfig then
--   sourceSetup = {
--     null_ls.builtins.diagnostics.eslint_d.with({
--       diagnostics_format = '[eslint] #{m}\n(#{c})'
--     })
--   }
-- end


null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint_d.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})'
    })
  },
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.cmd("nnoremap <silent><buffer> <Leader>lf :lua vim.lsp.buf.formatting()<CR>")

      -- format on save
      -- vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting_seq_sync({}, 3000)")
      vim.api.nvim_clear_autocmds { buffer = 0, group = augroup_format }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup_format,
        buffer = 0,
        callback = function() vim.lsp.buf.formatting_seq_sync() end
      })
    end

    if client.server_capabilities.documentRangeFormattingProvider then
      vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
    end
  end,
})

eslint.setup({
  bin = 'eslint_d',
  code_actions = {
    enable = true,
    apply_on_save = {
      enable = true,
      types = { "problem" }, -- "directive", "problem", "suggestion", "layout"
    },
    disable_rule_comment = {
      enable = true,
      location = "separate_line", -- or `same_line`
    },
  },
  diagnostics = {
    enable = true,
    report_unused_disable_directives = false,
    run_on = "type", -- or `save`
    format = '[eslint] #{m}\n(#{c})'
  },
})

local wk = require('which-key');

wk.register({
  ['<leader>'] = {
    j = {
      ':lua vim.lsp.buf.formatting()<CR>',
    }
  }
})
