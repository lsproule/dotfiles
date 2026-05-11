return {
  "ltex",
  opts = {
    settings = {
      ltex = {
        language = "en-US",
        diagnosticSeverity = "information",
        disabledRules = {
          ["en-US"] = { "WHITESPACE_RULE" },
          trace = { server = "verbose" },
          completionEnabled = true,
        },
      },
    }
  }
}
