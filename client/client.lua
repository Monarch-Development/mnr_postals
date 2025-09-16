local config = lib.load('config.config')
local postals = lib.load(config.path)

RegisterNetEvent('mnr_postals:client:SetWaypoint', function(code)
    local postal = postals[code]
    if not postal then
        lib.notify({ description = locale('not_found'):format(code), position = 'top', type = 'error' })
        return
    end

    SetNewWaypoint(postal.x, postal.y)
    lib.notify({ description = locale('set_success'):format(code), position = 'top', type = 'success' })
end)

---@description The section below is for HUD integrations to obtain nearest postal and display it
if not config.exportMode then return end

for code, coords in pairs(postals) do
    lib.grid.addEntry({
        coords = coords,
        radius = 300,
        postal = code,
    })
end

local function isPostal(entry)
    return entry.postal ~= nil
end

---@param coords? (vector3 | vector2) coords whre to search for the nearest postal code
---@return number nearest postal code
local function getNearestPostal(coords)
    if not coords then
        coords = GetEntityCoords(cache.ped)
    end

    local point = vec2(coords.x, coords.y)

    local entries = lib.grid.getNearbyEntries(point, isPostal)

    local nearest, minDist = 0, math.huge

    for _, entry in ipairs(entries) do
        local dist = #(point - vec2(entry.coords.x, entry.coords.y))
        if dist < minDist then
            minDist = dist
            nearest = entry.postal
        end
    end

    return nearest
end

exports('getNearestPostal', getNearestPostal)