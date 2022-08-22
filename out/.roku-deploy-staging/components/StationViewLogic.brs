function ShowStationView(view as Object)
    m.rowlist = view.findNode("StationListItem")
    m.rowlist.ObserveField("rowItemSelected", "rowItemSelectedChanged")


    m.top.componentController.CallFunc("show", { view: view })
end function

sub rowItemSelectedChanged(event as Object)
    rowItemSelected = event.getData()

    contentVideoLink = m.rowlist.content.getChild(rowItemSelected[0]).getChild(rowItemSelected[1])


    OpenVideoPlayer(contentVideoLink)
end sub