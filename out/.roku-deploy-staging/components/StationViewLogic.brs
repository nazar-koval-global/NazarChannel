function ShowStationView(view as Object)
    m.top.backgroundURI = "https://yugcontract.ua/img/shop/Samsung/B7200-02-02.jpg"
    ' view.ObserveField("stationView", "onStationChanged")

    ' print(view)

    m.top.componentController.CallFunc("show", { view: view })
end function

' sub onStationChanged(event as Object)
'     result = event.getData()
'     taskRequest = event.getRoSGNode()
'     rowContent = prepareContentTree(taskRequest.result)
'     m.content.appendChild(rowContent)
'     m.rowList.content = m.content
' end sub

' function prepareContentTree(arrJson)
'     rowContent = createObject("roSGNode", "ContentNode")
'     for i = 0 to arrJson.hits.count() - 1
'         rowContent.title =  "BLOCK " + arrJson.hits[i].countries
'         rowItem = rowContent.createChild("ContentNode")
'         rowItem.addFields({
'             title: arrJson.hits[i].name
'             HDPosterUrl: arrJson.hits[i].logo + "?ops=fit(80,80)"
'         })
'     end for
'     print rowContent
'     return rowContent
' end function