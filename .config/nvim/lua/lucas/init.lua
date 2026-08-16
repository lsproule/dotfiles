require("lucas.options")
require("lucas.globals")
require("lucas.packages")
-- mason is now configured in its lazy plugin spec (lua/plugins/mason.lua) so its
-- bin dir is on PATH before lsp-manager enables servers. (was: require("lucas.mason"))
require("lucas.keymaps")
require("lucas.colorscheme")
require("lucas.autocmds")
require("lucas.commands")
require("lucas.snippets")

