local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- your custom insert mode mappings
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["N"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      },
    },
  },
}

telescope.load_extension("file_browser")

local wk = require('which-key')

wk.register({
  name = 'telescope',
  [';'] = {
    ['s'] = {
      function()
        builtin.find_files({
          no_ignore = false,
          hidden = true
        })
      end,
      "telescope find files"
    },
    ['r'] = {
      function ()
        builtin.live_grep()
      end,
      "telescope search in files"
    },
    ['h'] = {
      function ()
        builtin.oldfiles()
      end,
      "telescope show files history"
    },
    [';'] = {
      function()
        builtin.resume()
      end,
      "telescope repeat last action"
    },
    ['t'] = {
      function()
        builtin.help_tags()
      end,
      "telescope help tags"
    },
    ['e'] = {
      function()
        builtin.diagnostics()
      end,
      "telescope diagnostic"
    },
    ['f'] = {
      function ()
        telescope.extensions.file_browser.file_browser({
          path = "%:p:h",
          cwd = telescope_buffer_dir(),
          respect_gitignore = false,
          hidden = true,
          grouped = true,
          previewer = false,
          initial_mode = "normal",
          layout_config = { height = 40 }
        })
      end,
      "telescope file browser"
    }
  },
  ['\\\\'] = {
    function()
      builtin.buffers()
    end,
    "telescope session recent files"
  },
})

