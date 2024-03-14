#!/usr/bin/env -S nvim -u NONE -U NONE -N -i NONE -l

-- Rockspec template
local rockspec_template = --[[ lua ]]
    [[
local _MODREV, _SPECREV = "scm", "-1"
rockspec_format = "3.0"
package = "rocks-treesitter.nvim"
version = _MODREV .. _SPECREV

dependencies = {
    "lua >= 5.1",
    "nvim-treesitter ~> 0.9",
    -- generated dependencies from rocks-binaries
    %s
}

source = {
    url = "git://github.com/nvim-neorocks/" .. package,
}

build = {
    type = "builtin",
    copy_directories = {
        "plugin",
    },
}
]]

---@param dependencies string[]
---@param deps_per_line integer
local function generate_dependencies_str(dependencies, deps_per_line)
    local deps_string = ""
    local line = ""
    for i, dep in ipairs(dependencies) do
        line = line .. '"' .. dep .. '"'
        if i % deps_per_line == 0 and i < #dependencies then
            line = line .. ",\n    "
            deps_string = deps_string .. line
            line = ""
        elseif i < #dependencies then
            line = line .. ", "
        end
    end
    -- Append the last line if it has content and was not appended in the loop
    if line ~= "" then
        deps_string = deps_string .. line .. ", "
    end
    return deps_string
end

local parser_file_name = "tree-sitter-parsers.json"
local file = io.open(parser_file_name, "r")
if not file then
    error(parser_file_name .. " not found")
end
local content = assert(file, parser_file_name .. " not found"):read("*a")
file:close()

local parsers_tbl = vim.iter(vim.json.decode(content).parsers)
    :map(function(parser)
        return "tree-sitter-" .. parser.lang
    end)
    :filter(function(rock_name)
        print("Searching for " .. rock_name)
        ---@type vim.SystemCompleted
        local sc = vim.system({
            "luarocks",
            "--lua-version=5.1",
            "--only-server='https://nvim-neorocks.github.io/rocks-binaries/'",
            "search",
            "--porcelain",
            rock_name,
        }):wait()
        if sc.code ~= 0 or not sc.stdout then
            print(sc.stdout or "")
            print(sc.stderr or "")
            error("Failed to search rocks-binaries")
        end
        for line in sc.stdout:gmatch("[^\r\n]+") do
            local name = line:match("(%S+)")
            if name == rock_name then
                print("Adding " .. rock_name)
                return true
            end
        end
        print(rock_name .. " not found on rocks-binaries server")
        return false
    end)
    :totable()

local dependencies_string = generate_dependencies_str(parsers_tbl, 5)
local formatted_rockspec = vim.print(rockspec_template:format(dependencies_string))

-- fetched from nvim-neorocks/nurr
local filename = "rocks-treesitter.nvim-scm-1.rockspec"
file = io.open(filename, "w")
if file then
    file:write(formatted_rockspec)
    file:close()
    print("Rockspec saved to " .. filename)
else
    print("Error opening file for writing.")
end
