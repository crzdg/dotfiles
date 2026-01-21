config = {
    mode = "legacy",
    provider="copilot/gpt-4.1",
    disabled_tools = {"git_commit", "bash"},
    behaviour = {
        auto_suggestions = false,
        enable_cursor_planning_mode = true,
    },
    providers = {
        ["copilot/gpt-4.1"] = {
              __inherited_from = "copilot",
              model = "gpt-4.1",
              display_name = "copilot/gpt-4.1",
              disable_tools = true,
            }
    },
    windows = {
        input = {
            height = 25,
        },
    }
}


return config
