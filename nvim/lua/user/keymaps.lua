local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",

keymap("n", "Q", "@q", opts)
keymap("n", "x", '"_x', opts)
keymap("n", "X", '"_x', opts)

-- Normal --
-- Better window navigation
keymap("n", "<M-h>", ":lua require('nvim-tmux-navigation').NvimTmuxNavigateLeft()<CR>", opts)
keymap("n", "<M-j>", ":lua require('nvim-tmux-navigation').NvimTmuxNavigateDown()<CR>", opts)
keymap("n", "<M-k>", ":lua require('nvim-tmux-navigation').NvimTmuxNavigateUp()<CR>", opts)
keymap("n", "<M-l>", ":lua require('nvim-tmux-navigation').NvimTmuxNavigateRight()<CR>", opts)
keymap("n", "<M-m>", ":lua require('nvim-tmux-navigation').NvimTmuxNavigateLastActive()<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to input <ESC> 
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- LSP Saga --
keymap("n", "gr", "<cmd>Lspsaga rename<CR>", {silent = true})
keymap("n", "gd", "<cmd>Lspsaga preview_definition<CR>", {silent = true})
keymap("n", "cl", "<cmd>Lspsaga show_line_diagnostics<CR>", {silent = true})
keymap("n", "cn", "<cmd>Lspsaga diagnostic_jump_next<CR>", {silent = true})
keymap("n", "cp", "<cmd>Lspsaga diagnostic_jump_prev<CR>", {silent = true})
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", {silent = true, noremap = true})


-- Nonesense --
keymap("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>", opts)
