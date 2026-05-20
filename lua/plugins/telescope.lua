
-- plugins/telescope.lua:
return {
    'nvim-telescope/telescope.nvim', 
    ---tag = '0.1.8',
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
      -- For C files with no ignore
      vim.keymap.set("n", "<leader>fwc", function()
	  live_grep_args_shortcuts.grep_word_under_cursor({
	      postfix = " -t c --no-ignore"
	  })
      end, { desc = 'Grep word under cursor (C files, no ignore)' })

      -- Search Files INCLUDING git-ignored files
      vim.keymap.set('n', '<leader>fF', function()
	builtin.find_files({
	  find_command = {
	    "rg",
	    "--files",
	    "--hidden",
	    "--no-ignore",
	    "--no-ignore-vcs",
	  },
	})
      end, { desc = 'Find All Files (including git-ignored)' })
      
      -- Search c Files inlcuding ignored files
       vim.keymap.set('n', '<leader>fc', function()
	  builtin.live_grep({
	      additional_args = function(args)
		  -- args is a table like { '--hidden', '--no-ignore' } etc.
		  -- Create a new table with defaults + your flags
		  local new_args = {}
		  for _, arg in ipairs(args) do
		      table.insert(new_args, arg)
		  end
		  table.insert(new_args, '-t')
		  table.insert(new_args, 'c')
		  table.insert(new_args, '--no-ignore')
		  return new_args
	      end,
	      prompt_title = 'Live Grep (C files, no ignore)',
	  })
      end, { desc = 'Telescope live grep C files (no ignore)' })

      local telescope = require("telescope")

	    -- first setup telescope
	    telescope.setup({
		-- your config
	    })

      -- load live grep extension
      telescope.load_extension("live_grep_args")

      end

    }
