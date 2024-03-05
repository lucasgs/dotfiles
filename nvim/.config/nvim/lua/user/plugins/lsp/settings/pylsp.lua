return {
  settings = {
    pylsp = {
      plugins = {
        black = {
          cache_config = true,
          enabled = true,
          line_length = 119,
        },
        flake8 = {
          enabled = false,
          maxLineLength = 119,
        },
        mypy = {
          enabled = true,
        },
        pycodestyle = {
          enabled = false,
        },
        pyflakes = {
          enabled = false,
        },
        ruff = {
          enabled = true,
          extendSelect = { "I" },
        },
      }
    }
  }
}
