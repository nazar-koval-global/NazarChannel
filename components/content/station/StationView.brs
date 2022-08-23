sub init()
    m.rowlist = m.top.findNode("StationListItem")
    m.bgStationPoster = m.top.findNode("bgStationPoster")
    m.bgStationPoster.uri = "https://i.pinimg.com/originals/86/69/ab/8669ababbeb05ed394d8aad8629a90e5.jpg"
    m.bgStationPoster.opacity = 0.75
    m.top.setFocus(true)
    m.countryList = ["us", "mx", "ca"]
    m.rowList.rowLabelFont.size = 16
    initTask()
    m.top.observeField("focusedChild", "onFocusedChildChanged")
end sub

sub onFocusedChildChanged()
    if m.top.hasFocus()
        m.rowlist.setFocus(true)
    end if
end sub

function prepareUrl(countryCode = "")
    return "http://" + countryCode + ".api.iheart.com/api/v2/content/liveStations?countryCode=" + countryCode
end function

function createCountryUrlList(list)
    resultCountryUrlList = []
    for each country in list
        resultCountryUrlList.push(prepareUrl(country))
    end for
    return resultCountryUrlList
end function

sub initTask()
    initSpinner()
    m.content = CreateObject("roSGNode", "ContentNode")

    for each link in createCountryUrlList(m.countryList)
        stationTaskRequest = createObject("roSGNode", "StationTaskRequest")
        stationTaskRequest.url = link
        stationTaskRequest.observeField("result", "onResultChanged")
        stationTaskRequest.control = "RUN"
    end for
end sub

sub onResultChanged(event as Object)
    result = event.getData()
    taskRequest = event.getRoSGNode()
    rowContent = prepareContentTree(taskRequest.result)
    m.content.appendChild(rowContent)
    m.rowList.content = m.content
    m.top.endStatus = "done"
end sub

function prepareContentTree(arrJson)
    rowContent = createObject("roSGNode", "ContentNode")
    for i = 0 to arrJson.hits.count() - 1
        rowContent.title =  "BLOCK " + arrJson.hits[i].countries
        rowItem = rowContent.createChild("ContentNode")
        rowItem.addFields({
            title: arrJson.hits[i].name
            HDPosterUrl: arrJson.hits[i].logo + "?ops=fit(80,80)"
            url: arrJson.hits[i].streams.hls_stream
            StreamFormat: "hls"
        })
        rowItemChild = rowItem.createChild("ContentNode")
        rowItemChild.addFields({url: rowItem.url})
    end for
    return rowContent
end function
