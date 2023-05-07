if GetResourceState('es_extended') ~= 'started' then return end

local ESX = exports.es_extended:getSharedObject()


function hasAccess(job)
    local playerData = ESX.GetPlayerData()

    
    return false
end