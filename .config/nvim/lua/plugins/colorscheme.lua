return {
  {
    "daltonmenezes/aura-theme",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    priority = 1000,
    config = function(plugin)
      -- Load the Neovim port specifically
      vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
      
      -- Set the variant you like: 'aura-dark', 'aura-dark-soft', or 'aura-soft-dark'
      vim.cmd("colorscheme aura-dark")
    end,
  },
}
