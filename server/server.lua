local config = lib.load("config.config")

lib.addCommand(config.command, {
    help = locale("help-command"),
    params = {
        {
            name = "postal",
            type = "number",
            help = locale("help-param"),
        },
    },
    restricted = false
}, function(source, args, raw)
    local postalcode = args.postal
    if postalcode then
        TriggerClientEvent("mnr_postals:client:SetWaypoint", source, postalcode)
    end
end)