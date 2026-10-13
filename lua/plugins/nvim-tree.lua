-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

local function my_on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- Apply default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- Custom shortcut for F7
  vim.keymap.set("n", "<F7>", api.tree.change_root_to_node, opts("Change Root to Node"))
end

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      on_attach = my_on_attach,
      actions = {
        open_file = {
          resize_window = false, -- Prevent resizing window when opening files
          window_picker = { enable = false },
        },
      },
    }
  end,
}
