Vimspector_cfg = {}

local vimspector_python = [[
{
  "configurations": {
    "<name>: Launch": {
      "adapter": "debugpy",
      "configuration": {
        "name": "Python: Launch",
        "type": "python",
        "request": "launch",
        "python": "%s",
        "stopOnEntry": true,
        "console": "externalTerminal",
        "debugOptions": [],
        "program": "${file}"
      }
    }
  }
}
]]

local function debuggers()
  vim.g.vimspector_install_gadgets = {
    "debugpy", -- Python
  }
end

--- Generate debug profile. Currently for Python only
function Vimspector_cfg.generate_debug_profile()
  -- Get current file type
  local buf = vim.api.nvim_get_current_buf()
  local ft = vim.api.nvim_buf_get_option(buf, "filetype")

  if ft == "python" then
    -- Get Python path
    local python3 = vim.fn.exepath "python"
    local debugProfile = string.format(vimspector_python, python3)

    -- Generate debug profile in a new window
    vim.api.nvim_exec("vsp", true)
    local win = vim.api.nvim_get_current_win()
    local bufNew = vim.api.nvim_create_buf(true, false)
    vim.api.nvim_buf_set_name(bufNew, ".vimspector.json")
    vim.api.nvim_win_set_buf(win, bufNew)

    local lines = {}
    for s in debugProfile:gmatch "[^\r\n]+" do
      table.insert(lines, s)
    end
    vim.api.nvim_buf_set_lines(bufNew, 0, -1, false, lines)
  else
    print("Unsupported language - " .. ft)
  end
end

local function set_keybindings()
  -- Generating the config file for the debugger.
  vim.keymap.set('n', '<leader>dG', "<CMD>lua require('core.plugin_config.vimspector');Vimspector_cfg.generate_debug_profile()<CR>")
  vim.keymap.set('n', '<leader>dR', "<CMD>call vimspector#Restart()<CR>")
  vim.keymap.set('n', '<leader>dS', "<CMD>call vimspector#Stop()<CR>")
  vim.keymap.set('n', '<leader>ds', "<CMD>call vimspector#Launch()<CR>")
  vim.keymap.set('n', '<leader>dr', "<CMD>call vimspector#RunToCursor()<CR>")
  vim.keymap.set('n', '<leader>dc', "<CMD>call vimspector#Continue()<CR>")
  vim.keymap.set('n', '<leader>di', "<CMD>call vimspector#StepInto()<CR>")
  vim.keymap.set('n', '<leader>do', "<CMD>call vimspector#StepOver()<CR>")
  vim.keymap.set('n', '<leader>dt', "<CMD>call vimspector#ToggleBreakpoint()<CR>")
  vim.keymap.set('n', '<leader>du', "<CMD>call vimspector#StepOut()<CR>")
  vim.keymap.set('n', '<leader>dx', "<CMD>VimspectorReset<CR>")
end

function Vimspector_cfg.setup()
  vim.cmd("packadd vimspector") -- Load vimspector
  debuggers() -- Configure debuggers
  set_keybindings() -- Set relative keybindings.
end


Vimspector_cfg.setup()
