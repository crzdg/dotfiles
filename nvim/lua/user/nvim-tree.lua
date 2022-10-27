-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
  view = {
    width = 28,
    mappings = {
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        { key = "<C-h>", cb = tree_cb "close_node" },
        { key = "<C-s>", cb = tree_cb "vsplit" },
        { key = "<C-v>", cb = tree_cb "hsplit" },
      },
    },
    number = true,
    relativenumber = true,
  },
  actions = {
    open_file = {
        window_picker = {
          enable = false
      }
    },
  },
}

--[[ nvim_tree.setup { ]]
--[[   auto_reload_on_write = true, ]]
--[[   create_in_closed_folder = false, ]]
--[[   disable_netrw = true, ]]
--[[   hijack_cursor = false, ]]
--[[   hijack_netrw = true, ]]
--[[   open_on_setup = false, ]]
--[[   ignore_ft_on_setup = { ]]
--[[     "startify", ]]
--[[     "dashboard", ]]
--[[     "alpha", ]]
--[[   }, ]]
--[[   open_on_tab = false, ]]
--[[   update_cwd = true, ]]
--[[   hijack_directories = { ]]
--[[     enable = true, ]]
--[[     auto_open = true, ]]
--[[   }, ]]
--[[   diagnostics = { ]]
--[[     enable = false, ]]
--[[     icons = { ]]
--[[       hint = "", ]]
--[[       info = "", ]]
--[[       warning = "", ]]
--[[       error = "", ]]
--[[     }, ]]
--[[   }, ]]
--[[   update_focused_file = { ]]
--[[     enable = true, ]]
--[[     update_cwd = true, ]]
--[[     ignore_list = {}, ]]
--[[   }, ]]
--[[   system_open = { ]]
--[[     cmd = nil, ]]
--[[     args = {}, ]]
--[[   }, ]]
--[[   filters = { ]]
--[[     dotfiles = false, ]]
--[[     custom = {}, ]]
--[[   }, ]]
--[[   git = { ]]
--[[     enable = true, ]]
--[[     ignore = true, ]]
--[[     timeout = 500, ]]
--[[   }, ]]
--[[   view = { ]]
--[[     width = 28, ]]
--[[     hide_root_folder = false, ]]
--[[     side = "left", ]]
--[[     adaptive_size = false, ]]
--[[     mappings = { ]]
--[[       custom_only = false, ]]
--[[       list = { ]]
--[[         { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" }, ]]
--[[         { key = "h", cb = tree_cb "close_node" }, ]]
--[[         { key = "s", cb = tree_cb "vsplit" }, ]]
--[[         { key = "v", cb = tree_cb "hsplit" }, ]]
--[[       }, ]]
--[[     }, ]]
--[[     number = true, ]]
--[[     relativenumber = true, ]]
--[[   }, ]]
--[[   trash = { ]]
--[[     cmd = "trash", ]]
--[[     require_confirm = true, ]]
--[[   }, ]]
--[[   renderer = { ]]
--[[     icons = { ]]
--[[       glyphs = { ]]
--[[         default = "", ]]
--[[         symlink = "", ]]
--[[         git = { ]]
--[[           unstaged = "", ]]
--[[           staged = "S", ]]
--[[           unmerged = "", ]]
--[[           renamed = "➜", ]]
--[[           deleted = "", ]]
--[[           untracked = "U", ]]
--[[           ignored = "◌", ]]
--[[         }, ]]
--[[       folder = { ]]
--[[         default = "", ]]
--[[         open = "", ]]
--[[         empty = "", ]]
--[[         empty_open = "", ]]
--[[         symlink = "", ]]
--[[         }, ]]
--[[       }, ]]
--[[     }, ]]
--[[   } ]]
  -- open_file = {
  --   quit_on_open = true,
  --     git_hl = 1,
  --     disable_window_picker = 0,
  --     root_folder_modifier = ":t",
  --     show_icons = {
  --       git = 1,
  --       folders = 1,
  --       files = 1,
  --       folder_arrows = 1,
  --       tree_width = 30,
  --       }
  -- },
--[[ } ]]
