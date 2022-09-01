sub init()
    scene = m.top.getScene()
    buttonBar = scene.buttonBar
end sub

sub OnContentSet()
    content = m.top.itemContent
    group = m.top.findNode("customButtonGroup")
    label = m.top.findNode("customButtonLabel")
    underline = m.top.findNode("customButtonUnderline")
    label.text = content.title
    centerx = label.width / 2.9
    centery = 27
    underline.translation = [ centerx, centery ]
end sub

sub HandleItemSelection(isItemSelected as Object)
    if isItemSelected <> invalid
        m.top.isItemSelected = isItemSelected
        if isItemSelected = false
            UnfocusButton(0.0)
        end if
    end if
end sub

sub HandleFocus()
    rowListHasFocus = m.top.rowListHasFocus
    focusPercent = m.top.focusPercent
    
    buttonBar = m.top.GetScene().buttonBar
    if buttonBar = invalid then return

    enableFootprint = buttonBar.enableFootprint
    footprintStyle = buttonBar.footprintStyle

    if buttonBar.alignment = "left"
        focusPercent = m.top.rowFocusPercent
    end if
    if rowListHasFocus ' when navigating withing button bar
        itemFocused = focusPercent > 0.7

        if itemFocused
            FocusButton(focusPercent)
        else
            if footprintStyle = "selection" and m.top.isItemSelected
                ShowFootprint()
            else
                UnfocusButton(focusPercent)
            end if
        end if
    else ' when navigating between BB and view
        if enableFootprint
            if footprintStyle = "selection" and m.top.isItemSelected
                ShowFootprint()
            else if focusPercent > 0.9
                ShowFootprint()
            else
                UnfocusButton(0.0)
            end if
        else
            UnfocusButton(0.0)
        end if
    end if
end sub

sub FocusButton(focusPercent as Float)
    group = m.top.findNode("customButtonGroup")
    label = m.top.findNode("customButtonLabel")
    ?group.backgroundFocusedColor
    group.focusPercent = focusPercent
    group.backgroundFocusedColor = m.top.focusedButtonColor
    group.backgroundColor = m.top.focusedButtonColor
    label.color = m.top.focusedButtonTextColor
end sub


sub UnfocusButton(focusPercent as Float)
    group = m.top.findNode("customButtonGroup")
    label = m.top.findNode("customButtonLabel")
    group.focusPercent = focusPercent
    group.backgroundFocusedColor = m.top.buttonColor
    group.backgroundColor = m.top.buttonColor
    label.color = m.top.buttonTextColor
end sub

sub ShowFootprint()
    group = m.top.findNode("customButtonGroup")
    label = m.top.findNode("customButtonLabel")
    group.backgroundFocusedColor = m.top.footprintButtonColor
    group.backgroundColor = m.top.footprintButtonColor
    label.color = m.top.footprintButtonTextColor
    group.showFootprint = true
end sub