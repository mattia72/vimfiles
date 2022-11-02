-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "C:\\Users\\MATTIA~1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?.lua;C:\\Users\\MATTIA~1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?\\init.lua;C:\\Users\\MATTIA~1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?.lua;C:\\Users\\MATTIA~1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?\\init.lua"
local install_cpath_pattern = "C:\\Users\\MATTIA~1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\lua\\5.1\\?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  Decho = {
    commands = { "Decho" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\Decho",
    url = "https://github.com/vim-scripts/Decho"
  },
  LuaSnip = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19config.luasnip\frequire\0" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = true,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip",
    wants = { "friendly-snippets" }
  },
  QFEnter = {
    loaded = true,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\start\\QFEnter",
    url = "https://github.com/yssl/QFEnter"
  },
  ["ack.vim"] = {
    commands = { "Ack" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\ack.vim",
    url = "https://github.com/mileszs/ack.vim"
  },
  ["alpha-nvim"] = {
    config = { "require('alpha-nvim')" },
    loaded = true,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\start\\alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["asyncrun.vim"] = {
    commands = { "AsyncRun" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\asyncrun.vim",
    url = "https://github.com/skywind3000/asyncrun.vim"
  },
  ["auto-session"] = {
    config = { "\27LJ\2\n¹\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\31auto_session_suppress_dirs\1\2\0\0\6/\1\0\4\25auto_restore_enabled\2\22auto_save_enabled\1\25auto_session_enabled\2\14log_level\nerror\nsetup\17auto-session\frequire\0" },
    loaded = true,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\start\\auto-session",
    url = "https://github.com/rmagatti/auto-session"
  },
  ["cmp-buffer"] = {
    after_files = { "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\cmp-buffer\\after\\plugin\\cmp_buffer.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-calc"] = {
    after_files = { "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\cmp-calc\\after\\plugin\\cmp_calc.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\cmp-calc",
    url = "https://github.com/hrsh7th/cmp-calc"
  },
  ["cmp-cmdline"] = {
    after_files = { "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\cmp-cmdline\\after\\plugin\\cmp_cmdline.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-emoji"] = {
    after_files = { "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\cmp-emoji\\after\\plugin\\cmp_emoji.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\cmp-emoji",
    url = "https://github.com/hrsh7th/cmp-emoji"
  },
  ["cmp-nvim-lua"] = {
    after_files = { "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\cmp-nvim-lua\\after\\plugin\\cmp_nvim_lua.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    after_files = { "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\cmp-path\\after\\plugin\\cmp_path.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-spell"] = {
    after_files = { "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\cmp-spell\\after\\plugin\\cmp-spell.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\cmp-spell",
    url = "https://github.com/f3fora/cmp-spell"
  },
  ["cmp-treesitter"] = {
    after_files = { "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\cmp-treesitter\\after\\plugin\\cmp_treesitter.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\cmp-treesitter",
    url = "https://github.com/ray-x/cmp-treesitter"
  },
  cmp_luasnip = {
    after_files = { "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\cmp_luasnip\\after\\plugin\\cmp_luasnip.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["coq.artifacts"] = {
    load_after = {
      coq_nvim = true
    },
    loaded = false,
    needs_bufread = false,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\coq.artifacts",
    url = "https://github.com/ms-jpq/coq.artifacts"
  },
  ["coq.thirdparty"] = {
    load_after = {
      coq_nvim = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\coq.thirdparty",
    url = "https://github.com/ms-jpq/coq.thirdparty"
  },
  coq_nvim = {
    after = { "coq.thirdparty", "coq.artifacts" },
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15config.coq\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\coq_nvim",
    url = "https://github.com/ms-jpq/coq_nvim"
  },
  ["friendly-snippets"] = {
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  genutils = {
    loaded = false,
    needs_bufread = false,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\genutils",
    url = "https://github.com/vim-scripts/genutils"
  },
  ["impatient.nvim"] = {
    config = { "require('impatient')" },
    loaded = true,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\start\\impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["lspkind-nvim"] = {
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { "require('config.lualine-nvim')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["marks.nvim"] = {
    config = { "require('config.marks-nvim')" },
    loaded = true,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\start\\marks.nvim",
    url = "https://github.com/chentoast/marks.nvim"
  },
  nerdcommenter = {
    loaded = true,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\start\\nerdcommenter",
    url = "https://github.com/preservim/nerdcommenter"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\start\\nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp-buffer", "cmp-calc", "cmp-nvim-lua", "cmp-path", "cmp-emoji", "lspkind-nvim", "LuaSnip", "cmp-cmdline", "cmp_luasnip", "nvim-lspconfig", "cmp-treesitter", "cmp-spell", "friendly-snippets" },
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20config.nvim-cmp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp",
    wants = { "LuaSnip" }
  },
  ["nvim-lspconfig"] = {
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\start\\nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    config = { "require('config.nvim-tree')" },
    loaded = true,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\start\\nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "require('config.nvim-treesitter')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\start\\nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["perl-support.vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\perl-support.vim",
    url = "https://github.com/vim-scripts/perl-support.vim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\start\\plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["session-lens"] = {
    config = { "\27LJ\2\nb\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\17path_display\1\0\0\1\2\0\0\fshorten\nsetup\17session-lens\frequire\0" },
    loaded = true,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\start\\session-lens",
    url = "https://github.com/rmagatti/session-lens"
  },
  tabular = {
    after_files = { "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\tabular\\after\\plugin\\TabularMaps.vim" },
    commands = { "Tabularize" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\tabular",
    url = "https://github.com/godlygeek/tabular"
  },
  ["telescope.nvim"] = {
    config = { "require('telescope-nvim')" },
    loaded = true,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\start\\telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-abolish"] = {
    commands = { "S" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\vim-abolish",
    url = "https://github.com/tpope/vim-abolish"
  },
  ["vim-breakpts"] = {
    commands = { "BreakPts" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\vim-breakpts",
    url = "https://github.com/albfan/vim-breakpts"
  },
  ["vim-bufkill"] = {
    commands = { "BD", "BB", "BF", "BW " },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\vim-bufkill",
    url = "https://github.com/qpkorr/vim-bufkill"
  },
  ["vim-coffee-script"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\vim-coffee-script",
    url = "https://github.com/kchmck/vim-coffee-script"
  },
  ["vim-copy-as-rtf"] = {
    loaded = true,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\start\\vim-copy-as-rtf",
    url = "C:\\home\\mata\\dev\\vim\\vim-copy-as-rtf"
  },
  ["vim-delphi"] = {
    loaded = true,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\start\\vim-delphi",
    url = "C:\\home\\mata\\dev\\vim\\vim-delphi"
  },
  ["vim-easymotion"] = {
    loaded = true,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\start\\vim-easymotion",
    url = "https://github.com/Lokaltog/vim-easymotion"
  },
  ["vim-exchange"] = {
    loaded = true,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\start\\vim-exchange",
    url = "https://github.com/tommcdo/vim-exchange"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\start\\vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\start\\vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-mundo"] = {
    commands = { "MundoToggle", "MundoShow" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\vim-mundo",
    url = "https://github.com/simnalamburt/vim-mundo"
  },
  ["vim-ps1"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\vim-ps1",
    url = "https://github.com/PProvost/vim-ps1"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\start\\vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-ripgrep"] = {
    loaded = true,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\start\\vim-ripgrep",
    url = "C:\\home\\mata\\dev\\vim\\vim-ripgrep"
  },
  ["vim-sneak"] = {
    loaded = true,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\start\\vim-sneak",
    url = "https://github.com/justinmk/vim-sneak"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\start\\vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-unittest"] = {
    commands = { "UnitTest" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\vim-unittest",
    url = "https://github.com/h1mesuke/vim-unittest"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21config.which-key\frequire-\1\0\4\0\3\0\0066\0\0\0009\0\1\0003\2\2\0)\3Ð\aB\0\3\1K\0\1\0\0\rdefer_fn\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["xml.vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "C:\\home\\mata\\.data\\nvim-data\\site\\pack\\packer\\opt\\xml.vim",
    url = "https://github.com/vim-scripts/xml.vim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^coq_3p"] = "coq.thirdparty"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: auto-session
time([[Config for auto-session]], true)
try_loadstring("\27LJ\2\n¹\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\31auto_session_suppress_dirs\1\2\0\0\6/\1\0\4\25auto_restore_enabled\2\22auto_save_enabled\1\25auto_session_enabled\2\14log_level\nerror\nsetup\17auto-session\frequire\0", "config", "auto-session")
time([[Config for auto-session]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
require('config.nvim-tree')
time([[Config for nvim-tree.lua]], false)
-- Config for: impatient.nvim
time([[Config for impatient.nvim]], true)
require('impatient')
time([[Config for impatient.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require('telescope-nvim')
time([[Config for telescope.nvim]], false)
-- Config for: marks.nvim
time([[Config for marks.nvim]], true)
require('config.marks-nvim')
time([[Config for marks.nvim]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
require('alpha-nvim')
time([[Config for alpha-nvim]], false)
-- Config for: session-lens
time([[Config for session-lens]], true)
try_loadstring("\27LJ\2\nb\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\17path_display\1\0\0\1\2\0\0\fshorten\nsetup\17session-lens\frequire\0", "config", "session-lens")
time([[Config for session-lens]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file S lua require("packer.load")({'vim-abolish'}, { cmd = "S", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AsyncRun lua require("packer.load")({'asyncrun.vim'}, { cmd = "AsyncRun", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Decho lua require("packer.load")({'Decho'}, { cmd = "Decho", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MundoToggle lua require("packer.load")({'vim-mundo'}, { cmd = "MundoToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Ack lua require("packer.load")({'ack.vim'}, { cmd = "Ack", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file BD lua require("packer.load")({'vim-bufkill'}, { cmd = "BD", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file BB lua require("packer.load")({'vim-bufkill'}, { cmd = "BB", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file BF lua require("packer.load")({'vim-bufkill'}, { cmd = "BF", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[au CmdUndefined BW  ++once lua require"packer.load"({'vim-bufkill'}, {}, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Tabularize lua require("packer.load")({'tabular'}, { cmd = "Tabularize", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file BreakPts lua require("packer.load")({'vim-breakpts'}, { cmd = "BreakPts", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MundoShow lua require("packer.load")({'vim-mundo'}, { cmd = "MundoShow", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UnitTest lua require("packer.load")({'vim-unittest'}, { cmd = "UnitTest", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType psm1 ++once lua require("packer.load")({'vim-ps1'}, { ft = "psm1" }, _G.packer_plugins)]]
vim.cmd [[au FileType ps1 ++once lua require("packer.load")({'vim-ps1'}, { ft = "ps1" }, _G.packer_plugins)]]
vim.cmd [[au FileType coffe ++once lua require("packer.load")({'vim-coffee-script'}, { ft = "coffe" }, _G.packer_plugins)]]
vim.cmd [[au FileType perl ++once lua require("packer.load")({'perl-support.vim'}, { ft = "perl" }, _G.packer_plugins)]]
vim.cmd [[au FileType xml ++once lua require("packer.load")({'xml.vim'}, { ft = "xml" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'coq_nvim', 'nvim-cmp'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufEnter * ++once lua require("packer.load")({'nvim-treesitter'}, { event = "BufEnter *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'nvim-web-devicons', 'lualine.nvim', 'which-key.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: C:\home\mata\.data\nvim-data\site\pack\packer\opt\vim-coffee-script\ftdetect\coffee.vim]], true)
vim.cmd [[source C:\home\mata\.data\nvim-data\site\pack\packer\opt\vim-coffee-script\ftdetect\coffee.vim]]
time([[Sourcing ftdetect script at: C:\home\mata\.data\nvim-data\site\pack\packer\opt\vim-coffee-script\ftdetect\coffee.vim]], false)
time([[Sourcing ftdetect script at: C:\home\mata\.data\nvim-data\site\pack\packer\opt\vim-coffee-script\ftdetect\vim-literate-coffeescript.vim]], true)
vim.cmd [[source C:\home\mata\.data\nvim-data\site\pack\packer\opt\vim-coffee-script\ftdetect\vim-literate-coffeescript.vim]]
time([[Sourcing ftdetect script at: C:\home\mata\.data\nvim-data\site\pack\packer\opt\vim-coffee-script\ftdetect\vim-literate-coffeescript.vim]], false)
time([[Sourcing ftdetect script at: C:\home\mata\.data\nvim-data\site\pack\packer\opt\vim-ps1\ftdetect\ps1.vim]], true)
vim.cmd [[source C:\home\mata\.data\nvim-data\site\pack\packer\opt\vim-ps1\ftdetect\ps1.vim]]
time([[Sourcing ftdetect script at: C:\home\mata\.data\nvim-data\site\pack\packer\opt\vim-ps1\ftdetect\ps1.vim]], false)
time([[Sourcing ftdetect script at: C:\home\mata\.data\nvim-data\site\pack\packer\opt\vim-ps1\ftdetect\ps1xml.vim]], true)
vim.cmd [[source C:\home\mata\.data\nvim-data\site\pack\packer\opt\vim-ps1\ftdetect\ps1xml.vim]]
time([[Sourcing ftdetect script at: C:\home\mata\.data\nvim-data\site\pack\packer\opt\vim-ps1\ftdetect\ps1xml.vim]], false)
time([[Sourcing ftdetect script at: C:\home\mata\.data\nvim-data\site\pack\packer\opt\vim-ps1\ftdetect\xml.vim]], true)
vim.cmd [[source C:\home\mata\.data\nvim-data\site\pack\packer\opt\vim-ps1\ftdetect\xml.vim]]
time([[Sourcing ftdetect script at: C:\home\mata\.data\nvim-data\site\pack\packer\opt\vim-ps1\ftdetect\xml.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
