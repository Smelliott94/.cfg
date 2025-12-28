return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        -- 1. Sidebar Appearance
        view = {
          width = 35,
          side = "left",
        },
        -- 2. Smart Logic: follow the file you are currently editing
        update_focused_file = {
          enable = true,
          update_root = true,
        },
        -- 3. Visuals: show git status and icons
        renderer = {
          highlight_git = true,
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
          },
        },
        -- 4. Filters: hide things like .git and __pycache__
        filters = {
          dotfiles = false,
          custom = { "^\\.git$" },
        },
      })

      -- Keymap to toggle with Space + e
      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
    end,
  },
}
