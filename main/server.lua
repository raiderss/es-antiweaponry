AddEventHandler("explosionEvent", function(sender, ev)
    for _, zone in ipairs(Config.RestrictedZones) do
        if GetDistanceBetweenCoords(ev.explosionPos.x, ev.explosionPos.y, ev.explosionPos.z, zone.x, zone.y, zone.z, true) <= zone.radius then
            for _, explosionType in ipairs(Config.RestrictedExplosions) do
                if ev.explosionType == GetHashKey(explosionType) then
                    CancelEvent() 
                    TriggerClientEvent("chatMessage", sender, "SYSTEM", {255, 0, 0}, "It is forbidden to make explosions in this area!") 
                    return
                end
            end
        end
    end
end)


local weaponHashList = {}
for _, weaponHash in ipairs(Config.WeaponHashes) do
    table.insert(weaponHashList, GetHashKey(weaponHash))
end

AddEventHandler("weaponDamageEvent", function(sender, ev)
    for _, zone in ipairs(Config.WeaponZones) do
        if GetDistanceBetweenCoords(ev.hitCoords.x, ev.hitCoords.y, ev.hitCoords.z, zone.coords.x, zone.coords.y, zone.coords.z, true) <= zone.radius then
            local weapon = GetSelectedPedWeapon(sender)
            if table.includes(weaponHashList, weapon) then
                local playerSteamId = GetPlayerIdentifier(sender, 0) 
                for _, id in ipairs(zone.whitelist) do
                    if playerSteamId == id then 
                        return
                    end
                end
                CancelEvent() 
                TriggerClientEvent("chatMessage", sender, "SYSTEM", {255, 0, 0}, "It is forbidden to use guns or tasers in this area!")
                return
            end
        end
    end
end)

function table.includes(tbl, val)
    for _, v in ipairs(tbl) do
        if v == val then
            return true
        end
    end
    return false
end