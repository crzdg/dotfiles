vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd =
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

  augroup _python
    autocmd!
    autocmd BufWritePre *.py lua vim.lsp.buf.format()
  augroup end

  augroup _lua
    autocmd!
    autocmd BufWritePre *.lua lua vim.lsp.buf.format()
  augroup end

  augroup _json
    autocmd!
    autocmd BufWritePre *.json,*.jsonc lua vim.lsp.buf.format()
  augroup end

  augroup _rust
    autocmd!
    autocmd BufWritePre *.rs lua vim.lsp.buf.format()
  augroup end

  " augroup _ipynb
  "   autocmd!
  "   autocmd BufNewFile,BufReadPre *.ipynb :setl filetype=jupyter-notebook
  " augroup end
]]

local function open_nvim_tree(data)
    -- buffer is a real file on the disk
    local real_file = vim.fn.filereadable(data.file) == 1

    -- buffer is a [No Name]
    local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

    if real_file then return end

    -- open the tree, find the file but don't focus it
    require("nvim-tree.api").tree.toggle({ focus = false, find_file = true, })
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
