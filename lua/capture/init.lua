local utils = {}

-- os call using git and sed to get project name
function utils.get_project_name()
    local handle = io.popen([[git config --local remote.origin.url|sed -n 's#.*/\([^.]*\)\.git#\1#p']])
    local result = handle:read("*a")
    handle:close()
    return string.gsub(result, "%s+", "")
end

-- write content (string) to a file path (string)
function utils.write_to_file(file, content)
    file = io.open(file, "a")
    io.output(file)
    io.write(content .. "\n")
    io.close(file)
end

local capture = {}

capture.todo_file = os.getenv('HOME') .. "/todo.md";

-- Creates new todo
function capture.create_todo()
    local cursor_x = vim.api.nvim_win_get_cursor(0)[1]
    local cursor_y = vim.api.nvim_win_get_cursor(0)[2]

    local project_name = utils.get_project_name()

    local title = vim.fn.input("TODO title: ")
    if title == nil or title == '' then
        print(' ...canceled')
    else
        print(" ...saved")
        local buffer_path = vim.api.nvim_buf_get_name(0)
        utils.write_to_file(
        capture.todo_file,
        "# (" ..
        project_name ..
        ") " ..
        title ..
        "\n" ..
        buffer_path ..
        ":" ..
        cursor_x ..
        ":" ..
        cursor_y ..
        "\n"
        )
    end

end

-- Jumps to a file from todo list
-- Native gF doesnt work with columns
-- e.x. (file_path:row:col)
-- This is just exposed to user bind
function capture.jump_to_file_with_column()
    local target = vim.fn.expand('<cWORD>')
    local parts = vim.split(target, ":")
    local file = parts[1]
    local line = tonumber(parts[2])
    local column = tonumber(parts[3])
    vim.api.nvim_command('e ' .. file)
    vim.api.nvim_win_set_cursor(0, {line, column})
end

function capture.test()
    local root_path = vim.g['project_root_todo']
    print(vim.inspect(root_path))
end

-- Write 

return capture
