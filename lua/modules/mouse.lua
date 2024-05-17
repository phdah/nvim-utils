---This is a module for setting and toggeling the mouse
---on and off. It requires that you set the mouse initially
---with the constructor
local Mouse = {}
Mouse.__index = Mouse

---Constructor for mosue class
---@param state boolean
function Mouse:new(state)
    self = setmetatable(self, Mouse)
    if state == nil then state = false end
    self.state = state
    if state then
        vim.o.mouse = "a"
    else
        vim.o.mouse = ""
    end
end

---Toggle mouse on or off, using either "" or "a"
---based on the class current state
function Mouse:toggle()
    local mouseOn = "a"
    local mouseOff = ""

    if self.state == false then
        vim.o.mouse = mouseOn
        self.state = true
    elseif self.state == true then
        vim.o.mouse = mouseOff
        self.state = false
    elseif self.state == nil then
        error([[
'Mouse' class not initialized.

Before running `toggle()`, initialize by calling:
require("nvim-utils").Mouse:new(<true or false>)

Please see `:h nvim-utils-mouse` for info.
        ]],
         0)
    end
end

return Mouse
