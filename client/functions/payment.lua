lib.locale()

function confirmPayment(vehiclePlate)
    if not cart[1] then return end

    local cost = 0
    local modListMsg = ""
    modListMsg = ("------ **%s** ------\n"):format(vehiclePlate)
    for k, v in ipairs(cart) do
        local modPrice = tonumber(v.modPrice)
        cost = cost + modPrice
        modListMsg = ("- %s  %s **%s** $\n"):format(v.modLabel, v.modLevel, modPrice)
    end

    modListMsg = ("%s\n Total: **%s** $"):format(modListMsg, cost)

    local confirmation = lib.alertDialog({
        header = locale("confirm_payment_dialog_title"),
        content = modListMsg,
        centered = false,
        cancel = true
    })

    if confirmation == "confirm" then
        local hasMoney = lib.callback.await('ars_tuning:hasMoney', false, cost)

        if not hasMoney then
            lib.setVehicleProperties(cache.vehicle, currentVehProperties.old)

            cart = {}

            showNotification(locale("no_money"))
            return
        end

        lib.setVehicleProperties(cache.vehicle, currentVehProperties.new)
        TriggerServerEvent("ars_tuning:payMods", cost, currentVehProperties.new, modListMsg)
        cart = {}
        return
    end

    lib.setVehicleProperties(cache.vehicle, currentVehProperties.old)
    cart = {}
end
