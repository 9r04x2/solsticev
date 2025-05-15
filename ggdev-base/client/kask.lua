Citizen.CreateThread( function()
    while true do Wait(10)
      SetPedConfigFlag(PlayerPedId(), 35, false)
    end
  end)