return {
  { "rhysd/committia.vim" },
  { "EdenEast/nightfox.nvim" },
  {
    "unblevable/quick-scope",
    event = "BufReadPre",
  },
  {
    "dstein64/vim-startuptime",
    -- lazy-load on a command
    cmd = "StartupTime",
  }
}
