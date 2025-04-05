local snacks = require("snacks")

local M = {}

M.get_visual_selection = function()
    local start_pos = vim.fn.getpos("'<")
    local end_pos = vim.fn.getpos("'>")
    local lines = vim.fn.getline(start_pos[2], end_pos[2])
    if #lines == 0 then
        return ""
    elseif #lines > 1 then
        snacks.notify.info("Can only handle single line, got " .. #lines)
        return ""
    end
    return lines[1]
end

M.escape_line = function(line)
    return string.gsub(line, "[\\\\%[%]()\\]", {
        ["\\"] = "\\\\",
        ["["] = "\\[",
        ["]"] = "\\]",
        ["("] = "\\(",
        [")"] = "\\)",
    })
end

return M
