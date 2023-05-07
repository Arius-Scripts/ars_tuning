local mods = require "client.vehicle.modList"
local colors = require "client.vehicle.colorList"

lib.locale()

local function openModsMenu(veh, mod, maxMods)
    if maxMods < 1 then return lib.showTextUI('No mods') end
    local options = {}

    local vehicle = veh
    local modType = nil
    local modTitle = nil

    for k,v in pairs(mods) do
        if v.modNum == mod then
            modTitle = v.title
            modType = k
            modNum = v.modNum
            modLabel = v.label
            parentMenu = v.parent

            if modNum == 23 then modType = "modFrontWheels" end

            icon = v.icon or "car"

            currentMod = getVehicleProperties(vehicle)[modType]

            break
        end
        Wait(1)
    end

    for i = 1, maxMods, 1 do
        local modNativeLabel = GetLabelText(GetModTextLabel(vehicle, modNum, i))

        if modNativeLabel == "NULL" then
            modLabel = modLabel
        else
            modLabel = modNativeLabel
        end

        if currentMod == -1 then currentMod = maxMods end

        if i == maxMods then 
            menuTitle = locale("base_mod")
        else
            menuTitle = modLabel.." "..i
        end

        if modType == "modHorns" then menuTitle = getHornName(i) end


        if i == currentMod then
            disabled = true
        else
            disabled = false
        end

        table.insert(options,
            {
                title = menuTitle,
                icon = icon,
                iconColor = getVehicleColor(),
                disabled = disabled,
                onSelect = function()
                    local properties = {}
                    properties[modType] = i
                    lib.setVehicleProperties(vehicle, properties)
                    playSound('Zoom_In', 'DLC_HEIST_PLANNING_BOARD_SOUNDS')

                    local mods = getVehicleModCounts(vehicle, modNum)

                    openModsMenu(vehicle, modNum, mods)

                end
            }
        )
        Wait(1)
    end

    lib.registerContext({
        id = 'modsMenu'..mod,
        menu = parentMenu,
        title = modTitle,
        options = options
    })

    lib.showContext('modsMenu'..mod)
end


local function openTurboMenu()
    local vehicle = cache.vehicle
    local enabled = getVehicleProperties(vehicle).modTurbo


    lib.registerContext({
        id = 'turboMenu',
        menu = mods.modTurbo.parent,
        title = mods.modTurbo.title,
        options = {
            {
                title = locale("turbo_enabled"),
                icon = mods.modTurbo.icon,
                iconColor = getVehicleColor(),
                disabled = enabled,
                onSelect = function()
                    lib.setVehicleProperties(vehicle, {modTurbo = true})

                    playSound('Zoom_In', 'DLC_HEIST_PLANNING_BOARD_SOUNDS')
                    openTurboMenu()
                end
            },
            {
                title = locale("turbo_disabled"),
                icon = mods.modTurbo.icon,
                iconColor = getVehicleColor(),
                disabled = not enabled,
                onSelect = function()
                    lib.setVehicleProperties(vehicle, {modTurbo = false})

                    playSound('Zoom_In', 'DLC_HEIST_PLANNING_BOARD_SOUNDS')
                    openTurboMenu()
                end
            },
        }
    })

    lib.showContext('turboMenu')
end

local function openUpgradeMenu()
    lib.registerContext({
        id = 'upgradeMenu',
        title = locale("upgrade_category_title"),
        menu = "tuningMenu",
        onExit = function ()
            lib.hideTextUI()
            
        end,
        options = {
            {
                title = locale("engine_title"),
                icon = mods.modEngine.icon or "gear",
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modEngine.modNum)),
                onSelect = function()
                    local vehicle = cache.vehicle

                    local mod = mods.modEngine.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
            {
                title = locale("brakes_title"),
                icon = mods.modBrakes.icon or 'b',
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modBrakes.modNum)),
                onSelect = function()
                    local vehicle = cache.vehicle

                    local mod = mods.modBrakes.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
            {
                title = locale("transmission_title"),
                icon = mods.modTransmission.icon or 'gear',
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modTransmission.modNum)),
                onSelect = function()
                    local vehicle = cache.vehicle

                    local mod = mods.modTransmission.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
            {
                title = locale("suspension_title"),
                icon = mods.modSuspension.icon or 'wrench',
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modSuspension.modNum)),
                onSelect = function()
                    local vehicle = cache.vehicle

                    local mod = mods.modSuspension.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
            {
                title = locale("armor_title"),
                icon = mods.modArmor.icon or 'shield',
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modArmor.modNum)),
                onSelect = function()
                    local vehicle = cache.vehicle

                    local mod = mods.modArmor.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
            {
                title = locale("turbo_title"),
                icon = mods.modTurbo.icon or 'gauge-high',
                iconColor = getVehicleColor(),
                description = "1",
                onSelect = function()
                    openTurboMenu()
                end,
            },
        }
    })

    lib.showContext('upgradeMenu')
