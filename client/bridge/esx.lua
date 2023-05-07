local esx = GetResourceState('es_extended'):find('start')
if not esx then return end

local ESX = exports.es_extended:getSharedObject()

function hasAccess(job)
    if not job then return end

    local playerData = ESX.GetPlayerData()

    if playerData.job.name == job then return true end

    return false
end