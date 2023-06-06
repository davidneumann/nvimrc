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
local package_path_str = "/home/bytientdavid/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/bytientdavid/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/bytientdavid/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/bytientdavid/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/bytientdavid/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
  LuaSnip = {
    loaded = true,
    path = "/home/bytientdavid/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/bytientdavid/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["copilot.vim"] = {
    loaded = true,
    path = "/home/bytientdavid/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  ["git-blame.nvim"] = {
    loaded = true,
    path = "/home/bytientdavid/.local/share/nvim/site/pack/packer/start/git-blame.nvim",
    url = "https://github.com/f-person/git-blame.nvim"
  },
  harpoon = {
    loaded = true,
    path = "/home/bytientdavid/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/theprimeagen/harpoon"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/home/bytientdavid/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/bytientdavid/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/bytientdavid/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["neo-tree.nvim"] = {
    config = { "\27LJ\2\n�\23\0\0\a\0I\0o6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0005\3\6\0B\0\3\0016\0\0\0009\0\3\0009\0\4\0'\2\a\0005\3\b\0B\0\3\0016\0\0\0009\0\3\0009\0\4\0'\2\t\0005\3\n\0B\0\3\0016\0\0\0009\0\3\0009\0\4\0'\2\v\0005\3\f\0B\0\3\0016\0\r\0'\2\14\0B\0\2\0029\0\15\0005\2\16\0005\3\17\0=\3\18\0025\3\20\0005\4\19\0=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\0035\4\26\0=\4\27\0035\4\28\0=\4\29\0035\4\31\0005\5\30\0=\5 \4=\4!\3=\3\"\0024\3\0\0=\3#\0025\3$\0005\4%\0=\4&\0035\4(\0005\5'\0=\5)\0045\5*\0005\6+\0=\6,\5=\5-\0045\5.\0005\6/\0=\6,\5=\0050\4=\0041\3=\0032\0024\3\0\0=\0033\0025\3:\0005\0044\0004\5\0\0=\0055\0044\5\0\0=\0056\0044\5\0\0=\0057\0044\5\0\0=\0058\0044\5\0\0=\0059\4=\4;\0035\4=\0005\5<\0=\0051\0045\5>\0=\5?\4=\0042\0034\4\0\0=\4#\3=\3@\0025\3A\0005\4C\0005\5B\0=\0051\4=\0042\3=\3D\0025\3G\0005\4E\0005\5F\0=\0051\4=\0042\3=\3!\2B\0\2\0016\0\0\0009\0\1\0'\2H\0B\0\2\1K\0\1\0#nnoremap \\ :Neotree reveal<cr>\1\0\0\1\0\a\agc\15git_commit\agr\20git_revert_file\aga\17git_add_file\agp\rgit_push\agu\21git_unstage_file\agg\24git_commit_and_push\6A\16git_add_all\1\0\1\rposition\nfloat\fbuffers\1\0\0\1\0\3\t<bs>\16navigate_up\6.\rset_root\abd\18buffer_delete\1\0\3\24follow_current_file\2\21group_empty_dirs\2\18show_unloaded\2\15filesystem\26fuzzy_finder_mappings\1\0\4\t<up>\19move_cursor_up\n<C-p>\19move_cursor_up\v<down>\21move_cursor_down\n<C-n>\21move_cursor_down\1\0\0\1\0\n\n<c-x>\17clear_filter\6/\17fuzzy_finder\6#\17fuzzy_sorter\6H\18toggle_hidden\a]g\22next_git_modified\a[g\22prev_git_modified\6D\27fuzzy_finder_directory\6f\21filter_on_submit\t<bs>\16navigate_up\6.\rset_root\19filtered_items\1\0\4\24follow_current_file\2\21group_empty_dirs\1\27use_libuv_file_watcher\1\26hijack_netrw_behavior\17open_default\26never_show_by_pattern\15never_show\16always_show\20hide_by_pattern\17hide_by_name\1\0\4\fvisible\2\18hide_dotfiles\2\20hide_gitignored\2\16hide_hidden\2\18nesting_rules\vwindow\rmappings\6a\1\0\1\14show_path\tnone\1\2\0\0\badd\6P\vconfig\1\0\1\14use_float\2\1\2\0\0\19toggle_preview\f<space>\1\0\24\6l\18focus_preview\6t\16open_tabnew\6S\15open_split\6Z\21expand_all_nodes\6x\21cut_to_clipboard\6w\28open_with_window_picker\6r\vrename\6q\17close_window\6c\tcopy\6d\vdelete\6R\frefresh\6p\25paste_from_clipboard\6?\14show_help\6s\16open_vsplit\18<2-LeftMouse>\topen\6C\15close_node\6<\16prev_source\6>\16next_source\6m\tmove\6y\22copy_to_clipboard\6A\18add_directory\t<cr>\topen\n<esc>\19revert_preview\6z\20close_all_nodes\1\2\1\0\16toggle_node\vnowait\1\20mapping_options\1\0\2\fnoremap\2\vnowait\2\1\0\2\nwidth\3(\rposition\tleft\rcommands\30default_component_configs\15git_status\fsymbols\1\0\0\1\0\t\rconflict\b\nadded\5\runstaged\b\14untracked\b\rmodified\5\vstaged\b\fdeleted\b✖\frenamed\b\fignored\b\tname\1\0\3\26use_git_status_colors\2\19trailing_slash\1\14highlight\20NeoTreeFileName\rmodified\1\0\2\14highlight\20NeoTreeModified\vsymbol\b[+]\ticon\1\0\5\16folder_open\b\fdefault\6*\17folder_empty\bﰊ\18folder_closed\b\14highlight\20NeoTreeFileIcon\vindent\1\0\t\17with_markers\2\22expander_expanded\b\fpadding\3\1\23expander_highlight\20NeoTreeExpander\16indent_size\3\2\23expander_collapsed\b\18indent_marker\b│\23last_indent_marker\b└\14highlight\24NeoTreeIndentMarker\14container\1\0\0\1\0\1\26enable_character_fade\2$open_files_do_not_replace_types\1\4\0\0\rterminal\ftrouble\aqf\1\0\5\23popup_border_style\frounded\23enable_diagnostics\2\26sort_case_insensitive\1\22enable_git_status\2\25close_if_last_window\1\nsetup\rneo-tree\frequire\1\0\2\vtexthl\23DiagnosticSignHint\ttext\b\23DiagnosticSignHint\1\0\2\vtexthl\23DiagnosticSignInfo\ttext\t \23DiagnosticSignInfo\1\0\2\vtexthl\23DiagnosticSignWarn\ttext\t \23DiagnosticSignWarn\1\0\2\vtexthl\24DiagnosticSignError\ttext\t \24DiagnosticSignError\16sign_define\afn0 let g:neo_tree_remove_legacy_commands = 1 \bcmd\bvim\0" },
    loaded = true,
    path = "/home/bytientdavid/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  ["neodev.nvim"] = {
    loaded = true,
    path = "/home/bytientdavid/.local/share/nvim/site/pack/packer/start/neodev.nvim",
    url = "https://github.com/folke/neodev.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/bytientdavid/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/bytientdavid/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/bytientdavid/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    after = { "nvim-dap-ui", "telescope-dap.nvim", "one-small-step-for-vimkind", "nvim-dap-virtual-text" },
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15config.dap\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/bytientdavid/.local/share/nvim/site/pack/packer/opt/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap",
    wants = { "nvim-dap-virtual-text", "nvim-dap-ui", "which-key.nvim" }
  },
  ["nvim-dap-ui"] = {
    load_after = {
      ["nvim-dap"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/bytientdavid/.local/share/nvim/site/pack/packer/opt/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    load_after = {
      ["nvim-dap"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/bytientdavid/.local/share/nvim/site/pack/packer/opt/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/bytientdavid/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/bytientdavid/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/home/bytientdavid/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/bytientdavid/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/bytientdavid/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["nvim-window-picker"] = {
    config = { "\27LJ\2\n�\1\0\0\6\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\t\0005\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\4=\4\n\3=\3\v\2B\0\2\1K\0\1\0\17filter_rules\abo\1\0\0\fbuftype\1\3\0\0\rterminal\rquickfix\rfiletype\1\0\0\1\4\0\0\rneo-tree\19neo-tree-popup\vnotify\1\0\3\19autoselect_one\2\20include_current\1\23other_win_hl_color\f#e35e4f\nsetup\18window-picker\frequire\0" },
    loaded = true,
    path = "/home/bytientdavid/.local/share/nvim/site/pack/packer/start/nvim-window-picker",
    url = "https://github.com/s1n7ax/nvim-window-picker"
  },
  ["one-small-step-for-vimkind"] = {
    load_after = {
      ["nvim-dap"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/bytientdavid/.local/share/nvim/site/pack/packer/opt/one-small-step-for-vimkind",
    url = "https://github.com/jbyuki/one-small-step-for-vimkind"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/bytientdavid/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/bytientdavid/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["prettier.nvim"] = {
    loaded = true,
    path = "/home/bytientdavid/.local/share/nvim/site/pack/packer/start/prettier.nvim",
    url = "https://github.com/MunifTanjim/prettier.nvim"
  },
  ["telescope-dap.nvim"] = {
    load_after = {
      ["nvim-dap"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/bytientdavid/.local/share/nvim/site/pack/packer/opt/telescope-dap.nvim",
    url = "https://github.com/nvim-telescope/telescope-dap.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/bytientdavid/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  tokyonight = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0!colorscheme tokyonight-night\bcmd\bvim\0" },
    loaded = true,
    path = "/home/bytientdavid/.local/share/nvim/site/pack/packer/start/tokyonight",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/bytientdavid/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/bytientdavid/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/bytientdavid/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-easymotion"] = {
    loaded = true,
    path = "/home/bytientdavid/.local/share/nvim/site/pack/packer/start/vim-easymotion",
    url = "https://github.com/easymotion/vim-easymotion"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/bytientdavid/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/bytientdavid/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/home/bytientdavid/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/home/bytientdavid/.local/share/nvim/site/pack/packer/start/vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\nt\0\0\3\0\a\0\0156\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0)\1,\1=\1\3\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\15timeoutlen\ftimeout\6o\bvim\0" },
    loaded = true,
    path = "/home/bytientdavid/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^dap"] = "nvim-dap",
  ["^osv"] = "one-small-step-for-vimkind"
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

-- Config for: tokyonight
time([[Config for tokyonight]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0!colorscheme tokyonight-night\bcmd\bvim\0", "config", "tokyonight")
time([[Config for tokyonight]], false)
-- Config for: neo-tree.nvim
time([[Config for neo-tree.nvim]], true)
try_loadstring("\27LJ\2\n�\23\0\0\a\0I\0o6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0005\3\6\0B\0\3\0016\0\0\0009\0\3\0009\0\4\0'\2\a\0005\3\b\0B\0\3\0016\0\0\0009\0\3\0009\0\4\0'\2\t\0005\3\n\0B\0\3\0016\0\0\0009\0\3\0009\0\4\0'\2\v\0005\3\f\0B\0\3\0016\0\r\0'\2\14\0B\0\2\0029\0\15\0005\2\16\0005\3\17\0=\3\18\0025\3\20\0005\4\19\0=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\0035\4\26\0=\4\27\0035\4\28\0=\4\29\0035\4\31\0005\5\30\0=\5 \4=\4!\3=\3\"\0024\3\0\0=\3#\0025\3$\0005\4%\0=\4&\0035\4(\0005\5'\0=\5)\0045\5*\0005\6+\0=\6,\5=\5-\0045\5.\0005\6/\0=\6,\5=\0050\4=\0041\3=\0032\0024\3\0\0=\0033\0025\3:\0005\0044\0004\5\0\0=\0055\0044\5\0\0=\0056\0044\5\0\0=\0057\0044\5\0\0=\0058\0044\5\0\0=\0059\4=\4;\0035\4=\0005\5<\0=\0051\0045\5>\0=\5?\4=\0042\0034\4\0\0=\4#\3=\3@\0025\3A\0005\4C\0005\5B\0=\0051\4=\0042\3=\3D\0025\3G\0005\4E\0005\5F\0=\0051\4=\0042\3=\3!\2B\0\2\0016\0\0\0009\0\1\0'\2H\0B\0\2\1K\0\1\0#nnoremap \\ :Neotree reveal<cr>\1\0\0\1\0\a\agc\15git_commit\agr\20git_revert_file\aga\17git_add_file\agp\rgit_push\agu\21git_unstage_file\agg\24git_commit_and_push\6A\16git_add_all\1\0\1\rposition\nfloat\fbuffers\1\0\0\1\0\3\t<bs>\16navigate_up\6.\rset_root\abd\18buffer_delete\1\0\3\24follow_current_file\2\21group_empty_dirs\2\18show_unloaded\2\15filesystem\26fuzzy_finder_mappings\1\0\4\t<up>\19move_cursor_up\n<C-p>\19move_cursor_up\v<down>\21move_cursor_down\n<C-n>\21move_cursor_down\1\0\0\1\0\n\n<c-x>\17clear_filter\6/\17fuzzy_finder\6#\17fuzzy_sorter\6H\18toggle_hidden\a]g\22next_git_modified\a[g\22prev_git_modified\6D\27fuzzy_finder_directory\6f\21filter_on_submit\t<bs>\16navigate_up\6.\rset_root\19filtered_items\1\0\4\24follow_current_file\2\21group_empty_dirs\1\27use_libuv_file_watcher\1\26hijack_netrw_behavior\17open_default\26never_show_by_pattern\15never_show\16always_show\20hide_by_pattern\17hide_by_name\1\0\4\fvisible\2\18hide_dotfiles\2\20hide_gitignored\2\16hide_hidden\2\18nesting_rules\vwindow\rmappings\6a\1\0\1\14show_path\tnone\1\2\0\0\badd\6P\vconfig\1\0\1\14use_float\2\1\2\0\0\19toggle_preview\f<space>\1\0\24\6l\18focus_preview\6t\16open_tabnew\6S\15open_split\6Z\21expand_all_nodes\6x\21cut_to_clipboard\6w\28open_with_window_picker\6r\vrename\6q\17close_window\6c\tcopy\6d\vdelete\6R\frefresh\6p\25paste_from_clipboard\6?\14show_help\6s\16open_vsplit\18<2-LeftMouse>\topen\6C\15close_node\6<\16prev_source\6>\16next_source\6m\tmove\6y\22copy_to_clipboard\6A\18add_directory\t<cr>\topen\n<esc>\19revert_preview\6z\20close_all_nodes\1\2\1\0\16toggle_node\vnowait\1\20mapping_options\1\0\2\fnoremap\2\vnowait\2\1\0\2\nwidth\3(\rposition\tleft\rcommands\30default_component_configs\15git_status\fsymbols\1\0\0\1\0\t\rconflict\b\nadded\5\runstaged\b\14untracked\b\rmodified\5\vstaged\b\fdeleted\b✖\frenamed\b\fignored\b\tname\1\0\3\26use_git_status_colors\2\19trailing_slash\1\14highlight\20NeoTreeFileName\rmodified\1\0\2\14highlight\20NeoTreeModified\vsymbol\b[+]\ticon\1\0\5\16folder_open\b\fdefault\6*\17folder_empty\bﰊ\18folder_closed\b\14highlight\20NeoTreeFileIcon\vindent\1\0\t\17with_markers\2\22expander_expanded\b\fpadding\3\1\23expander_highlight\20NeoTreeExpander\16indent_size\3\2\23expander_collapsed\b\18indent_marker\b│\23last_indent_marker\b└\14highlight\24NeoTreeIndentMarker\14container\1\0\0\1\0\1\26enable_character_fade\2$open_files_do_not_replace_types\1\4\0\0\rterminal\ftrouble\aqf\1\0\5\23popup_border_style\frounded\23enable_diagnostics\2\26sort_case_insensitive\1\22enable_git_status\2\25close_if_last_window\1\nsetup\rneo-tree\frequire\1\0\2\vtexthl\23DiagnosticSignHint\ttext\b\23DiagnosticSignHint\1\0\2\vtexthl\23DiagnosticSignInfo\ttext\t \23DiagnosticSignInfo\1\0\2\vtexthl\23DiagnosticSignWarn\ttext\t \23DiagnosticSignWarn\1\0\2\vtexthl\24DiagnosticSignError\ttext\t \24DiagnosticSignError\16sign_define\afn0 let g:neo_tree_remove_legacy_commands = 1 \bcmd\bvim\0", "config", "neo-tree.nvim")
time([[Config for neo-tree.nvim]], false)
-- Config for: nvim-window-picker
time([[Config for nvim-window-picker]], true)
try_loadstring("\27LJ\2\n�\1\0\0\6\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\t\0005\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\4=\4\n\3=\3\v\2B\0\2\1K\0\1\0\17filter_rules\abo\1\0\0\fbuftype\1\3\0\0\rterminal\rquickfix\rfiletype\1\0\0\1\4\0\0\rneo-tree\19neo-tree-popup\vnotify\1\0\3\19autoselect_one\2\20include_current\1\23other_win_hl_color\f#e35e4f\nsetup\18window-picker\frequire\0", "config", "nvim-window-picker")
time([[Config for nvim-window-picker]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\nt\0\0\3\0\a\0\0156\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0)\1,\1=\1\3\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\15timeoutlen\ftimeout\6o\bvim\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'nvim-dap'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
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
