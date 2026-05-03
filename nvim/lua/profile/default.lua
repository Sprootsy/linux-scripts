-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true
-- enable line numbers
vim.opt.nu = true
-- make line numbers relative
vim.opt.relativenumber = true
-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = "a"

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
    vim.o.clipboard = "unnamedplus"
end)

-- Enable undo/redo changes even after closing and reopening a file
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.o.undofile = true

-- Keep signcolumn on by default
vim.o.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- TERMINAL
--
-- Exit terminal mode in the builtin.terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
-- open a terminal in a new horizontal split window
-- Type <C-\><C-N> to leave Terminal-mode.
vim.keymap.set("n", "<C-t>", "<cmd>:hor te<CR>", { desc = "Open a new terminal in a horizontal split window" })

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-guide-options`
vim.o.list = true
vim.opt.listchars = { tab = "↦ ", nbsp = "␣", eol = "↵", space = "·", extends = "⮒" }

-- Preview substitutions live, as you type!
vim.o.inccommand = "split"

-- Show which line your cursor is on
vim.o.cursorline = true

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic Config & Keymaps
-- See :help vim.diagnostic.Opts
vim.diagnostic.config({
    update_in_insert = false,
    severity_sort = true,
    float = { border = "rounded", source = "if_many" },
    underline = { severity = { min = vim.diagnostic.severity.WARN } },

    -- Can switch between these as you prefer
    virtual_text = true, -- Text shows up at the end of the line
    virtual_lines = false, -- Text shows up underneath the line, with virtual lines

    -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
    jump = { float = true },
})
vim.keymap.set("n", "<C-q>", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Set tab key behavior: expand to 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Enable break indent
vim.o.breakindent = true
vim.opt.smartindent = true
-- display text in a new line if it does not fit in the screen
vim.opt.wrap = false
-- Disable swap file
vim.opt.swapfile = false
-- Disable backup file
vim.opt.backup = false

vim.opt.termguicolors = true

vim.opt.colorcolumn = "80"

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- TEXT EDITING
-- Move blocks of code up or down one line in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("default-highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("default-lsp-attach", { clear = true }),
    callback = function(event)
        -- Rename the variable under your cursor.
        vim.keymap.set("n", "grn", vim.lsp.buf.rename, { desc = "LSP: [R]e[n]ame", buffer = event.buf })
        -- Execute a code action, usually your cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        vim.keymap.set("n", "gca", vim.lsp.buf.code_action, { desc = "LSP: Goto [C]ode [A]ction", buffer = event.buf })
        vim.keymap.set("n", "gd", vim.lsp.buf.declaration, { desc = "LSP: [G]oto [D]eclaration", buffer = event.buf })

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client:supports_method("textDocument/documentHighlight", event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup("default-lsp-highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd("LspDetach", {
                group = vim.api.nvim_create_augroup("default-lsp-detach", { clear = true }),
                callback = function(event2)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds({ group = "default-lsp-highlight", buffer = event2.buf })
                end,
            })
        end

        if client:supports_method("textDocument/implementation") then
            -- Create a keymap for vim.lsp.buf.implementation
        end
        -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
        -- Disabled: a bit spammy in combination with blink
        --
        -- if client:supports_method("textDocument/completion") then
        --     -- Optional: trigger autocompletion on EVERY keypress. May be slow!
        --     -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
        --     -- client.server_capabilities.completionProvider.triggerCharacters = chars
        --     vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
        -- end
        -- Auto-format ("lint") on save.
        -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
        if
            not client:supports_method("textDocument/willSaveWaitUntil")
            and client:supports_method("textDocument/formatting")
        then
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = vim.api.nvim_create_augroup("default-lsp-attach", { clear = false }),
                buffer = event.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = event.buf, id = client.id, timeout_ms = 1000 })
                end,
            })
        end
    end,
})

-- autocomplete
vim.cmd([[set completeopt+=menuone,noselect,popup]])
vim.keymap.set("i", "<c-space>", function()
    vim.lsp.completion.get()
end)

-- Telescope fuzzy finder
-- See `:help telescope.builtin
local tele_bin = require("telescope.builtin")
vim.keymap.set("n", "<C-s>h", tele_bin.help_tags, { desc = "[S]earch [H]elp", remap = true })
vim.keymap.set("n", "<C-s>k", tele_bin.keymaps, { desc = "[S]earch [K]eymaps", remap = true })
vim.keymap.set("n", "<C-s>f", tele_bin.find_files, { desc = "[S]earch [F]iles", remap = true })
vim.keymap.set("n", "<C-s>s", tele_bin.builtin, { desc = "[S]earch [S]elect Telescope", remap = true })
vim.keymap.set({ "n", "v" }, "<C-s>w", tele_bin.grep_string, { desc = "[S]earch current [W]ord", remap = true })
-- missing dependency live_grep
-- vim.keymap.set('n', '<C-sg', tele_bin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set("n", "<C-s>d", tele_bin.diagnostics, { desc = "[S]earch [D]iagnostics", remap = true })
vim.keymap.set("n", "<C-s>r", tele_bin.resume, { desc = "[S]earch [R]esume", remap = true })
vim.keymap.set("n", "<C-s>.", tele_bin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)', remap = true })
vim.keymap.set("n", "<C-s>c", tele_bin.commands, { desc = "[S]earch [C]ommands", remap = true })
vim.keymap.set("n", "<C-s>b", tele_bin.buffers, { desc = "[ ] Find existing buffers", remap = true })

-- This runs on LSP attach per buffer (see main LSP attach function in 'neovim/nvim-lspconfig' config for more info,
-- it is better explained there). This allows easily switching between pickers if you prefer using something else!
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("default-telescope-lsp-attach", { clear = true }),
    callback = function(event)
        local buf = event.buf

        -- Find references for the word under your cursor.
        vim.keymap.set("n", "grr", tele_bin.lsp_references, { buffer = buf, desc = "[G]oto [R]eferences" })

        -- Jump to the implementation of the word under your cursor.
        -- Useful when your language has ways of declaring types without an actual implementation.
        vim.keymap.set("n", "gri", tele_bin.lsp_implementations, { buffer = buf, desc = "[G]oto [I]mplementation" })

        -- Jump to the definition of the word under your cursor.
        -- This is where a variable was first declared, or where a function is defined, etc.
        -- To jump back, press <C-t>.
        vim.keymap.set("n", "grd", tele_bin.lsp_definitions, { buffer = buf, desc = "[G]oto [D]efinition" })

        -- Fuzzy find all the symbols in your current document.
        -- Symbols are things like variables, functions, types, etc.
        vim.keymap.set("n", "gO", tele_bin.lsp_document_symbols, { buffer = buf, desc = "Open Document Symbols" })

        -- Fuzzy find all the symbols in your current workspace.
        -- Similar to document symbols, except searches over your entire project.
        vim.keymap.set(
            "n",
            "gW",
            tele_bin.lsp_dynamic_workspace_symbols,
            { buffer = buf, desc = "Open Workspace Symbols" }
        )

        -- Jump to the type of the word under your cursor.
        -- Useful when you're not sure what type a variable is and you want to see
        -- the definition of its *type*, not where it was *defined*.
        vim.keymap.set("n", "grt", tele_bin.lsp_type_definitions, { buffer = buf, desc = "[G]oto [T]ype Definition" })
    end,
})

