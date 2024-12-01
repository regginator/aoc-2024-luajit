local util = {}

util.ReadFile = function(path, mode)
    mode = mode or "r"

    local f, err = io.open(path, mode)
    assert(f, "failed to open file: " .. (err or ""))

    local body = f:read("*a")
    f:close()

    return body
end

return util
