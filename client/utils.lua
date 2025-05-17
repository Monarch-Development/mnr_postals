---@diagnostic disable lowercase-global

utils = {}

function utils.Notify(msg, type)
    lib.notify({
        description = msg,
        position = "top",
        type = type or "inform",
    })
end