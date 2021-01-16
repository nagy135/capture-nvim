local function testprint()

    local cursor_x = vim.api.nvim_win_get_cursor(0)[1]
    local cursor_y = vim.api.nvim_win_get_cursor(0)[2]
    local height = vim.fn.nvim_win_get_height(0)
    local width = vim.fn.nvim_win_get_width(0)
    -- local test = vim.cmd("echo expand('%:p')")

    -- run vim function
    local test = vim.fn.expand('%:p')

    -- press any key
    -- vim.api.nvim_input("dd")

    -- run command
    -- vim.api.nvim_command('%s/print/bar/g')

    -- print dict
    -- vim.inspect(vim.api.nvim_win_get_cursor(0))
    -- local data = [[%t %m]]

    -- print(data)
    -- print(height, test, width, cursor_x, cursor_y, vim.inspect(vim.api.nvim_win_get_cursor(0)))

    local buffer_path = vim.api.nvim_buf_get_name(0)
    WriteToFile(buffer_path .. ":" .. cursor_x .. ":" .. cursor_y, "test")
    -- vim.inspect(vim.api.nvim_win_get_cursor(0))
end

function WriteToFile(content, file)
    file = io.open(file, "a")
    io.output(file)
    io.write(content .. "\n")
    io.close(file)
end

return {
    testprint = testprint
}

-- /home/infiniter/Code/Capture/capture.vim:6:5
