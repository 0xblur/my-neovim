-- Disable autocompletion on markdown documents
return {
  "hrsh7th/nvim-cmp",
  opts = function()
    local cmp = require"cmp"
    cmp.setup.filetype({"markdown"}, {
      completion = {
        autocomplete = false
      }
    })
  end
}
