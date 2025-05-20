RegisterNetEvent('killfeed:reportKill')
AddEventHandler('killfeed:reportKill', function(killer, victim)
    TriggerClientEvent('killfeed:showKill', -1, killer, victim)
end)