
function isDir(name)
    if type(name)~="string" then return false end
    if os.execute('test -d '..name) == 0 then return true else return false end
end

function isFile(name)
    if type(name)~="string" then return false end
    if os.execute('test -f '..name) == 0 then return true else return false end
end

function exists(name)
    if type(name)~="string" then return false end
    if os.execute('test -e '..name) == 0 then return true else return false end
end

function isInGitRepo()
    return os.execute("git rev-parse HEAD > /dev/null 2>&1")
end

function gitRepoPath()
    local handle = io.popen("git rev-parse --show-toplevel")
    local result = handle:read("*a")
    handle:close()
    return string.gsub(result, "[\n\r%z]", "")
end