end

-- RegisterCommand("prop", function (source, args, raw)
--     local ve = getVehicleProperties(cache.vehicle)
--     print(json.encode(ve, {indent = true}))
--     print(ve.tyreSmokeColor[1])
--     print(ve.tyreSmokeColor[2])
--     print(ve.tyreSmokeColor[3])
-- end)

local function openPearlescentMenu()
    local options = {}
    local vehicle = cache.vehicle
    local colors = colors.pearlescent

    for i = 1, #colors, 1 do
        table.insert(options,
            {
                title = colors[i].category,
                icon = 'paint-roller',
                iconColor = colors[i].color,
                onSelect = function()
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                    local options = {}

                    for j = 1, #colors[i].colors do 
                        local disabled = false

                        if getVehicleProperties(vehicle).pearlescentColor == colors[i].colors[j].index then
                            disabled = true
                        end

                        table.insert(options,
                            {
                                title = colors[i].colors[j].label,
                                icon = 'droplet',
                                iconColor = colors[i].colors[j].iconColor,
                                disabled = disabled,
                                onSelect = function()
                                    lib.setVehicleProperties(vehicle, {pearlescentColor = colors[i].colors[j].index})
                                    openPearlescentMenu()
                                    playSound('Zoom_In', 'DLC_HEIST_PLANNING_BOARD_SOUNDS')
                                end
                                
                            }
                        )
                    end

                    lib.registerContext({
                        id = colors[i].category,
                        title = colors[i].category,
                        menu = "pearlescentColor",
                        onExit = function ()
                            lib.hideTextUI()
                        end,
                        options = options
                    })
                
                    lib.showContext(colors[i].category)
                end,
            }
        )
    end

    lib.registerContext({
        id = 'pearlescentColor',
        title = locale("pearlescent_color_title"),
        menu = "colorMenu",
        onExit = function ()
            lib.hideTextUI()
        end,
        options = options
    })

    lib.showContext('pearlescentColor')
end

local function openXenonMenu()
    local options = {}
    local vehicle = cache.vehicle
    local colors = colors.xenon

    for i = 1, #colors, 1 do
        local disabled = false

        local currentXenon = getVehicleProperties(vehicle).xenonColor

        if currentXenon == 255 and getVehicleProperties(cache.vehicle).modXenon then currentXenon = -1 end

        if currentXenon == colors[i].index then
            disabled = true
        end

        table.insert(options,
            {
                title = colors[i].label,
                icon = 'lightbulb',
                iconColor = colors[i].iconColor,
                disabled = disabled,
                onSelect = function()
                    lib.setVehicleProperties(vehicle, {modXenon = true})
                    lib.setVehicleProperties(vehicle, {xenonColor = colors[i].index})
                    openXenonMenu()
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            }
        )
        
        if i == #colors then
            table.insert(options,
                {
                    title = locale("disable_xenon"),
                    icon = 'lightbulb',
                    iconColor = "#fff",
                    disabled = not getVehicleProperties(cache.vehicle).modXenon,
                    onSelect = function()
                        lib.setVehicleProperties(vehicle, {modXenon = false})
                        lib.setVehicleProperties(vehicle, {xenonColor = -1})

                        openXenonMenu()
                        playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                    end,
                }
            )
        end
    end

    lib.registerContext({
        id = 'xenonLights',
        title = locale("xenon_title"),
        menu = "cosmeticsMenu",
        onBack = function ()
        end,
        onExit = function ()
            lib.hideTextUI()
        end,
        options = options
    })

    lib.showContext('xenonLights')
end

