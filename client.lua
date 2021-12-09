-- Clientside
local CanPlace = true
local plyPed = PlayerPedId()
local cooldowntime = 0

RegisterNetEvent('mcewan:snowman')
AddEventHandler('mcewan:snowman', function()
if cooldowntime == 0 then
	local hash = GetHashKey('prop_prlg_snowpile')
    RequestModel(hash)
    while not HasModelLoaded(hash) do Citizen.Wait(0) end
    local pos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 0.5, -1.0)
    object = CreateObject(hash, pos.x, pos.y, pos.z-0.2, true, false)
    ClearPedTasks(plyPed)
    cooldown()
    
end
end)

RegisterNetEvent("mcewan:buildit")
AddEventHandler("mcewan:buildit", function()

    if cooldowntime == 0 then
        TaskStartScenarioInPlace(plyPed, "CODE_HUMAN_MEDIC_TEND_TO_DEAD", -1, true)
    
    elseif cooldowntime > 0 then
        notification('~b~Hands are still too cold from the last Snowman you made!~w~')
    end
end)


function notification(msg)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(msg)
	DrawNotification(true, false)
end

function cooldown()
    cooldowntime = 300
        while cooldowntime > 0 do
            Citizen.Wait(1000)
            cooldowntime = cooldowntime - 1
            
            --Debug
            --print(cooldowntime)
        end
    cooldowntime = 0
end



--notification('~b~Hands are still to cold from the last Snowman you made!~w~')

