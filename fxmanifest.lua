--#--
--Fx info--
--#--
fx_version "cerulean"
use_fxv2_oal "yes"
lua54 "yes"
game "gta5"
version "1.0.2"

--#--
--Manifest--
--#--
client_scripts {
    "client/functions/utils.lua",
    "client/functions/payment.lua",
    "client/functions/menu.lua",
    "client/bridge/esx.lua",
    "client/bridge/ox.lua",
    "client/bridge/qb.lua",
    "client/bridge/custom.lua",
    "client/client.lua"
}

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "server/server.lua",
    "server/bridge/esx.lua",
    "server/bridge/ox.lua",
    "server/bridge/qb.lua",
    "server/bridge/custom.lua",
}

shared_scripts {
    "@ox_lib/init.lua",
}

files {
    "config.lua",
    "client/vehicle/vehicles.lua",
    "client/vehicle/modList.lua",
    "client/vehicle/colorList.lua",
    "locales/*.json"
}
