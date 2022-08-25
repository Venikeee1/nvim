local status, startup = pcall(require, "startup")
if (not status) then return end

local print_table = function(t)
  for i, v in pairs(t) do
    print(i)
    print(v)
  end
end

local get_file_name = function(path)
  local splitted_path = vim.split(path, '/')
  return splitted_path[#splitted_path]
end

local projects_path = '~/Documents/projects.noIndex/*';
local projects_raw_list = vim.fn.glob(projects_path)
local projects_list = vim.split(projects_raw_list, '\n')
local project_content = {}

for i, project in pairs(projects_list) do
  if project ~= nil then
    local file_name = get_file_name(project)
    table.insert(project_content, { '  ' .. file_name, ':e' .. project, ';' .. i})
  end
end

startup.setup({
  -- every line should be same width without escaped \
  header = {
    type = "text",
    oldfiles_directory = false,
    align = "center",
    fold_section = false,
    title = "Header",
    margin = 5,
    content = {
      "██╗   ██╗███████╗███╗   ██╗ ██╗ ██╗ ██╗",
      "██║   ██║██╔════╝████╗  ██║ ██║ ██║██╔╝",
      "██║   ██║█████╗  ██╔██╗ ██║ ██║ ████╔╝ ",
      "╚██╗ ██╔╝██╔══╝  ██║╚██╗██║ ██║ ██║██╗ ",
      " ╚████╔╝ ███████╗██║ ╚████║ ██║ ██║ ██╗",
      "  ╚═══╝  ╚══════╝╚═╝  ╚═══╝ ╚═╝ ╚═╝ ╚═╝",
    },
    highlight = "Statement",
    default_color = "",
    oldfiles_amount = 0,
  },
  projects = {
    type = "mapping",
    oldfiles_directory = false,
    align = "center",
    fold_section = true,
    title = "  Projects",
    margin = 5,
    content = project_content,
    highlight = "String",
    default_color = "",
    oldfiles_amount = 0,
  },
  -- name which will be displayed and command
  body = {
    type = "mapping",
    oldfiles_directory = false,
    align = "center",
    fold_section = false,
    title = "Basic Commands",
    margin = 5,
    content = {
      { " Find File", "Telescope find_files", "<leader>ff" },
      { " Find Word", "Telescope live_grep", "<leader>lg" },
      { " Recent Files", "Telescope oldfiles", "<leader>of" },
      { " File Browser", "Telescope file_browser", "<leader>fb" },
      { " Configuration", "e ~/.config/nvim", "<leader>c" },
      { " New File", "lua require'startup'.new_file()", "<leader>nf" },
    },
    highlight = "String",
    default_color = "",
    oldfiles_amount = 0,
  },
  footer = {
    type = "text",
    oldfiles_directory = false,
    align = "center",
    fold_section = false,
    title = "Footer",
    margin = 5,
    content = { "Welcome to hell" },
    highlight = "Number",
    default_color = "",
    oldfiles_amount = 0,
  },

  options = {
    mapping_keys = true,
    cursor_column = 0.5,
    empty_lines_between_mappings = true,
    disable_statuslines = true,
    paddings = { 1, 3, 3, 0 },
  },
  mappings = {
    execute_command = "<CR>",
    open_file = "o",
    open_file_split = "<c-o>",
    open_section = "<TAB>",
    open_help = "?",
  },
  colors = {
    background = "#1f2227",
    -- folded_section = "#56b6c2",
  },
  parts = { "header", "projects","body", "footer" },
})
