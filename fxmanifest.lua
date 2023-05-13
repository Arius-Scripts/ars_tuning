--#--
--Fx info--
--#--
fx_version "cerulean"
use_fxv2_oal "yes"
lua54 "yes"
game "gta5"
version "1.0.0"

--#--
--Manifest--
--#--
client_scripts {
    "client/functions/utils.lua",
    "client/functions/payment.lua",
    "client/functions/menu.lua",
    "client/bridge/*.lua",
    "client/client.lua"
}

server_scripts {
    "server/*.lua"
}

shared_scripts {
    "@ox_lib/init.lua",
}

files {
    "config.lua",
    "client/vehicle/modList.lua",
    "client/vehicle/colorList.lua",
    "locales/*.json"
}
