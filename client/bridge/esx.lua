local esx = GetResourceState('es_extended'):find('start')
if not esx then return end

local ESX = exports.es_extended:getSharedObject()

function hasAccess(job)
    if not job then return true end

    local playerData = ESX.GetPlayerData()

    if playerData.job.name == job then return true end

    return false
end

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    if hasAccess(ESX.GetPlayerData().job.name) then
        CreateCustomLocations()
    end
end)

RegisterNetEvent('esx:setJob', function(job)
    ESX.PlayerData.job = job
	if hasAccess(job) then
        CreateCustomLocations()
    else
        ClearCustomLocations()
    end
end)