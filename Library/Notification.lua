-- Made by ArasOfficial#8439

if RCLNotifications then
    return 
end

if not rconsolename then
    return warn("[Notification-Library]: Your exploit is not supported! Missing Function: rconsolename()")
end

if not rconsoleprint then
    return warn("[Notification-Library]: Your exploit is not supported! Missing Function: rconsoleprint()")
end

if not getgenv then
    return warn("[Notification-Library]: Your exploit is not supported! Missing Function: getgenv()")
end

getgenv().Notify = function(ConsoleName, Type, Message)
    rconsolename(ConsoleName)
  
    if Type == "Info" then
        rconsoleprint("[")
        rconsoleprint("@@BLUE@@")
        rconsoleprint("INFO")
        rconsoleprint("@@LIGHT_GRAY@@")
        rconsoleprint("]: ")
        rconsoleprint(Message .. " \n")
    end

    if Type == "Warning" then
        rconsoleprint("[")
        rconsoleprint("@@YELLOW@@")
        rconsoleprint("WARNING")
        rconsoleprint("@@LIGHT_GRAY@@")
        rconsoleprint("]: ")
        rconsoleprint(Message .. " \n")
    end

    if Type == "Error" then
        rconsoleprint("[")
        rconsoleprint("@@RED@@")
        rconsoleprint("ERROR")
        rconsoleprint("@@LIGHT_GRAY@@")
        rconsoleprint("]: ")
        rconsoleprint(Message .. " \n")
    end

    if Type == "Success" then
        rconsoleprint("[")
        rconsoleprint("@@GREEN@@")
        rconsoleprint("SUCCESS")
        rconsoleprint("@@LIGHT_GRAY@@")
        rconsoleprint("]: ")
        rconsoleprint(Message .. " \n")
    end
end

getgenv().RCLNotifications = true