local function openColorMenu()
    lib.registerContext({
        id = 'colorMenu',
        title = locale("color_title"),
        menu = "cosmeticsMenu",
        onBack = function ()
            
        end,
        onExit = function ()
            lib.hideTextUI()
            
        end,
        options = {
            {
                title = locale("primary_color_title"),
                icon = 'droplet',
                iconColor = "rgba(132, 0, 247, 1.0)",
                onSelect = function()   
                    local input = lib.inputDialog(locale("select_color"), {
                        {type = 'color', label = locale("color_input"), format = "rgb"},
                        {type = 'select', label = locale("color_type"), default = "0", clearable = true, options =  {
                            {value = "0", label = locale("color_type_normal")},
                            {value = "1", label = locale("color_type_metalic")},
                            {value = "2", label = locale("color_type_pearl")},
                            {value = "3", label = locale("color_type_matte")},
                            {value = "4", label = locale("color_type_metal")},
                            {value = "5", label = locale("color_type_chrome")},
                        }},
                    })

                    if not input then openColorMenu() return end

                    local color = input[1]  or "rgb(255,255,255)"
                    local type = tonumber(input[2])

                    local vehicle = cache.vehicle

                    local r, g, b = string.match(color, "rgb%((%d+), (%d+), (%d+)%)")
                    r = tonumber(r)
                    g = tonumber(g)
                    b = tonumber(b)

                    playSound('Zoom_In', 'DLC_HEIST_PLANNING_BOARD_SOUNDS')


                    lib.setVehicleProperties(vehicle, {color1 = {r,g,b}})
                    SetVehicleModColor_1(vehicle, type, 0)
                    openColorMenu()
                    lib.hideTextUI()
                    showVehicleStats()
                end,
            },
            {
                title = locale("secondary_color_title"),
                icon = 'droplet',
                iconColor = "rgba(244, 196, 48, 1.0)",
                onSelect = function()   
                    local input = lib.inputDialog(locale("select_color"), {
                        {type = 'color', label = locale("color_input"), format = "rgb"},
                        {type = 'select', label = locale("color_type"), default = "0", clearable = true, options =  {
                            {value = "0", label = locale("color_type_normal")},
                            {value = "1", label = locale("color_type_metalic")},
                            {value = "2", label = locale("color_type_pearl")},
                            {value = "3", label = locale("color_type_matte")},
                            {value = "4", label = locale("color_type_metal")},
                            {value = "5", label = locale("color_type_chrome")},
                        }},
                    })


                    if not input then openColorMenu() return end

                    local color = input[1] or "rgb(255,255,255)"
                    local type = tonumber(input[2])

                    local vehicle = cache.vehicle

                    local r, g, b = string.match(color, "rgb%((%d+), (%d+), (%d+)%)")
                    r = tonumber(r)
                    g = tonumber(g)
                    b = tonumber(b)

                    lib.setVehicleProperties(vehicle, {color2 = {r,g,b}})
                    SetVehicleModColor_2(vehicle, type, 0)
                    openColorMenu()
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')

                end,
            },
            {
                title = locale("pearlescent_color_title"),
                icon = 'droplet',
                iconColor = "rgba(236, 88, 0, 1.0)",
                onSelect = function()   
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                    openPearlescentMenu()
                end,
            },
        }
    })

    lib.showContext('colorMenu')
end


