local lualine = require('lualine')

lualine.setup{
  options = {
    theme = 'auto',
    component_separators = { left='', right=''},
  },
}

local config = {
  sections = {
    lualine_c = {}
  }
}

local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

ins_left{
  'filename',
  show_filename_only = true,
  -- path = 1,
  -- mode = 2,
}

ins_left ({
  function()
    return '%='
  end,
})

ins_left({
  -- Lsp server name .
  function()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end

    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        -- exclude these two servers
        if client.name ~= 'null-ls' or client.name ~= 'copilot' then
          return client.name
        end
      end
    end
    return msg
  end,
  icon = ' LSP:',
  color = { fg = '#ffffff', gui = 'bold' },
})

lualine.setup(config)
