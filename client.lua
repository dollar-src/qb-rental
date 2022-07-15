
local QBCore = exports['qb-core']:GetCoreObject()

cd = Config.Cooldown

local rentad = false


RegisterNetEvent("carrentmenu:open", function()
    local g = {
        {
            header = "Rent Menu",
            isMenuHeader = true,
        }
    }
    for k, v in pairs(Config.carlist) do
        g[#g+1] = {
            header = v.label,
            txt = v.label .. ' ' .. " Price: ".."$".." " .. v.price .. "".. " " ,
            params = {
                isServer = false,   
                event = "ASDASD",
                args = {
                    label = v.label,
                    model = v.model,
                    price = v.price
                }
            }
        }
    end
    g[#g+1] = {
        header = "⬅ Go Back",
    }
    exports['qb-menu']:openMenu(g)
end)



RegisterNetEvent('rentmenunpc', function()

    if rentad == true then

     QBCore.Functions.Notify('You have already rented a car', 'error', 3500)

    else

        TriggerEvent('carrentmenu:open')

    end
end)



RegisterNetEvent('ASDASD', function(data)
    local model = data.model
    local price = data.price
    QBCore.Functions.TriggerCallback('checkbankmoney', function(cb)
        if cb < price then
       
          QBCore.Functions.Notify('You dont have enough money.', 'error', 3500)

        else
          
            TriggerServerEvent('buyvehicle:server', price)
            QBCore.Functions.Notify('You rented a car '..' $'..price, 'success', 3500)


    
    rentad = true

 

     
    rentaltimestarted = true

    local ped = PlayerPedId()

if rentaltimestarted then 

    vehiclehash = data.model
    RequestModel(vehiclehash)
    while not HasModelLoaded(vehiclehash) do
       Wait(10)
     end

     local vehicle = CreateVehicle(vehiclehash, vector3(Config.Coords.x,Config.Coords.y, Config.Coords.z),Config.Coords.h, true, false)
     TaskWarpPedIntoVehicle(ped, vehicle, -1)
     SetModelAsNoLongerNeeded(vehicle)

    while (cd ~= 0) do 

        Wait( 1000 ) 
        local seat = IsPedInVehicle(ped,vehicle,false)
        if seat == 1  then

     
        cd = cd - 1
      
        exports['drawtext']:showUI('Expires in '..cd..' '..'Seconds '.. ' '..'[F9]')
   
        Citizen.CreateThread(function()

    
            local wait = true
        
        
            while wait  and rentad do
                Citizen.Wait(0)
                if IsControlJustReleased(0, Config.Keybind) then
                    DeleteVehicle(vehicle,true)
                    exports['drawtext']:hideUI('hide')
                    cd = Config.Cooldown
                    rentad = false



                end

               
            end
        end)
    else

    end
    end
    cd = Config.Cooldown

     DeleteVehicle(vehicle,true)

     exports['drawtext']:hideUI('hide')
     
     rentad = false

         
    
end
end
end)

end)