local function bodyPartsMenu()
    lib.registerContext({
        id = 'bodyPartsMenu',
        title = locale("cosmetics_title"),
        menu = "cosmeticsMenu",
        onBack = function ()
            
        end,
        onExit = function ()
            lib.hideTextUI()
            
        end,
        options = {
            {
                title = locale("spoiler_title"),
                icon = mods.modSpoilers.icon or 'wind',
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modSpoilers.modNum)),
                onSelect = function()   
                    local vehicle = cache.vehicle

                    local mod = mods.modSpoilers.modNum

                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
            {
                title = locale("front_bumper_title"),
                icon = mods.modFrontBumper.icon or 'car-rear',
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modFrontBumper.modNum)),
                onSelect = function()   
                    local vehicle = cache.vehicle

                    local mod = mods.modFrontBumper.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
            {
                title = locale("rear_bumper_title"),
                icon = mods.modRearBumper.icon or 'car-rear',
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modRearBumper.modNum)),
                onSelect = function()
                    local vehicle = cache.vehicle

                    local mod = mods.modRearBumper.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
            {
                title = locale("side_skirt_title"),
                icon = mods.modSideSkirt.icon or 'car-side',
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modSideSkirt.modNum)),
                onSelect = function()   
                    local vehicle = cache.vehicle

                    local mod = mods.modSideSkirt.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
            {
                title = locale("exhaust_title"),
                icon = mods.modExhaust.icon or 'car',
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modExhaust.modNum)),
                onSelect = function()   
                    local vehicle = cache.vehicle

                    local mod = mods.modExhaust.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
            {
                title = locale("cage_title"),
                icon = mods.modFrame.icon or 'car',
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modFrame.modNum)),
                onSelect = function()   
                    local vehicle = cache.vehicle

                    local mod = mods.modFrame.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
            {
                title = locale("grille_title"),
                icon = mods.modGrille.icon or 'car',
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modGrille.modNum)),
                onSelect = function()   
                    local vehicle = cache.vehicle

                    local mod = mods.modGrille.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
            {
                title = locale("hood_title"),
                icon = mods.modHood.icon or 'car',
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modHood.modNum)),
                onSelect = function()   
                    local vehicle = cache.vehicle

                    local mod = mods.modHood.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
            {
                title = locale("left_fender_title"),
                icon = mods.modFender.icon or 'car-side',
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modFender.modNum)),
                onSelect = function()   
                    local vehicle = cache.vehicle

                    local mod = mods.modFender.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
            {
                title = locale("right_fender_title"),
                icon = mods.modRightFender.icon or 'car-side',
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modRightFender.modNum)),
                onSelect = function()   
                    local vehicle = cache.vehicle

                    local mod = mods.modRightFender.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
            {
                title = locale("roof_title"),
                icon = mods.modRoof.icon or 'car',
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modRoof.modNum)),
                onSelect = function()   
                    local vehicle = cache.vehicle

                    local mod = mods.modRoof.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
        }
    })

    lib.showContext('bodyPartsMenu')
end



local function windowTintMenu()
    lib.registerContext({
        id = 'windowTint',
        title = locale("window_tint_title"),
        menu = "cosmeticsMenu",
        onBack = function ()
            
        end,
        onExit = function ()
            lib.hideTextUI()
            
        end,
        options = {
            {
                title = locale("tint_pure_black"),
                icon = 'paint-roller',
                iconColor = getVehicleColor(),
                onSelect = function()
                    local mod = 1

                    local vehicle = cache.vehicle 

                    lib.setVehicleProperties(vehicle, {windowTint = mod})

                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                    windowTintMenu()
                end,
            },
            {
                title = locale("tint_darksmoke"),
                icon = 'lightbulb',
                iconColor = getVehicleColor(),
                onSelect = function()
                    local mod = 2

                    local vehicle = cache.vehicle 

                    lib.setVehicleProperties(vehicle, {windowTint = mod})

                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                    windowTintMenu()
                end,
            },
            {
                title = locale("tint_lightsmoke"),
                icon = 'lightbulb',
                iconColor = getVehicleColor(),
                onSelect = function()
                    local mod = 3

                    local vehicle = cache.vehicle 

                    lib.setVehicleProperties(vehicle, {windowTint = mod})


                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                    windowTintMenu()
                end,
            },
            {
                title = locale("tint_limo"),
                icon = 'bullhorn',
                iconColor = getVehicleColor(),
                onSelect = function()   
                    local mod = 4

                    local vehicle = cache.vehicle 

                    lib.setVehicleProperties(vehicle, {windowTint = mod})


                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                    windowTintMenu()
                end,
            },
            {
                title = locale("tint_green"),
                icon = 'bullhorn',
                iconColor = getVehicleColor(),
                onSelect = function()   
                    local mod = 5

                    local vehicle = cache.vehicle 

                    lib.setVehicleProperties(vehicle, {windowTint = mod})


                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                    windowTintMenu()
                end,
            },
        }
    })
    
    lib.showContext('windowTint')
end

