local qb = GetResourceState('qb-core'):find("start")
if not qb then return end

local QBCore = exports['qb-core']:GetCoreObject()

function hasAccess(job)
    if not job then return end

    local playerData = QBCore.Functions.GetPlayerData()

    if playerData.job.name == job then return true end
    
    return false
end