--- Returns the player's megaphone state
--- @return boolean
exports("MegaphoneIsActive", function()
    return playerMegaphoneIsActive()
end)

--- Turns the player's megaphone on and off
--- @param bool boolean
exports("SetPlayerMegaphoneState", function(bool)
    setPlayerMegaphoneState(bool)
end)

--- Returns the player's megaphone state
--- @return boolean
exports("MicrophoneIsActive", function()
    return playerMicrophoneIsActive()
end)

--- Turns the player's megaphone on and off
--- @param dist number Distance
--- @param bool boolean On or off
--- @param notif string Notify text
exports("SetPlayerMicrophoneState", function(dist, bool, notif)
    setPlayerMicrophoneState(dist, bool, notif)
end)
