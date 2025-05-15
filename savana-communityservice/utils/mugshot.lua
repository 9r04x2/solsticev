local myMugshot = nil

function GetMugShot(Ped)
  if not Ped then return "" end

  local Handle = RegisterPedheadshot(Ped)

  local timer = 2000
  while ((not Handle or not IsPedheadshotReady(Handle) or not IsPedheadshotValid(Handle)) and timer > 0) do
    Citizen.Wait(10)
    timer = timer - 10
  end

  local MugShotTxd = 'none'
  if (IsPedheadshotReady(Handle) and IsPedheadshotValid(Handle)) then

    myMugshot = Handle

    MugShotTxd = GetPedheadshotTxdString(Handle)
  end
  return "https://nui-img/"..MugShotTxd.."/"..MugShotTxd
end

AddEventHandler('onResourceStop', function(resourceName)
  UnregisterPedheadshot(myMugshot)
end)

function clearMugshot()
  UnregisterPedheadshot(myMugshot)
end