local QBCore = exports['qb-core']:GetCoreObject()



QBCore.Functions.CreateCallback('checkbankmoney', function(source, cb)
    local a = source
    local b = QBCore.Functions.GetPlayer(a)
    local c = b.PlayerData.money["bank"]
  cb(c)
end)

RegisterServerEvent('buyvehicle:server', function (price)
  local a = source
  local b = QBCore.Functions.GetPlayer(a)
  local c = b.PlayerData.money["bank"]
  b.Functions.RemoveMoney("bank", price, "RENT")

end)