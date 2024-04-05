local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)


-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
--
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
-- keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
-- keymap("n", "<leader>t", "<cmd>Telescope live_grep<cr>", opts)
-- keymap("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)

keymap("n", "<leader>e", ":NvimTreeFindFileToggle<cr>", opts)
keymap("n", "<A-t>", "<cmd>ToggleTerm<cr>", opts)

-- keymap("n", "<leader>gg", ":LazyGit<cr>", opts)
-- keymap("n", "<leader>tl", ":Telescope lazygit<cr>", opts)
--
-- keymap("n", "<leader>br", ":BufferLineCloseRight<cr>", opts)
local whichkey = require("which-key")
whichkey.register({
  e = {"<cmd>NvimTreeFindFileToggle<cr>", "Explorer"},
  g = {
    name = "Git",
    g = { "<cmd>LazyGit<cr>", "LazyGit" },
    l = { "<cmd>Telescope lazygit<cr>", "LazyGit Telescope" },
  },
  f = {
    name = "Find",
    f = { "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", "Find Files" },
    t = { "<cmd>Telescope live_grep<cr>", "Find Text" },
    b = { "<cmd>Telescope buffers<cr>", "Find Buffers" },
  },
  b = {
    name = "Buffers",
    b = { "<cmd>Telescope buffers<cr>", "Find Buffers" },
    r = { "<cmd>BufferLineCloseRight<cr>", "Close Right" },
    l = { "<cmd>BufferLineCloseLeft<cr>", "Close Left" },
    o = { "<cmd>BufferLineCloseOther<cr>", "Close Other" },
    d = { "<cmd>:bd<cr>", "Delete Buffer" },
    w = { "<cmd>:bw<cr>", "Forced Wipeout Buffer" },
  },
  t = {
    name = "Terminal",
    t = { "<cmd>ToggleTerm<cr>", "Toggle Terminal" },
    h = { "<cmd>ToggleTerm<cr>", "Toggle Terminal" },
  },
},{prefix = "<leader>"})
-- whichkey.register({
--   --better terminal navigation
--   ["<C-h>"] = { "<C-\\><C-N><C-w>h", "Terminal Left" },
--   ["<C-j>"] = { "<C-\\><C-N><C-w>j", "Terminal Down" },
--   ["<C-k>"] = { "<C-\\><C-N><C-w>k", "Terminal Up" },
--   ["<C-l>"] = { "<C-\\><C-N><C-w>l", "Terminal Right" },
-- })
