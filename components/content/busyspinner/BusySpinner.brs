sub initSpinner()
    m.top.backgroundURI = "pkg:/images/rsgde_bg_hd.jpg"
    m.busyspinner = m.top.findNode("busySpinner")
    m.top.observeField("endStatus", "showSpinner")
    m.busyspinner.poster.uri = "pkg:/images/busyspinner.png"
    m.top.setFocus(true)
end sub


sub showSpinner()
    if(m.top.endStatus = "done")
        centerx = (1280 - m.busyspinner.poster.bitmapWidth) / 2
        centery = (720 - m.busyspinner.poster.bitmapWidth) / 2
        m.busyspinner.translation = [ centerx, centery ]
        m.busyspinner.visible = true
    end if
end sub