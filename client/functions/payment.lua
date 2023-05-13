function confirmPayment()
    if not cart[1] then return end



    print(json.encode(cart, { indent = true }))

    local confirmation = lib.alertDialog({
        header = 'Payment confirmation',
        content = 'Conferm the payment',
        centered = false,
        cancel = true
    })

    if confirmation == "confirm" then
        cart = {}
        lib.setVehicleProperties(cache.vehicle, currentVehProperties.new)
        return
    end

    lib.setVehicleProperties(cache.vehicle, currentVehProperties.old)
    cart = {}
end
