CreateThread(function()
    Wait(1000)
    local hasRun = false
    while true do
        Wait(0)
        local iPed = PlayerPedId()
        if IsEntityDead(iPed) then
            if not hasRun then
                print("Player is dead, starting death handling logic...")
                hasRun = true
                local cause = GetPedCauseOfDeath(iPed)
                local DeathCause = ClientTables.deatCause[cause]
                local coords = GetEntityCoords(iPed, true)
                local streetHash, crossingHash = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
                local streetName = GetStreetNameFromHashKey(streetHash)
                local crossingName = GetStreetNameFromHashKey(crossingHash)
                local DeathLocation = streetName
                if crossingName ~= "" then
                    DeathLocation = DeathLocation .. " at " .. crossingName
                end

                TriggerServerEvent('zrulx:playerDied', { ['death_cause'] = DeathCause and DeathCause[1] or "Unknown", ['death_location'] = DeathLocation })

                Wait(1000)
            end
        else
            Wait(500)
            hasRun = false
        end
    end
end)
