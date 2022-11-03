local function asyncrun_indicator()
  if vim.g.asyncrun_status == 'failure' then
    return 'ﮙ'
  elseif vim.g.asyncrun_status == 'success' then
    return 'ﮚ'
  elseif vim.g.asyncrun_status == 'running' then
    return ''
  else  
    return ''
  end
end

local function session_name()
  local sn = require('possession.session').session_name or ''
  if sn then
    return ' '..sn
  else
    return ' no session'
  end
end

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    section_separators = "",
    component_separators = "",
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff" },
    lualine_c = {
      {
        "filename",
        path = 1, -- Relaitive path
        shorting_target = 40,
      },
      {
        ime_state,
        color = {fg = 'black', bg = '#f46868'}
      },
      {
        spell,
        color = {fg = 'black', bg = '#a7c080'}
      },
    },
    lualine_x = {
      asyncrun_indicator,
      session_name,
      "encoding",
      {
        "fileformat",
        symbols = { unix = "", dos = "", mac = "", },
      },
      "filetype",
    },
    lualine_y = { "progress" },
    lualine_z = {
      "location",
      {
        "diagnostics",
        sources = { "nvim_diagnostic" }
      },
      {
        trailing_space,
        color = "WarningMsg"
      },
      {
        mixed_indent,
        color = "WarningMsg"
      },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 
      {
        "filename",
        path = 1, -- Relaitive path
        shorting_target = 40,
      },
    },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {'quickfix', 'fugitive'},
})
