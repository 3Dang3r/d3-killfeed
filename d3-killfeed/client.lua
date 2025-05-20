local Config = {
    Position = "center-right" -- options: top-left, top-right, bottom-left, bottom-right, center-left, center-right
}

Citizen.CreateThread(function()
    Citizen.Wait(1000)

    SendNUIMessage({
        action = "setPosition",
        position = Config.Position
    })

    SendNUIMessage({
        action = "toggle",
        show = true
    })
end)

RegisterCommand("testkillfeed", function()
    TriggerServerEvent("killfeed:reportKill", "Dang3r", "Player")
    TriggerServerEvent("killfeed:reportKill", "Player", "Dang3r")
    Citizen.Wait(2000)
    TriggerServerEvent("killfeed:reportKill", "Dang3r", "Dang3r") -- Suicide Test
end, false)

RegisterNetEvent("killfeed:showKill")
AddEventHandler("killfeed:showKill", function(killer, victim)
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

AddEventHandler('gameEventTriggered', function(name, args)
    if name == 'CEventNetworkEntityDamage' then
        local victim = args[1]
        local attacker = args[2]

        if not IsEntityAPed(victim) or not IsEntityAPed(attacker) then return end
        if not IsPedAPlayer(victim) then return end

        local victimId = NetworkGetPlayerIndexFromPed(victim)
        local attackerId = NetworkGetPlayerIndexFromPed(attacker)

        if victimId == -1 then return end

        local victimName = (GetPlayerFromServerId(GetPlayerServerId(victimId)) ~= -1) and GetPlayerName(victimId) or "Unknown"

        if attackerId == -1 or victimId == attackerId then
            -- Suicide
            TriggerServerEvent("killfeed:reportKill", victimName, victimName)
        else
            -- Player kill
            local killerName = (GetPlayerFromServerId(GetPlayerServerId(attackerId)) ~= -1) and GetPlayerName(attackerId) or "Unknown"
            TriggerServerEvent("killfeed:reportKill", killerName, victimName)
        end
    end
end)
