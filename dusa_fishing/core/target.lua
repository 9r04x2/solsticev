target = {}

-- AddCircleZone(name: string, center: vector3, radius: float, options: table, targetoptions: table)
function target.AddCircleZone(name, center, radius, options, targetoptions)
    if config.target == 'qb' then
        exports['qb-target']:AddCircleZone(name, center, radius, options, targetoptions)
    else
        exports.qtarget:AddCircleZone(name, center, radius, options, targetoptions)
    end
end

-- RemoveZone(name: string)
function target.RemoveZone(id)
    if config.target == 'qb' then
        exports['qb-target']:RemoveZone(id)
    else
        exports.qtarget:RemoveZone(id)
    end
end

-- RemoveTargetEntity(entity: number or table, labels: table or string)
function target.RemoveTargetEntity(entity, labels)
    if config.target == 'qb' then
        exports['qb-target']:RemoveTargetEntity(entity, labels)
    else
        exports.qtarget:RemoveTargetEntity(entity, labels)
    end
end

-- AddTargetEntity(entity: number or table, parameters: table)
function target.AddTargetEntity(entity, parameters)
    if config.target == 'qb' then
        exports['qb-target']:AddTargetEntity(entity, parameters)
    else
        exports.qtarget:AddTargetEntity(entity, parameters)
    end
end