return {
  {
    dir = "~/.local/share/nvim/lazy/nvim-lspconfig",
    init = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<A-k>', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
          vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
          end, opts)
        end,
      })
      require("lspconfig").gopls.setup{}

      local util = require 'lspconfig.util'
      local function switch_source_header(bufnr)
        bufnr = util.validate_bufnr(bufnr)
        local clangd_client = util.get_active_client_by_name(bufnr, 'clangd')
        local params = { uri = vim.uri_from_bufnr(bufnr) }
        if clangd_client then
          clangd_client.request('textDocument/switchSourceHeader', params, function(err, result)
            if err then
              error(tostring(err))
            end
            if not result then
              print 'Corresponding file cannot be determined'
              return
            end                                                                                                                                                              
            vim.api.nvim_command('edit ' .. vim.uri_to_fname(result))
          end, bufnr)
        else
          print 'method textDocument/switchSourceHeader is not supported by any servers active on the current buffer'
        end
      end
      local root_files = {
        '.clangd',
        '.clang-tidy',
        '.clang-format',
        'compile_commands.json',
        'compile_flags.txt',
        'configure.ac', -- AutoTools
      }

      local default_capabilities = {
        textDocument = {
          completion = {
            editsNearCursor = true,
          },
        },
        offsetEncoding = { 'utf-8', 'utf-16' },
      }

      require("lspconfig").clangd.setup{
        cmd = { '/usr/bin/clangd' },
        filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
        root_dir = function(fname)
          return util.root_pattern(unpack(root_files))(fname)
        end,
        single_file_support = false,
        capabilities = default_capabilities,
      }
      vim.keymap.set("n", "<leader>aa", switch_source_header)

      require("lspconfig").pyright.setup({
        cmd = {'/usr/local/bin/pyright-langserver', '--stdio'},
        filetypes = { 'python' },
        single_file_support = true,
      })
    end
  }
}
