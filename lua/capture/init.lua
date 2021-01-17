local function create_todo()

    local cursor_x = vim.api.nvim_win_get_cursor(0)[1]
    local cursor_y = vim.api.nvim_win_get_cursor(0)[2]

    local title = vim.fn.input("TODO title: ")
    print(" ...saved")

    local buffer_path = vim.api.nvim_buf_get_name(0)
    WriteToFile("\n" .. title .. ":\n" .. buffer_path .. ":" .. cursor_x .. ":" .. cursor_y, "~/nvim_todo")
end

local function jump_to_file_with_column()
    local target = vim.fn.expand('<cWORD>')
    local parts = vim.split(target, ":")
    local file = parts[1]
    local line = tonumber(parts[2])
    local column = tonumber(parts[3])
    vim.api.nvim_command('e ' .. file)
    vim.api.nvim_win_set_cursor(0, {line, column})
end

function WriteToFile(content, file)
    file = io.open(file, "a")
    io.output(file)
    io.write(content .. "\n")
    io.close(file)
end

return {
    create_todo = create_todo,
    jump_to_file_with_column = jump_to_file_with_column
}

-- /home/infiniter/Code/Capture/capture.vim:6:5
