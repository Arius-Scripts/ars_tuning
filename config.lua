Config = {}

Config.Prices = {
    cosmetics = 250,
    colors = 50,
    engine = {
        0,
        2000,
        4000,
        6000,
    },
    breaks = {
        0,
        300,
        600
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
    },
    -- {
    --     job = false, -- false if you dont want to use the job
    --     pos = vector3(-211.4554, -1323.0739, 30.8904),
    --     blip = {
    --         enable = true,
    --         name   = "Bennys Tuning",
    --         type   = 566,
    --         scale  = 0.8,
    --         color  = 5,
    --     },
    -- },
}



return Config