-- DEBUGGING
-- See https://codeberg.org/mfussenegger/nvim-dap/src/branch/master/doc/dap.txt
--
vim.keymap.set("n", "<F5>", function()
    require("dap").continue()
end, { desc = "DAP: Continue" })
vim.keymap.set("n", "<F10>", function()
    require("dap").step_over()
end, { desc = "DAP: Step Over" })
vim.keymap.set("n", "<F11>", function()
    require("dap").step_into()
end, { desc = "DAP: Step Into" })
vim.keymap.set("n", "<F12>", function()
    require("dap").step_out()
end, { desc = "DAP: Step Out" })
vim.keymap.set("n", "<M-d>b", function()
    require("dap").toggle_breakpoint()
end, { desc = "DAP: Toggle [b]reakpoint" })
vim.keymap.set("n", "<M-d>B", function()
    require("dap").set_breakpoint()
end, { desc = "DAP: Set [B]reakpoint" })
vim.keymap.set("n", "<M-d>lp", function()
    require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end, { desc = "DAP: [L]og [P]oint" })
vim.keymap.set("n", "<M-d>dr", function()
    require("dap").repl.open()
end)
vim.keymap.set("n", "<M-d>l", function()
    require("dap").run_last()
end, { desc = "DAP: Run [L]ast" })
vim.keymap.set({ "n", "v" }, "<M-d>h", function()
    require("dap.ui.widgets").hover()
end, { desc = "DAP: [H]over" })
vim.keymap.set({ "n", "v" }, "<M-d>p", function()
    require("dap.ui.widgets").preview()
end, { desc = "DAP: [P]review" })
vim.keymap.set("n", "<M-d>f", function()
    local widgets = require("dap.ui.widgets")
    widgets.centered_float(widgets.frames)
end, { desc = "DAP: [F]rames" })
vim.keymap.set("n", "<M-d>s", function()
    local widgets = require("dap.ui.widgets")
    widgets.centered_float(widgets.scopes)
end, { desc = "DAP: [S]copes" })
