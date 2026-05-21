local M = {}
-- Function to show buffers in quickfix window

function M.buffers_to_quickfix()
    local buffers = vim.fn.getbufinfo()
    local qf_list = {}
    
    for _, buf in ipairs(buffers) do
        if buf.loaded and buf.name ~= '' then
            table.insert(qf_list, {
                filename = buf.name,
                lnum = 1,
                text = string.format("%d: %s", buf.bufnr, vim.fn.fnamemodify(buf.name, ":t")),
                bufnr = buf.bufnr
            })
        end
    end
    
    vim.fn.setqflist(qf_list, 'r')
    vim.cmd('copen')
end

vim.api.nvim_create_user_command('BufQF', M.buffers_to_quickfix, {})

return M
