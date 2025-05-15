Config = {}

Config.LockNPCDrivingCars = true 
Config.LockNPCParkedCars = true
Config.RemoveLockpickNormal = 0.5
Config.RemoveLockpickAdvanced = 0.2 
Config.LockPickDoorEvent = function()
    TriggerEvent('kwk-lockpick:client:openLockpick', LockpickFinishCallback)
end

Config.CarJackEnable = true 
Config.CarjackingTime = 7500 
Config.DelayBetweenCarjackings = 10000
Config.CarjackChance = {
    ['2685387236'] = 0.0, 
    ['416676503'] = 0.5,
    ['-957766203'] = 0.75,
    ['860033945'] = 0.90, 
    ['970310034'] = 0.90,
    ['1159398588'] = 0.99,
    ['3082541095'] = 0.99, 
    ['2725924767'] = 0.99, 
    ['1548507267'] = 0.0, 
    ['4257178988'] = 0.0, 
}

Config.HotwireChance = 0.5 
Config.TimeBetweenHotwires = 5000
Config.minHotwireTime = 20000 
Config.maxHotwireTime = 40000
Config.AlertCooldown = 10000 
Config.PoliceAlertChance = 0.75 
Config.PoliceNightAlertChance = 0.50 
Config.SharedKeys = {}
Config.ImmuneVehicles = {
    'stockade'
}

Config.NoLockVehicles = {}

Config.NoCarjackWeapons = {
    "WEAPON_UNARMED",
    "WEAPON_Knife",
    "WEAPON_Nightstick",
    "WEAPON_HAMMER",
    "WEAPON_Bat",
    "WEAPON_Crowbar",
    "WEAPON_Golfclub",
    "WEAPON_Bottle",
    "WEAPON_Dagger",
    "WEAPON_Hatchet",
    "WEAPON_KnuckleDuster",
    "WEAPON_Machete",
    "WEAPON_Flashlight",
    "WEAPON_SwitchBlade",
    "WEAPON_Poolcue",
    "WEAPON_Wrench",
    "WEAPON_Battleaxe",
    "WEAPON_Grenade",
    "WEAPON_StickyBomb",
    "WEAPON_ProximityMine",
    "WEAPON_BZGas",
    "WEAPON_Molotov",
    "WEAPON_FireExtinguisher",
    "WEAPON_PetrolCan",
    "WEAPON_Flare",
    "WEAPON_Ball",
    "WEAPON_Snowball",
    "WEAPON_SmokeGrenade",
}