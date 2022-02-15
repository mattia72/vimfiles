--
-- lua config file for dashboard 
--

local wk = require("which-key")
wk.register({ 
  f = {  
    name = "file", -- optional group name
    --a = { function() require('telescope.builtin').grep_string({use_regex=true}) end, "Telescope Grep String Under Cursor" , noremap=true } ,
    f = { "<cmd>Telescope find_files<cr>"                              , "Telescope Find File"        , noremap=true }        ,
    r = { "<cmd>Telescope oldfiles<cr>"                                , "Telescope Open Recent File" , noremap=true }        ,
    b = { "<cmd>Telescope buffers<cr>"                                 , "Telescope Open Buffers"     , noremap=true }        ,
    g = { function() require('telescope.builtin').live_grep({use_regex=true}) end, "Telescope Live Grep" , noremap=true } ,
    h = { "<cmd>Telescope help_tags<cr>"                               , "Telescope Help"             , noremap=true }        ,
    p = { function() require('telescope.builtin').keymaps()        end , "Telescope Mappings"         , noremap=true }        ,
    -- --n = { "New File" }, -- just a label. don't create any mapping 
    -- --e = "Edit File", -- same as above    
    -- --["1"] = "which_key_ignore",  -- special label to hide it in the popup
    --b = { function() print("bar") end, "Foobar" } -- you can also pass functions!  
  },
}, { prefix = "<leader>" })


 -- "nnoremap <leader>fg :Telescope live_grep prompt_prefix=🔍 <CR>
