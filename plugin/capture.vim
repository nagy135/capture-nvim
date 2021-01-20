
lua capture_module = require("capture")

nnoremap <leader>X :lua capture_module.create_todo()<CR>
nnoremap <leader>J :lua capture_module.jump_to_file_with_column()<CR>
