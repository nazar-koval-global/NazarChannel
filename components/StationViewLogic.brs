function ShowStationView(view as Object)
    m.rowlist = view.findNode("StationListItem")
    m.rowlist.ObserveField("rowItemSelected", "rowItemSelectedChanged")


    m.top.componentController.CallFunc("show", { view: view })
end function

sub rowItemSelectedChanged(event as Object)
    rowItem = event.GetRoSGNode()
    rowItemSelected = event.getData()
    contentVideoLink = m.rowlist.content.getChild(rowItemSelected[0]).getChild(rowItemSelected[1])
    ' rowItem.getParent().visible = false
    ' ?rowItem.getParent()
    OpenVideoPlayer(contentVideoLink)
end sub