return {
  {
    "ibhagwan/fzf-lua",
    opts = function(_, opts)
      local img_previewer = { "chafa", "{file}" }
      opts.previewers.builtin.extensions = {
        ["png"] = img_previewer,
        ["jpg"] = img_previewer,
        ["jpeg"] = img_previewer,
        ["gif"] = img_previewer,
        ["webp"] = img_previewer,
      }
      return opts
    end,
  },
}
