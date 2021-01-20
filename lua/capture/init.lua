local utils = {}

-- os call using git and sed to get project name
function utils.get_project_name()
    return utils.run_and_trim([[git config --local remote.origin.url 2> /dev/null | sed -n 's#.*/\([^.]*\)\.git#\1#p']])
end

-- os call using git to get absolute path to project root
function utils.get_project_root_path()
    return utils.run_and_trim([[git rev-parse --show-toplevel]])
end

-- runs given command and trims trailing whitespace (mostly newlines)
function utils.run_and_trim(command)
    local handle = io.popen(command)
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

-- validates user defined value or provides default
-- for unified todo file location
function capture.get_todo_file_location()
    local g_location = vim.g['todo_file_location']
    if g_location == nil or g_location == "" then
        return os.getenv('HOME') .. "/todo.md";
    end
    return g_location

end

-- Creates new todo
function capture.create_todo()
    local cursor_x = vim.api.nvim_win_get_cursor(0)[1]
    local cursor_y = vim.api.nvim_win_get_cursor(0)[2]

    local project_name = utils.get_project_name()

    local todo_file
    local project_name_header = ""
    if vim.g['project_root_todo'] == 1 then
        local project_root = utils.get_project_root_path()
        if project_root == "" then
            print('not in the project ...exiting (if you want this to work outside project, use let g:project_root_todo = 0 )')
            return
        end
        todo_file = project_root .. "/todo.md"

    else
        todo_file = capture.get_todo_file_location()
        if project_name ~= "" then
            project_name_header = "(" .. project_name .. ") "
        end
    end


    local title = vim.fn.input("TODO title: ")
    if title == nil or title == '' then
        print(' ...canceled')
    else
        print(" ...saved")
        local buffer_path = vim.api.nvim_buf_get_name(0)
        utils.write_to_file(
        todo_file,
        "# " ..
        project_name_header ..
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
    if root_path == 1 then
        print("haha")
    end
end

-- Write 

return capture
