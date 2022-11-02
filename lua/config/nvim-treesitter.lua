
--  my vim-delphi syntax is better?
require('nvim-treesitter.parsers').filetype_to_parsername["delphi"]="pascal" 

require('nvim-treesitter.configs').setup {
  ensure_installed = {"vim", "lua"}, --, "c", "lua", "rust" }, -- A list of parser names, or "all"
  sync_install = false, -- Install parsers synchronously (only applied to `ensure_installed`)
  auto_install = true, -- Automatically install missing parsers when entering buffer -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  ignore_install = {}, -- List of parsers to ignore installing (for "all")
  highlight = {
    enable = true, -- `false` will disable the whole extension

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "pascal" }, --, c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    -- disable = function(lang, buf)
    --   local max_filesize = 100 * 1024 -- 100 KB
    --   local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    --   if ok and stats and stats.size > max_filesize then
    --     return true
    --   end
    --   end,
    additional_vim_regex_highlighting = false,
    rainbow = {
      enable = true,
      -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
      extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
      max_file_lines = nil, -- Do not enable for files with more than n lines, int
      -- colors = {}, -- table of hex strings
      -- termcolors = {} -- table of colour name strings
    }
  }
}
require 'nvim-treesitter.install'.compilers = { "gcc"} --,  "clang" }
