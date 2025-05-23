return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      build = (function()
        if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
          return
        end
        return "make install_jsregexp"
      end)(),
      dependencies = {
        -- `friendly-snippets`
        "rafamadriz/friendly-snippets",
        "capaj/vscode-standardjs-snippets",
      },
    },
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    luasnip.config.setup({})

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = {
        completeopt = "menu,menuone,noinsert",
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<Enter>"] = cmp.mapping.confirm({
          select = true,
        }),
        ["<C-Space>"] = cmp.mapping.confirm({
          select = true,
        }),
      }),
      sources = {
        {
          name = "nvim_lsp",
        },
        {
          name = "luasnip",
        },
        {
          name = "path",
        },
        {
          name = "codeium",
        },
      },
    })

    -- Snippets
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}
