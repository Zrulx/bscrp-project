RegisterServerEvent('zrulx:playerDied')
AddEventHandler('zrulx:playerDied', function(data)
    local discordId = GetPlayerIdentifierByType(source, 'discord'):gsub("discord:", "")
    print("Server received player death event")
    PerformHttpRequest('http://localhost:5000/send_news', function(err, text, headers) 
        if err == 200 then
            print("Successfully sent death log to Discord.")
        else
            print("Failed to send death log. Error code: ", err)
        end
    end, 'POST', json.encode({
        discord_id = discordId,
        death_cause = data.death_cause,
        death_location = data.death_location
    }), { ['Content-Type'] = 'application/json' })
end)

function updateStatus(isStarting)
    PerformHttpRequest('http://localhost:5000/update_status', function(err, text, headers)
        if err == 200 then
            print("Successfully updated status.")
        else
            print("Failed to update status. Error code: ", err)
        end
    end, 'POST', json.encode({
        status = isStarting
    }), { ['Content-Type'] = 'application/json' })
end

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return  
    end
    updateStatus(true)
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    updateStatus(false)
end)
