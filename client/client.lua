local Config = require "config"

local points = {}
points.workshops = {}

function CreateCustomLocations()
    ClearCustomLocations()
    for k, cfg in pairs(Config.WorkShops) do
        if cfg.blip.enable then
            local blip = AddBlipForCoord(cfg.pos)
    
            SetBlipSprite(blip, cfg.blip.type)
            SetBlipDisplay(blip, 6)
            SetBlipScale(blip, cfg.blip.scale)
            SetBlipColour(blip, cfg.blip.color)
            SetBlipAsShortRange(blip, true)
    
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(cfg.blip.name)
            EndTextCommandSetBlipName(blip)
        end
    
        points.workshops[k] = lib.points.new({
            coords = cfg.pos,
            distance = 8,
            onEnter = function(self)
                if cache.vehicle and hasAccess(cfg.job) then
                    lib.showTextUI("[E] - Accéder à l'atelier")
                end
            end,
            onExit = function(self)
                lib.hideTextUI()
            end,
            nearby = function(self)
                if cache.vehicle and hasAccess(cfg.job) then
                    DrawMarker(36, self.coords.x, self.coords.y, self.coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, cfg.marker.scale.x, cfg.marker.scale.y, cfg.marker.scale.z,
                    cfg.marker.color.r, cfg.marker.color.b, cfg.marker.color.b, cfg.marker.color.alpha, false, true, 2, nil, nil, false)
                    if self.currentDistance < 8.0 and IsControlJustReleased(0, 38) then
                        local vehicle = cache.vehicle
                        currentVehProperties.old = getVehicleProperties(vehicle)
    
                        local color1_r, color1_g, color1_b = GetVehicleCustomPrimaryColour(vehicle)
                        currentVehProperties.old.color1 = { color1_r, color1_g, color1_b }
    
                        local color2_r, color2_g, color2_b = GetVehicleCustomSecondaryColour(vehicle)
                        currentVehProperties.old.color2 = { color2_r, color2_g, color2_b }
    
                        openTuningMenu()
                    end
                end
            end
        })
    end
end

function ClearCustomLocations()
    for k, customPoint in pairs(points.workshops) do
        if customPoint then
            customPoint:remove()
        end
    end
end