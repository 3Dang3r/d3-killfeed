local Config = {
    Position = "center-right"
}

Citizen.CreateThread(function()
    Wait(1000)
    SendNUIMessage({ action = "setPosition", position = Config.Position })
    SendNUIMessage({ action = "toggle", show = true })
end)


RegisterCommand("testkillfeed", function()
    TriggerServerEvent("killfeed:reportKill", "Dang3r", "Player")
    TriggerServerEvent("killfeed:reportKill", "Player", "Dang3r")
    Wait(2000)
    TriggerServerEvent("killfeed:reportKill", "Dang3r", "Dang3r")
end, false)

RegisterNetEvent("killfeed:showKill", function(killer, victim)
    local isSuicide = killer == victim
    SendNUIMessage({
        action = "addKill",
        data = {
            killer = killer,
            victim = victim,
            suicide = isSuicide
        }
    })
end)


AddEventHandler('playerDied', function(killerId, weaponHash)
    local victimName = GetPlayerName(PlayerId())
    local killerName = "Unknown"

    if killerId ~= nil and killerId ~= -1 and killerId ~= PlayerId() then
        killerName = GetPlayerName(killerId)
        TriggerServerEvent("killfeed:reportKill", killerName, victimName)
    else
        -- Suicide
        TriggerServerEvent("killfeed:reportKill", victimName, victimName)
    end
end)
