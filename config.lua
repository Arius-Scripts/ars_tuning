Config = {}

Config.Prices = {
    cosmetics = 250,
    colors = 50,
    engine = {
        [1] = 0,
        [2] = 2000,
        [3] = 4000,
        [4] = 6000,
    },
    breaks = {
        [1] = 0,
        [2] = 300,
        [3] = 600
    }

}

Config.WorkShops = {
    {
        job = "lsc", -- false if you dont want to use the job
        pos = vector3(-211.4554, -1323.0739, 30.8904),
        blip = {
            enable = true,
            name   = "Bennys Tuning",
            type   = 566,
            scale  = 0.8,
            color  = 5,
        },
    }
}



return Config
