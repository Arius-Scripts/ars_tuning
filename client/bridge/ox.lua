if GetResourceState('ox_core') ~= 'started' then return end

local file = ('imports/%s.lua'):format(IsDuplicityVersion() and 'server' or 'client')
local import = LoadResourceFile('ox_core', file)
local chunk = assert(load(import, ('@@ox_core/%s'):format(file)))

chunk()

function hasAccess(job)
    for k,v in pairs(player.groups) do
        if k == job then return true end
    end
    return false
end