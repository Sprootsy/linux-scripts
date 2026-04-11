vim.pack.add({
    "https://github.com/mfussenegger/nvim-dap",
    {
        src = "https://github.com/mfussenegger/nvim-dap",
        version = "0.10.0",
    },
})

vim.pack.add({
    "https://github.com/rcarriga/nvim-dap-ui",
    {
        src = "https://github.com/rcarriga/nvim-dap-ui",
        version = "v4.0.0",
    },
})

local dap, dapui = require("dap"), require("dapui")
dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end
