-- cmake tools
return {
  {
    "Civitasv/cmake-tools.nvim",
    -- you can add any dependencies here
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    -- you can also add any opts here
    opts = {
      cmake_command = "cmake",
      cmake_build_directory = "build",
      cmake_build_type = "Debug",
    },
  },
}
