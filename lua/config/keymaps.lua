local discipline = require("bill.discipline")

-- discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "x", '"_x')

keymap.set("n", "<c-k>", "[e")
keymap.set("n", "<c-j>", "]e")
keymap.set("v", "<c-j>", "]egv")
keymap.set("v", "<c-k>", "[egv")
keymap.set("n", "<Tab>j", "<PageDown")
keymap.set("n", "<Tab>k", "<PageUp")

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Disable continuations
keymap.set("n", "<Leader>r", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>R", "O<Esc>^Da", opts)

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<Up>", ":resize +2<CR>")
keymap.set("n", "<Down>", ":resize -2<CR>")
keymap.set("n", "<Left>", ":vertical resize +2<CR>")
keymap.set("n", "<right>", ":vertical resize -2<CR>")

keymap.set("n", ",,", "<c-^>")

-- Diagnostics
keymap.set("n", "<C-j>", function()
	vim.diagnostic.goto_next()
end, opts)

keymap.set("n", "<leader>r", function()
	require("bill.utils").replaceHexWithHSL()
end)

keymap.set("n", "<S-t>", [[<Esc>:lua require'luasnip'.unlink_current()<CR>a]], { noremap = true, silent = true })
