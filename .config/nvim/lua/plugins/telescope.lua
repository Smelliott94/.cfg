return {
    {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      
      -- Keymaps
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find Text (Grep)" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Open Buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search Help Tags" })
    end,
    },
}
