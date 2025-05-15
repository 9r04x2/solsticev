Chat = {}
Chat.CreateMessage = function(icon, message, color, anonymous, proximity)
    if not Config.Chat.Use then return end
    TriggerServerEvent('ZSX_UIV2:Chat:MessageCreated', icon, message, color, anonymous, proximity)
end

RegisterNUICallback('chatResult', function(data)
    if not Config.Chat.Use then return end
    NUI.SendMessage('CHAT_SET_INPUT_VISIBLE', {state = false})
    if data.text:sub(1, 1) == '/' then
        return ExecuteCommand(data.text:sub(2))
    else
        LocalOutOfCharacter(data.text)
    end
end)

RegisterNetEvent('ZSX_UIV2:Chat:RetrieveEndPointMessage')
AddEventHandler('ZSX_UIV2:Chat:RetrieveEndPointMessage', function(messageData, coords, proximity)
    if not Config.Chat.Use then return end
    if type(proximity) == 'number' then
        if coords then
            if #(GetEntityCoords(PlayerPedId()) - coords) > proximity then
                return
            end
        else
            return
        end
    end
    if messageData.icon == 'ME' or messageData.icon == 'DO' then
        TriggerEvent('ZSX_UIV2:PlayerDUIS:Add', messageData.source, messageData.icon, messageData.message)
    end
    TriggerEvent('chat:addMessage', messageData)
end)
