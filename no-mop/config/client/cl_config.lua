-- https://none-fivem.gitbook.io/nonem/resources/no-mop/configuration/client

Config.Dirt = {
    --- Max point value per dirt group
    MaxDirtPoint = 2000,
    -- Point adjustment while standing on the dirty surface. (Every 1 sec)
    DirtPointAdjustment = 10,
    -- Multiplies DirtPointAdjustment and removes from the dirt point while standing on the clean surface. (Every 1 sec)
    DirtPointDecreaseMultiplier = 0.25,
    -- Required point to leave dirt behind.
    RequiredDirtPoint = 100,
    -- Disabled interior hashes
    -- https://none-fivem.gitbook.io/nonem/resources/no-mop/configuration/how-to-disable-pollution-for-interiors
    DisabledInteriors = {},
    -- In order to reset player's walking style you need to add your custom walking styles here.
    CustomWalkStyles = {}
}
