function confirmPayment()
    if not cart[1] then return end
    print(json.encode(cart, { indent = true }))

    local confirmation = lib.alertDialog({
        header = 'Payment confirmation',
        content = 'Conferm the payment',
        centered = false,
        cancel = true
    })

    local cost = 1000

    if confirmation == "confirm" then
        local hasMoney = lib.callback.await('ars_tuning:hasMoney', false, cost)

        if not hasMoney then
            lib.setVehicleProperties(cache.vehicle, currentVehProperties.old)
            cart = {}
            return
        end

        cart = {}
        lib.setVehicleProperties(cache.vehicle, currentVehProperties.new)
        TriggerServerEvent("ars_tuning:payMods", cost)
        return
    end

    lib.setVehicleProperties(cache.vehicle, currentVehProperties.old)
    cart = {}
end
