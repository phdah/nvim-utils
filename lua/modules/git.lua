local M = {}

M.find_git_root = function()
    -- If git repo, show all files in repo.
    local root = vim.fn.trim(vim.fn.system("git rev-parse --show-toplevel"))
    if root == "fatal: not a git repository (or any of the parent directories): .git" then
        return vim.fn.getcwd()
    end
        return root
end

return M
