-- Custom mappings
vim.keymap.set("","<C-f>","/\\c")
vim.keymap.set("n","<S-Enter>","O<Esc>")

-- Copy word under cursor to system clipboard
vim.keymap.set("n","<F3>", "viwy :let @+= getreg('\"')<CR>")
vim.keymap.set("i","<F3>", "<Esc> viwy :let @+= getreg('\"')<CR>i")
-- Copy file name to clipboard
vim.keymap.set("n", "<F6>", ":let @+ = expand('%:p')<CR>")
vim.keymap.set("i", "<F6>", "<Esc> :let @+ = expand('%:p')<CR>i")

vim.keymap.set("","<F2>", ":NvimTreeOpen<CR>")
