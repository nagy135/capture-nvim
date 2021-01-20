" this file is for development purposes

" let g:project_root_todo = 1
" let g:todo_file_location = '   ~/test/~/lol'

fun! Capture()
    lua for k in pairs(package.loaded) do if k:match("^capture") then package.loaded[k] = nil end end
    lua require("capture").create_todo()
endfun

fun! CaptureTest()
    lua for k in pairs(package.loaded) do if k:match("^capture") then package.loaded[k] = nil end end
    lua require("capture").test()
endfun

augroup Capture
    autocmd!
augroup END
