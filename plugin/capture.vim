
lua capture_module = require("capture")

" default values for variables
let g:project_root_todo = 0
let g:todo_file_location = ""

nnoremap <leader>X :lua capture_module.create_todo()<CR>
nnoremap <leader>J :lua capture_module.jump_to_file_with_column()<CR>
