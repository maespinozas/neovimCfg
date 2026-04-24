
local M = {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master', -- This is the critical line to keep the old version
    lazy = false,      -- This plugin does not support lazy-loading [citation:5]
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    config = function ()
	    require("nvim-treesitter.configs").setup({
		--List of langauges to install by default
		ensure_installed ={
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
		},
	    sync_install = true,

	    --Enable syntax highligthing
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            -- Enable folding
            folds = {
                enable = true,
            },
            -- Optional: Enable incremental selection
            incremental_selection = {
                enable = true,
                keymaps = {
                    node_incremental = "v",
                    node_decremental = "V",
                },
            },

	    })
	    -- Folding
	    vim.opt.foldmethod = "expr"
	    vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

	    -- Optional : start with all folds open
	    vim.opt.foldlevel = 99


    end
}

return { M }

