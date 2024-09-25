return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "rust_analyzer",
      },
    },
    config = function() end,
  },
}