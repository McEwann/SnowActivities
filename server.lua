RegisterCommand("snowman", function(source, args, rawCommand)
    
    CancelEvent()
    TriggerClientEvent('mcewan:buildit', source)
    Citizen.Wait(10000)
	TriggerClientEvent('mcewan:snowman', source)
    
    
end, false)