local function platesColorMenu()
    lib.registerContext({
        id = 'platesColorMenu',
        title = locale("plate_color_title"),
        menu = "cosmeticsMenu",
        onExit = function ()
            lib.hideTextUI()
            
        end,
        options = {
            {
                title = plate("plate_blue_on_white1"),
                icon = mods.plateIndex.icon,
                iconColor = getVehicleColor(),
                onSelect = function()
                    local mod = 0

                    local vehicle = cache.vehicle


                    local properties = {}
                    properties[mods.plateIndex.modNum] = mod
                    
                    lib.setVehicleProperties(vehicle, properties)

                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                    platesColorMenu()
                end,
            },
            {
                title = locale("plate_yellow_black"),
                icon = mods.plateIndex.icon,
                iconColor = getVehicleColor(),
                onSelect = function()
                    local mod = 1

                    local vehicle = cache.vehicle

                    local properties = {}
                    properties[mods.plateIndex.modNum] = mod
                    
                    lib.setVehicleProperties(vehicle, properties)

                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                    platesColorMenu()
                end,
            },
            {
                title = locale("plate_yellow_blue"),
                icon = mods.plateIndex.icon,
                iconColor = getVehicleColor(),
                onSelect = function()
                    local mod = 2

                    local vehicle = cache.vehicle

                    local properties = {}
                    properties[mods.plateIndex.modNum] = mod
                    
                    lib.setVehicleProperties(vehicle, properties)

                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                    platesColorMenu()
                end,
            },
            {
                title = plate("plate_blue_on_white2"),
                icon = mods.plateIndex.icon,
                iconColor = getVehicleColor(),
                onSelect = function()
                    local mod = 3

                    local vehicle = cache.vehicle

                    local properties = {}
                    properties[mods.plateIndex.modNum] = mod
                    
                    lib.setVehicleProperties(vehicle, properties)

                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                    platesColorMenu()
                end,
            },
            {
                title = plate("plate_blue_on_white3"),
                icon = mods.plateIndex.icon,
                iconColor = getVehicleColor(),
                onSelect = function()
                    local mod = 4

                    local vehicle = cache.vehicle

                    local properties = {}
                    properties[mods.plateIndex.modNum] = mod
                    
                    lib.setVehicleProperties(vehicle, properties)

                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                    platesColorMenu()
                end,
            },
        }
    })

    lib.showContext('platesColorMenu')
end


local function wheelColors()
    local options = {}
    local vehicle = cache.vehicle
    local colors = colors.pearlescent

    for i = 1, #colors, 1 do
        table.insert(options,
            {
                title = colors[i].category,
                icon = 'paint-roller',
                iconColor = colors[i].color,
                onSelect = function()

                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                    local options = {}

                    for j = 1, #colors[i].colors do 
                        local disabled = false

                        if getVehicleProperties(vehicle).wheelColor == colors[i].colors[j].index then
                            disabled = true
                        end

                        table.insert(options,
                            {
                                title = colors[i].colors[j].label,
                                icon = 'droplet',
                                iconColor = colors[i].colors[j].iconColor,
                                disabled = disabled,
                                onSelect = function()
                                    lib.setVehicleProperties(vehicle, {wheelColor = colors[i].colors[j].index})

                                    playSound('Zoom_In', 'DLC_HEIST_PLANNING_BOARD_SOUNDS')
                                    wheelColors()
                                end
                                
                            }
                        )
                    end

                    lib.registerContext({
                        id = colors[i].category,
                        title = colors[i].category,
                        menu = "wheelColorCategory",
                        onExit = function ()
                            lib.hideTextUI()
                        end,
                        options = options
                    })
                
                    lib.showContext(colors[i].category)
                end,
            }
        )
    end

    lib.registerContext({
        id = 'wheelColorCategory',
        title = locale("wheel_color_title"),
        menu = "cosmeticsMenu",
        onExit = function ()
            lib.hideTextUI()
            
        end,
        options = options
    })
    lib.showContext('wheelColorCategory')

end

