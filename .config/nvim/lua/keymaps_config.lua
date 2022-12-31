local key_mapper = function(mode, key, result)
    vim.api.nvim_set_keymap(mode, key, result, { noremap = true, silent = true })
end

-- remapping escape to jk in insert/terminal mode
key_mapper("i", "jk", "<ESC>")
key_mapper("t", "jk", "<C-\\><C-n>")

-- tabs
key_mapper("n", "<leader>t", ":tabnew<CR>")
key_mapper("n", "<leader>w", ":tabclose<CR>")

-- terminal navigation
key_mapper("t", "<C-h>", "<C-\\><C-N><C-w>h")
key_mapper("t", "<C-j>", "<C-\\><C-N><C-w>j")
key_mapper("t", "<C-k>", "<C-\\><C-N><C-w>k")
key_mapper("t", "<C-l>", "<C-\\><C-N><C-w>l")

-- window navigation
key_mapper("n", "<C-j>", "<C-w>j")
key_mapper("n", "<C-h>", "<C-w>h")
key_mapper("n", "<C-k>", "<C-w>k")
key_mapper("n", "<C-l>", "<C-w>l")
key_mapper("n", "<leader>-", ":resize -10 <CR>")
key_mapper("n", "<leader>+", ":resize +10 <CR>")
key_mapper("n", "<leader>>", ":vertical resize +10 <CR>")
key_mapper("n", "<leader><", ":vertical resize -10 <CR>")
