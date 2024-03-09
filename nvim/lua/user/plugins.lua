local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Package Archive
-- Awesome Packages
-- use "akinsho/toggleterm.nvim"
-- use "goolord/alpha-nvim"
-- Markdown viewer
-- use "ellisonleao/glow.nvim"
-- Alternative to interesting words
-- use "azabiong/vim-highlighter" -- Not working currentyl
-- Jupytext Plugin
-- use "GCBallesteros/jupytext.vim"
-- Notebook/ipython handler -> does not support venvs
-- use { "dccsillag/magma-nvim", run = ":UpdateRemotePlugins" }
-- Obsidian
--[[ use "epwalsh/obsidian.nvim" ]]
-- Colorschemes
-- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
-- use "lunarvim/darkplus.nvim"
-- use "junegunn/seoul256.vim"
-- use "morhetz/gruvbox"
-- use "jpo/vim-railscasts-theme"
-- use "sheerun/vim-wombat-scheme"
-- use "vim-scripts/wombat256.vim"
-- use "luisiacc/gruvbox-baby"
-- use "nvim-telescope/telescope.nvim"
-- use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim"    -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim"  -- Useful lua functions used ny lots of plugins
    use "lewis6991/impatient.nvim"
    use "moll/vim-bbye"
    use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
    use "kyazdani42/nvim-web-devicons"
    use "kyazdani42/nvim-tree.lua"
    use "ThePrimeagen/harpoon"

    -- Workspace handling
    use "folke/which-key.nvim"
    use "ahmedkhalf/project.nvim"
    use "alexghergh/nvim-tmux-navigation"
    use "0x00-ketsu/maximizer.nvim"

    -- Coding / Document handling
    use "kylechui/nvim-surround"
    use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
    use "numToStr/Comment.nvim" -- Easily comment stuff

    -- Testing and Diagnostics
    use "vim-test/vim-test"
    use "folke/trouble.nvim"
    use "tami5/lspsaga.nvim"

    -- Apperance
    use { "crzdg/gruvbox-baby", branch = "main" }
    use "folke/lsp-colors.nvim" -- helper to fill missing lsp colors
    use "nvim-lualine/lualine.nvim"
    use "akinsho/bufferline.nvim"
    use "lukas-reineke/indent-blankline.nvim"
    use "levouh/tint.nvim"
    --[[ use "nvim-zh/colorful-winsep.nvim" ]]
    -- cmp plugins
    use "hrsh7th/nvim-cmp"         -- The completion plugin
    use "hrsh7th/cmp-buffer"       -- buffer completions
    use "hrsh7th/cmp-path"         -- path completions
    use "hrsh7th/cmp-cmdline"      -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"     -- LSP completion
    --[[ use "hrsh7th/cmp-nvim-lsp-signature-help" ]]
    -- signature help tool for cmp
    use "ray-x/lsp_signature.nvim" -- standalone signature help, customizable

    -- snippets
    use "L3MON4D3/LuaSnip" --snippet engine

    -- LSP
    use "neovim/nvim-lspconfig"           -- enable LSP
    --[[ use "williamboman/nvim-lsp-installer" -- simple to use language server installer ]]
    use "tamago324/nlsp-settings.nvim"    -- language server settings defined in json for
    use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

    -- Treesitter
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use "yioneko/nvim-yati"
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

    -- Git
    use "lewis6991/gitsigns.nvim"

    -- Copilot
    use "zbirenbaum/copilot.lua"
    use "zbirenbaum/copilot-cmp"

    -- Fuzzy Finder
    use "junegunn/fzf" -- Fuzzy Finder
    use "ibhagwan/fzf-lua"

    -- Utils
    use "lfv89/vim-interestingwords"

    -- Markdown
    use({ 'toppair/peek.nvim', run = 'deno task --quiet build:fast' })

    -- Jupyter Notebbok
    use "hkupty/iron.nvim"
    use "kana/vim-textobj-user"
    use "kana/vim-textobj-line"
    use "GCBallesteros/vim-textobj-hydrogen"

    -- Nonesense
    use "Eandrju/cellular-automaton.nvim"

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
