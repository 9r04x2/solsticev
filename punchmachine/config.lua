UMPunchMachine = {}

UMPunchMachine.Framework = "qb-core" -- qb-core | esx

UMPunchMachine.SQL = "oxmysql" -- oxmysql | mysql-async 

UMPunchMachine.Target = {
    ["open"] = false, -- or false
    ["target"] = 'qb-target'-- or qtarget
}

UMPunchMachine.MiniGame = 'Normal' -- | Easy | Normal | Hard

UMPunchMachine.Blips = false -- or false

UMPunchMachine.Coords = {
    ["konum-2"] = {
        ["coords"] = vector4(-811.7108, -1342.5557, 5.1503, 250.1857),
        ["prop"] = 'box_machine',
        ["offset"] = {x = -0.20, y = 0.25}
    },
   
    ["konum-3"] = {
        ["coords"] = vector4(-592.7592, -1082.9928, 22.3697, 327.9294),
        ["prop"] = 'box_machine',
        ["offset"] = {x = -0.20, y = 0.25}
    },
}

UMPunchMachine.GetCore = function()
    QBCore = exports['qb-core']:GetCoreObject()
end

UMPunchMachine.Notify = function(text,type)
    QBCore.Functions.Notify(text, type)

end

UMPunchMachine.Lang ={
    ["error-1"] = "Bu makine meşgul",
    ["target-1"] = "Vur",
    ["target-2"] = "Skor tablosu",
    ["target-false"] = "[E] Vur / [G] Skor tablosu",
    ["blipname"] = "Yumruk Makinesi"
}