fx_version "cerulean"
game "gta5"
lua54 "yes"

name "mnr_postals"
description "Allows players to set a waypoint to specific postal with a command"
author "IlMelons"
version "1.0.0"
repository "https://github.com/Monarch-Development/mnr_postals"

ox_lib "locale"

shared_scripts {
    "@ox_lib/init.lua",
}

server_scripts {
    "server/*.lua",
}

client_scripts {
    "client/*.lua",
}

files {
    "config/config.lua",
    "data/*.lua",
    "locales/*.json",
}