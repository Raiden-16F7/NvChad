require "nvchad.mappings"

-- add yours here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

keymap.set("n", "<leader><leader>", "<cmd> Telescope find_files<cr>")
keymap.set("n", "<leader>/", "<cmd> Telescope live_grep<cr>")
keymap.set("n", "<leader>,", "<cmd> Telescope buffers<cr>")
keymap.set("n", "<leader>gf,", "<cmd> LazyGitCurrentFile<cr>")
-- Delete a word backwards
-- keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")
-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

keymap.set("n", ";", ":", { desc = "CMD enter command mode" })
keymap.set("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
