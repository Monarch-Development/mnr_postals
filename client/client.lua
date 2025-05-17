local Config = require "config.config"
local postal = lib.load(Config.PostalFilePath)

RegisterNetEvent("mnr_postals:client:SetWaypoint", function(selectedPostal)
    local userPostal = string.upper(selectedPostal)
    local setPostal = postal[userPostal]
    if not setPostal then
        utils.Notify(locale("not-found"):format(userPostal), "error")
    else
        if IsWaypointActive() then
            DeleteWaypoint()
        end
        SetNewWaypoint(setPostal.x, setPostal.y)
        utils.Notify(locale("set-success"):format(userPostal), "success")
    end
end)