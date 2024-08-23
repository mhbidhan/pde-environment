return {
  "jose-elias-alvarez/null-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({
            group = augroup,
            buffer = bufnr,
          })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format()
            end,
          })
        end
      end,
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.formatting.eslint.with({
          command = "eslint_d",
          args = { "--fix", "--stdin", "--stdin-filename", "$FILENAME" },
          condition = function(utils)
            return utils.root_has_file(".eslintrc.js") or utils.root_has_file(".eslintrc.json")
          end,
        }),
        null_ls.builtins.formatting.prettier.with({
          extra_args = { "--tab-width", "2", "--use-tabs", "false", "--semi", "true" }, -- Ensure prettier uses spaces
        }),
      },
    })

    vim.keymap.set("n", "<leader>s", vim.lsp.buf.format, {})
  end,
}