local function openWheelsCategory()
    lib.registerContext({
        id = 'wheelsCategory',
        title = locale("wheel_type_title"),
        menu = "wheelsMenu",
        onExit = function ()
            lib.hideTextUI()
            
        end,
        options = {
            {
                title = locale("wheel_type_sport"),
                icon = "dharmachakra",
                iconColor = getVehicleColor(),
                onSelect = function ()
                    local vehicle = cache.vehicle
                    lib.setVehicleProperties(vehicle, {wheels = 5})

                    local mod = mods.modFrontWheel0.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')

                end
            },
            {
                title = locale("wheel_type_muscle"),
                icon = "dharmachakra",
                iconColor = getVehicleColor(),
                onSelect = function ()
                    local vehicle = cache.vehicle
                    lib.setVehicleProperties(vehicle, {wheels = 1})

                    local mod = mods.modFrontWheel1.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end
            },
            {
                title = locale("wheel_type_lowrider"),
                icon = "dharmachakra",
                iconColor = getVehicleColor(),
                onSelect = function ()
                    local vehicle = cache.vehicle
                    lib.setVehicleProperties(vehicle, {wheels = 2})

                    local mod = mods.modFrontWheel2.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end
            },
            {
                title = locale("wheel_type_suv"),
                icon = "dharmachakra",
                iconColor = getVehicleColor(),
                onSelect = function ()
                    local vehicle = cache.vehicle
                    lib.setVehicleProperties(vehicle, {wheels = 3})

                    local mod = mods.modFrontWheel3.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end
            },
            {
                title = locale("wheel_type_offroad"),
                icon = "dharmachakra",
                iconColor = getVehicleColor(),
                onSelect = function ()
                    local vehicle = cache.vehicle
                    lib.setVehicleProperties(vehicle, {wheels = 4})

                    local mod = mods.modFrontWheel4.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end
            },
            {
                title = locale("wheel_type_tuner"),
                icon = "dharmachakra",
                iconColor = getVehicleColor(),
                onSelect = function ()
                    local vehicle = cache.vehicle
                    lib.setVehicleProperties(vehicle, {wheels = 5})

                    local mod = mods.modFrontWheel5.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')

                end
            },
            {
                title = locale("wheel_type_bike"),
                icon = "dharmachakra",
                iconColor = getVehicleColor(),
                onSelect = function ()
                    local vehicle = cache.vehicle
                    
                    lib.setVehicleProperties(vehicle, {wheels = 6})

                    local mod = mods.modFrontWheel6.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end
            },
            {
                title = locale("wheel_type_highend"),
                icon = "dharmachakra",
                iconColor = getVehicleColor(),
                onSelect = function ()
                    local vehicle = cache.vehicle
                    lib.setVehicleProperties(vehicle, {wheels = 7})

                    local mod = mods.modFrontWheel7.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end
            },
        }
    })
    lib.showContext('wheelsCategory')

end

local function openWheelsMenu()
    lib.registerContext({
        id = 'wheelsMenu',
        title = locale("wheel_menu_title"),
        menu = "cosmeticsMenu",
        onBack = function ()
            
        end,
        onExit = function ()
            lib.hideTextUI()
            
        end,
        options = {
            {
                title = locale("wheel_color_title"),
                icon = "brush",
                iconColor = getVehicleColor(),
                onSelect = function ()
                    wheelColors()
                end
            },
            {
                title = locale("wheel_smoke_title"),
                icon = "cloud",
                iconColor = getVehicleColor(),
                onSelect = function ()
                    local input = lib.inputDialog('Select Color', {
                        {type = 'color', label = 'Colour input', format = "rgb"},
                    })

                    if not input then openColorMenu() return end

                    local color = input[1] or "rgb(255,255,255)"

                    local vehicle = cache.vehicle

                    local r, g, b = string.match(color, "rgb%((%d+), (%d+), (%d+)%)")
                    r = tonumber(r)
                    g = tonumber(g)
                    b = tonumber(b)

                    playSound('Zoom_In', 'DLC_HEIST_PLANNING_BOARD_SOUNDS')

                    lib.setVehicleProperties(vehicle, {modSmokeEnabled = true})
                    lib.setVehicleProperties(vehicle, {tyreSmokeColor = {r,g,b}})
                    openWheelsMenu()
                end
            },
            {
                title = locale("wheel_type_title"),
                icon = "dharmachakra",
                iconColor = getVehicleColor(),
                onSelect = function ()
                    openWheelsCategory()
                end
            },
        }
    })

    lib.showContext('wheelsMenu')
end


