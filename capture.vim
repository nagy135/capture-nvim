fun! Capture()
    lua for k in pairs(package.loaded) do if k:match("^capture") then package.loaded[k] = nil end end
    lua require("capture").testprint()
endfun

augroup Capture
    autocmd!
augroup END
