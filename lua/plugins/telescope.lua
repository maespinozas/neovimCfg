
-- plugins/telescope.lua:
return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim',
	"nvim-telescope/telescope-live-grep-args.nvim", 
	version = "^1.0.0",
      },

      config = function()

      local builtin = require('telescope.builtin')
      local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
      vim.keymap.set('n', '<leader>gw', builtin.grep_string, { desc = 'Grep word under cursor' })
      vim.keymap.set("n", "<leader>fw", live_grep_args_shortcuts.grep_word_under_cursor, { desc = 'Grep word under cursor with args'})

      vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

      local telescope = require("telescope")

	    -- first setup telescope
	    telescope.setup({
		-- your config
	    })

      -- load live grep extension
      telescope.load_extension("live_grep_args")

      end

    }
