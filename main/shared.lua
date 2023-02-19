Config = {}

---------------------------------------------------------- EXPLOSIVE ----------------------------------------------------------

Config.RestrictedExplosions = {
    "EXPLOSION_GRENADE", -- lists the explosives that need to be blocked
    "EXPLOSION_STICKYBOMB",
    "EXPLOSION_RPG",
-- you can add as many explosives as you want here
}

Config.RestrictedZones = {
    {x = 100.0, y = 100.0, z = 30.0, radius = 50.0},
    -- x, y, z and its radius define the specified region
    -- you can define as many regions as you want here
}


---------------------------------------------------------- GUN ----------------------------------------------------------

Config.WeaponZones = {
    {
        name = "Zone 1",
        coords = {x = 100.0, y = 100.0, z = 30.0},
        radius = 50.0,
        whitelist = { -- defines a region-specific whitelist list
            "steam:123456789012345", -- here you can add as many player Steam IDs as you want
            "steam:234567890123456",
            "steam:345678901234567"
        }
    },
   -- here you can define as many zones as you want
}

Config.WeaponHashes = {
    "WEAPON_STUNGUN",
    "WEAPON_PISTOL",
    "WEAPON_COMBATPISTOL",
    "WEAPON_APPISTOL",
    "WEAPON_REVOLVER"
}