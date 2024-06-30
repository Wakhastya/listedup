AddHook("onvariant", "Wakka", function(var)
    if var[0] == "OnDialogRequest" and var[1]:find("`bThe Black Backpack") then
        return true
    end
    return false
end)

local function scanObject(id)
    local count = 0
    for _, object in pairs(GetObjectList()) do
        if object.id == id then
            count = count + object.amount
        end
    end
    return count
end

local function dropWakka()
    local BGemsDropAmount = 0
    while scanObject(15062) < BGems do
        SendPacket(2, "action|dialog_return\ndialog_name|popup\nbuttonClicked|bgem_dropall")
        Sleep(250)
        BGemsDropAmount = BGemsDropAmount + 250
        if scanObject(15062) >= BGems then
            break
        end
    end
end

dropWakka()
