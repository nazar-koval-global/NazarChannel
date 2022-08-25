sub initSpinner()
    m.busyspinner = m.top.findNode("busySpinner")
    m.busyspinner.poster.uri = "pkg:/images/busyspinner_hd.png"
    m.top.observeField("endStatus", "showSpinner")
    centerx = (1280 - m.busyspinner.poster.bitmapWidth) / 2
    centery = (720 - m.busyspinner.poster.bitmapWidth) / 2
    m.busyspinner.translation = [ centerx, centery ]
    m.top.setFocus(true)
end sub


sub showSpinner()
    if(m.top.endStatus = "done")
        m.busyspinner.visible = false
    end if
end sub
