Workers = {}
Workers.PauseMenu = {}
Workers.PauseMenu.PreventOpen = function()
    local isOxInventoryOpen = LocalPlayer.state.invOpen
    local isSettingsOpen = LocalPlayer.state['UI_InSettings']
    return isOxInventoryOpen or isSettingsOpen
end

AddStateBagChangeHandler('invOpen', ('player:%s'):format(GetPlayerServerId(PlayerId())), function(_, _, val)
    NUI.SetUIVisible(not val)
end)

Workers.MainMenu = {}

Workers.MainMenu.InitializeAfterConfigurationEnd = function()
    DoScreenFadeIn(1000)
end

Workers.Seatbelts = {}
Workers.Seatbelts.OnCrash = function(vehicleEntity, playerEntity)
    -- Do something when player did not fasten his seatbelt and went straight to the moon.
end

Workers.Minimap = {}
Workers.Minimap.BeforePrepare = function()
    -- CODE BEFORE THE PAYLOAD OF MINIMAP IS LOADED
end

Workers.Minimap.AfterPrepare = function()
    -- CODE AFTER THE PAYLOAD OF MINIMAP IS LOADED
end

Workers.Minimap.OnVisibilityStateChange = function(state)
    if state then
        -- CODE WHEN MINIMAP IS VISIBLE
        SetRadarZoom(1100)
    else
        -- CODE WHEN MINIMAP IS HIDDEN
    end
end