local function openEstethicsMenu()
    lib.registerContext({
        id = 'cosmeticsMenu',
        title = locale("cosmetics_title"),
        menu = "tuningMenu",
        onExit = function ()
            lib.hideTextUI()
            
        end,
        options = {
            {
                title = locale("color_title"),
                icon = 'paint-roller',
                iconColor = getVehicleColor(),
                onSelect = function()   
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                    openColorMenu()
                end,
            },
            {
                title = locale("xenon_title"),
                icon = 'lightbulb',
                iconColor = getVehicleColor(),
                onSelect = function()
                    openXenonMenu()
                end,
            },
            {
                title = locale("neon_title"),
                icon = 'lightbulb',
                iconColor = getVehicleColor(),
                onSelect = function()
                    local input = lib.inputDialog(locale("select_color"), {
                        {type = 'color', label = locale("color_input"), format = "rgb"},
                    })

                    if not input then openColorMenu() return end

                    local color = input[1] or "rgb(255,255,255)"

                    local vehicle = cache.vehicle

                    local r, g, b = string.match(color, "rgb%((%d+), (%d+), (%d+)%)")
                    r = tonumber(r)
                    g = tonumber(g)
                    b = tonumber(b)

                    playSound('Zoom_In', 'DLC_HEIST_PLANNING_BOARD_SOUNDS')

                    lib.setVehicleProperties(vehicle, {neonEnabled = {true,true,true,true}})
                    lib.setVehicleProperties(vehicle, {neonColor = {r,g,b}})
                    openEstethicsMenu()
                end,
            },
            {
                title = locale("body_parts_title"),
                icon = 'lightbulb',
                iconColor = getVehicleColor(),
                onSelect = function()
                    bodyPartsMenu()
                end,
            },
            {
                title = locale("wheels_title"),
                icon = 'dharmachakra',
                iconColor = getVehicleColor(),
                onSelect = function()
                    openWheelsMenu()
                end,
            },
            {
                title = locale("window_tint_title"),
                icon = 'bullhorn',
                iconColor = getVehicleColor(),
                description = "5",
                onSelect = function()
                    windowTintMenu()
                end,
            },
            {
                title = locale("horn_title"),
                icon = mods.modHorns.icon or 'bullhorn',
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modHorns.modNum)),
                onSelect = function()   
                    local vehicle = cache.vehicle

                    local mod = mods.modHorns.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
            {
                title = locale("plates_title"),
                icon = 'credit-card',
                iconColor = getVehicleColor(),
                description = "5",
                onSelect = function()
                    platesColorMenu()
                end,
            },
            {
                title = locale("plate_holder_title"),
                icon = mods.modPlateHolder.icon or 'credit-card',
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modPlateHolder.modNum)),
                onSelect = function()
                    local vehicle = cache.vehicle

                    local mod = mods.modPlateHolder.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
            {
                title = locale("plate_vanity_title"),
                icon = mods.modVanityPlate.icon or 'credit-card',
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modVanityPlate.modNum)),
                onSelect = function()
                    local vehicle = cache.vehicle

                    local mod = mods.modVanityPlate.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
            {
                title = locale("interior_title"),
                icon = mods.modTrimA.icon or 'credit-card',
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modTrimA.modNum)),
                onSelect = function()
                    local vehicle = cache.vehicle

                    local mod = mods.modTrimA.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
            {
                title = locale("trim_title"),
                icon = mods.modOrnaments.icon or 'credit-card',
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modOrnaments.modNum)),
                onSelect = function()
                    local vehicle = cache.vehicle

                    local mod = mods.modOrnaments.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
            {
                title = locale("dashboard_title"),
                icon = mods.modDashboard.icon or 'credit-card',
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modDashboard.modNum)),
                onSelect = function()
                    local vehicle = cache.vehicle

                    local mod = mods.modDashboard.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
            {
                title = locale("speedometer_title"),
                icon = mods.modDial.icon or 'credit-card',
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modDial.modNum)),
                onSelect = function()
                    local vehicle = cache.vehicle

                    local mod = mods.modDial.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
            {
                title = locale("door_speakers_title"),
                icon = mods.modDoorSpeaker.icon or 'credit-card',
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modDoorSpeaker.modNum)),
                onSelect = function()
                    local vehicle = cache.vehicle

                    local mod = mods.modDoorSpeaker.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
            {
                title = locale("seats_title"),
                icon = mods.modSeats.icon or 'credit-card',
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modSeats.modNum)),
                onSelect = function()
                    local vehicle = cache.vehicle

                    local mod = mods.modSeats.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
            {
                title = locale("steering_wheel_title"),
                icon = mods.modSteeringWheel.icon or 'steering-wheel',
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modSteeringWheel.modNum)),
                onSelect = function()
                    local vehicle = cache.vehicle

                    local mod = mods.modSteeringWheel.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
            {
                title = locale("gears_title"),
                icon = mods.modShifterLeavers.icon or 'credit-card',
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modShifterLeavers.modNum)),
                onSelect = function()
                    local vehicle = cache.vehicle

                    local mod = mods.modShifterLeavers.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
            {
                title = locale("quarter_deck_title"),
                icon = mods.modAPlate.icon or 'credit-card',
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modAPlate.modNum)),
                onSelect = function()
                    local vehicle = cache.vehicle

                    local mod = mods.modAPlate.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
            {
                title = locale("speakers_title"),
                icon = mods.modSpeakers.icon or 'credit-card',
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modSpeakers.modNum)),
                onSelect = function()
                    local vehicle = cache.vehicle

                    local mod = mods.modSpeakers.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
            {
                title = locale("trunk_title"),
                icon = mods.modTrunk.icon or 'credit-card',
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modTrunk.modNum)),
                onSelect = function()
                    local vehicle = cache.vehicle

                    local mod = mods.modTrunk.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
            {
                title = locale("hydrolic_title"),
                icon = mods.modHydrolic.icon or 'credit-card',
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modHydrolic.modNum)),
                onSelect = function()
                    local vehicle = cache.vehicle

                    local mod = mods.modHydrolic.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
            {
                title = locale("engine_block_title"),
                icon = mods.modEngineBlock.icon or 'credit-card',
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modEngineBlock.modNum)),
                onSelect = function()
                    local vehicle = cache.vehicle

                    local mod = mods.modEngineBlock.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
            {
                title = locale("air_filter_title"),
                icon = mods.modAirFilter.icon or 'credit-card',
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modAirFilter.modNum)),
                onSelect = function()
                    local vehicle = cache.vehicle

                    local mod = mods.modAirFilter.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
            {
                title = locale("struts_title"),
                icon = mods.modStruts.icon or 'credit-card',
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modStruts.modNum)),
                onSelect = function()
                    local vehicle = cache.vehicle

                    local mod = mods.modStruts.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
            {
                title = locale("arch_cover"),
                icon = mods.modArchCover.icon or 'credit-card',
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modArchCover.modNum)),
                onSelect = function()
                    local vehicle = cache.vehicle

                    local mod = mods.modArchCover.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
            {
                title = locale("aerials_title"),
                icon = mods.modAerials.icon or 'credit-card',
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modAerials.modNum)),
                onSelect = function()
                    local vehicle = cache.vehicle

                    local mod = mods.modAerials.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
            {
                title = locale("wings_title"),
                icon = mods.modTrimB.icon or 'credit-card',
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modTrimB.modNum)),
                onSelect = function()
                    local vehicle = cache.vehicle

                    local mod = mods.modTrimB.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
            {
                title = locale("fuel_tank_title"),
                icon = mods.modTank.icon or 'credit-card',
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modTank.modNum)),
                onSelect = function()
                    local vehicle = cache.vehicle

                    local mod = mods.modTank.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
            {
                title = locale("windows_title"),
                icon = mods.modWindows.icon or 'credit-card',
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modWindows.modNum)),
                onSelect = function()
                    local vehicle = cache.vehicle

                    local mod = mods.modWindows.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
            {
                title = locale("livery_title"),
                icon = mods.modLivery.icon or 'credit-card',
                iconColor = getVehicleColor(),
                description = tostring(getVehicleModCounts(cache.vehicle, mods.modLivery.modNum)),
                onSelect = function()
                    local vehicle = cache.vehicle

                    local mod = mods.modLivery.modNum
                    local mods = getVehicleModCounts(vehicle, mod)

                    openModsMenu(vehicle, mod, mods)
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
        }
    })

    lib.showContext('cosmeticsMenu')
end

function openTuningMenu()
    lib.hideTextUI()
    lib.hideContext()
    lib.registerContext({
        id = 'tuningMenu',
        title = locale("tuning_menu_title"),
        onExit = function ()
            lib.hideTextUI()
        end,
        options = {
            {
                title = locale("cosmetics_title"),
                description = locale("description_cosmetics"),
                icon = 'door-open',
                onSelect = function()
                    openEstethicsMenu()
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
            {
                title = locale("upgrade_category_title"),
                description = locale("description_upgrades"),
                icon = 'wrench',
                onSelect = function()
                    openUpgradeMenu()
                    playSound('SELECT', 'HUD_FREEMODE_SOUNDSET')
                end,
            },
        }
    })

    lib.showContext('tuningMenu')
    showVehicleStats()
end


