require'nvim-treesitter.configs'.setup {
ensure_installed = "cpp", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
highlight = {
  enable = true,              -- false will disable the whole extension
  disable = { "vim" },  -- list of language that will be disabled
  -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
  -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
  -- Using this option may slow down your editor, and you may see some duplicate highlights.
  -- Instead of true it can also be a list of languages
  -- additional_vim_regex_highlighting = true,
},

indent = {
  enable = false,
  disable = {"python"}
},

incremental_selection = { 
  enable = true,
  keymaps = {
    init_selection = "<leader>ns",
    node_incremental = "<leader>ni",
    scope_incremental = "<leader>si",
    node_decremental = "<leader>nd",
  },
},

rainbow = {
  enable = true,
  extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
  max_file_lines = nil, -- Do not enable for files with more than n lines, int
},
}

