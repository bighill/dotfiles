-- define your colorscheme here
local colorscheme = 'gruvbox'
--local colorscheme = 'monokai_pro'
--local colorscheme = 'kanagawa-wave'
--local colorscheme = 'kanagawa-dragon'

local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not is_ok then
    vim.notify('colorscheme ' .. colorscheme .. ' not found!')
    return
end

