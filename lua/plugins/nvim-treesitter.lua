
local M = {
  "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local ts = require("nvim-treesitter")

        -- Install parsers (replaces ensure_installed from old API)
        ts.install({
            "lua",
            "python",
            "c",
            "cpp",
            "markdown",
            "html",
            "javascript",
            "json",
            "bash",
            "vim",
            "vimdoc",
        })

        -- Optional: Disable highlighting for specific filetypes if needed
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "large_file", "some_language" },
            callback = function(args)
                vim.treesitter.stop(args.buf)
            end,
        })

        -- Configure folding (same as before)
        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.opt.foldlevel = 99
    end,
}

return { M }

