" this file is for development purposes

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

" nnoremap <leader>X :call Capture()<CR>
" nnoremap <leader>J :call CaptureJump()<CR>

