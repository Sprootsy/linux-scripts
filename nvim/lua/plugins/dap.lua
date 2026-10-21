return {
    "mfussenegger/nvim-dap",
    version = "0.10.0",
    dependencies = {
        {
            "rcarriga/nvim-dap-ui",
            version = "v4.0.0",
            dependencies = { "nvim-neotest/nvim-nio" },
            config = function()
                local dap, dapui = require("dap"), require("dapui")
                dapui.setup()
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
            end,
        },
    },
}
