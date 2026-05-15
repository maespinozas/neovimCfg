return
{
    "anoopkcn/filemarks.nvim",
    config = function()
        require('filemarks').setup({
            goto_prefix = "<leader>m",  -- This is the prefix for jumping to marks
            action_prefix = "<leader>M", -- This is for adding marks
	  dir_open_cmd = function(path)
	    require("nvim-tree.api").tree.open({ path = path })
	  end,
        })
    end,
}
