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

-- LSP
key_mapper("n", "gD", ":lua vim.lsp.buf.declaration() <CR>")
key_mapper("n", "gd", ":lua vim.lsp.buf.definition() <CR>")
key_mapper("n", "gi", ":lua vim.lsp.buf.implementation() <CR>")
key_mapper("n", "<C-s>", ":lua vim.lsp.buf.signature_help() <CR>")
key_mapper("n", "<space>D", ":lua vim.lsp.buf.type_definition() <CR>")
key_mapper("n", "gr", ":lua vim.lsp.buf.references() <CR>")
key_mapper("n", "<space>e", ":lua vim.diagnostic.open_float() <CR>")
key_mapper("n", "K", ":lua vim.lsp.buf.hover()<CR>")
key_mapper("n", "<space>rn", ":lua vim.lsp.buf.rename()<CR>")
key_mapper("n", "<leader>fo", ":lua vim.lsp.buf.format{ async = true }<CR>")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fG', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fg', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
