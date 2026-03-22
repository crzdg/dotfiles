vim.lsp.config("clangd", {
    cmd = {
        "clangd-12",
        "--background-index",
        "--query-driver=~/.platformio/packages/toolchain-*/bin/*,/usr/bin/g++,/usr/bin/clang++",
    },
})
vim.lsp.enable("clangd")
