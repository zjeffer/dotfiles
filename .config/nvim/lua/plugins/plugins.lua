return {
  require("neo-tree").setup({
    filesystem = {
      window = {
        mappings = {
          -- disable fuzzy finder
          ["/"] = "noop",
        },
      },
    },
  }),
}
