local Config = require "config"


local points = {}
points.workshops = {}

for i = 1, #Config.WorkShops do
    local cfg = Config.WorkShops[i]

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

    points.workshops[i] = lib.points.new({
        coords = cfg.pos,
        distance = 8,
        onEnter = function(self)
            if cache.vehicle and hasAccess(cfg.job) then
                lib.showTextUI("[E] - open workshop")
            end
        end,
        onExit = function(self)
            lib.hideTextUI()
        end,
        nearby = function(self)
            if cache.vehicle and hasAccess(cfg.job) then
                DrawMarker(0, self.coords.x, self.coords.y, self.coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.8, 0.8, 0.8,
                    199, 208, 209, 100, false, true, 2, nil, nil, false)
                if self.currentDistance < 1 and IsControlJustReleased(0, 38) then
                    openTuningMenu()
                    currentVehProperties.old = getVehicleProperties(cache.vehicle)
                end
            end
        end
    })
end
