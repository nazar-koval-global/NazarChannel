function onKeyEvent(key as string, press as boolean) as boolean
    if press and key = "play"
        m.top.GetScene().FindNode("videoBlock").control = "stop"
    else if press and key = "back"
        m.top.GetScene().FindNode("videoBlock").control = "stop"
    end if
end function