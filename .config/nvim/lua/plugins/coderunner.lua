return {
  "CRAG666/code_runner.nvim",
  cmd = "RunCode", -- lazy-load i při kliknutí na tlačítko
  init = function()
    -- klikací "▶ Run" vpravo nahoře v každém okně se souborem (jako ve VSCode)
    _G.RunCodeClick = function()
      vim.cmd("RunCode")
    end
    local btn = "%=%#DiagnosticOk#%@v:lua.RunCodeClick@ ▶ Run %X%*"
    vim.api.nvim_create_autocmd({ "BufWinEnter", "TermOpen" }, {
      callback = function(ev)
        local file = vim.bo[ev.buf].buftype == "" and vim.api.nvim_buf_get_name(ev.buf) ~= ""
        vim.wo.winbar = file and btn or ""
      end,
    })
    -- schovat "[Process exited 0]" (Neovim ho kreslí jako virtual text v tomto namespace)
    local exitmsg_ns = vim.api.nvim_create_namespace("nvim.terminal.exitmsg")
    vim.api.nvim_create_autocmd({ "TermClose", "TermOpen" }, {
      callback = function(ev)
        vim.schedule(function()
          if vim.api.nvim_buf_is_valid(ev.buf) then
            vim.api.nvim_buf_clear_namespace(ev.buf, exitmsg_ns, 0, -1)
          end
        end)
      end,
    })
  end,
  config = function()
    require("code_runner").setup({
      mode = "term", -- otevře se v terminálu dole
      focus = true, -- rovnou přepne kurzor do terminálu (super pro input())
      startinsert = true, -- rovnou zapne režim psaní
      filetype = {
        python = "python3 -u",
        cs = "dotnet run",
      },
    })
  end,
  keys = {
    { "<leader>r", ":RunCode<CR>", desc = "Spustit kód (Run)" },
    { "<F5>", ":RunCode<CR>", desc = "Spustit kód (Run)" },
  },
}
