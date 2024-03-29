local iron = require "iron.core"
iron.setup({
  config = {
    should_map_plug = false,
    scratch_repl = true,
    repl_definition = {
      python = {
        command = { "ipython" },
        format = require("iron.fts.common").bracketed_paste,
      },
      R = {
          command = { "R "}
      }
    },
    repl_open_cmd = require("iron.view").split.vertical("42%")
  },
  keymaps = {
    send_motion = "ctr",
    visual_send = "ctr",
  },
})
