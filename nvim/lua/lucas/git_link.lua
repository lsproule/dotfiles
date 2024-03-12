local actions = require("telescope.actions")
local actions_state = require("telescope.actions.state")
local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
local themes = require("telescope.themes")

function git_link(consider_selection)
  local git_rev = vim.trim(vim.system({ "git", "rev-parse", "HEAD" }):wait().stdout)
  local git_root = vim.trim(vim.system({ "git", "rev-parse", "--show-toplevel" }):wait().stdout)
  local path = vim.fn.expand("%:p"):sub(#git_root + 1)
  local lines = {}

  if consider_selection then
    local pos_v = vim.fn.getpos("v")
    local pos_c = vim.fn.getpos(".")

    lines = {
      { pos_v[2], pos_v[3] },
      { pos_c[2], pos_c[3] },
    }

    table.sort(lines, function(a, b)
      return a[1] < b[1]
    end)

    lines[2][2] = lines[2][2] + 1
  end

  local mode = vim.api.nvim_get_mode()

  ---@param url string
  ---
  ---@return string url
  local get_url = function(url)
    if not vim.startswith(url, "http") then
      url = vim.fn.substitute(url, "\\v\\w+\\@(.*):(.*)", "https:\\/\\/\\1\\/\\2", "")
    end

    local is_github = false

    if url:match("github.com") then
      is_github = true
    end

    if vim.endswith(url, ".git") then
      url = url:sub(1, #url - 4)
    end

    if is_github then
      url = url .. "/blob/" .. git_rev .. path
    else
      url = url .. "/tree/" .. git_rev .. "/item" .. path
    end

    if not consider_selection then
      return string.format("%s", url)
    end

    if not is_github then
      return string.format("%s#L%d-%d", url, lines[1][1], lines[2][1])
    end

    if mode == "V" then
      return string.format("%s#L%d-L%d", url, lines[1][1], lines[2][1])
    end

    return string.format(
      "%s#L%dC%d-L%dC%d",
      url,
      lines[1][1],
      lines[1][2],
      lines[2][1],
      lines[2][2]
    )
  end

  ---@param url string
  local handle_url = function(url)
    vim.ui.select({
      { target = "browser", text = "Open in Browser" },
      { target = "clipboard", text = "Copy to Clipboard" },
    }, {
      format_item = function(item)
        return item.text
      end,
    }, function(choice)
      if choice.target == "browser" then
        vim.ui.open(url)
      else
        vim.fn.setreg("+", url)
        vim.notify("Copied URL to clipboard.")
      end
    end)
  end

  vim.system({ "git", "remote", "-v" }, {}, vim.schedule_wrap(function(result)
      if result.code ~= 0 then
        error("failed to get git remotes: " .. result.stderr)
      end

      local urls = {}

      for line in vim.gsplit(result.stdout, "\n", { trimempty = true }) do
        local parts = vim.split(line, "\t")
        local url = vim.split(parts[2], " ")[1]

        urls[url] = true
      end

      if vim.tbl_count(urls) == 1 then
        handle_url(get_url(vim.tbl_keys(urls)[1]))
        return
      end

      local picker = pickers.new(themes.get_cursor(), {
        prompt_title = "Select a remote",
        results_title = "Git Remotes",
        sorter = require("telescope.config").values.generic_sorter({}),
        finder = finders.new_table({ results = vim.tbl_keys(urls) }),
        attach_mappings = function(buffer)
          actions.select_default:replace(function()
            actions.close(buffer)

            local url = get_url(actions_state.get_selected_entry()[1])

            handle_url(url)
          end)

          return true
        end,
      })

      picker:find()
    end
  ))
end


