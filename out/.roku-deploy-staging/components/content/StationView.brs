sub init()
    m.rowlist = m.top.findNode("RowList")
    m.top.setFocus(true)
    m.countryList = ["us", "mx", "ca"]
    m.rowList.rowLabelFont.size = 16
    print(m.rowlist)
    initTask()
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
end sub

function prepareContentTree(arrJson)
    rowContent = createObject("roSGNode", "ContentNode")
    for i = 0 to arrJson.hits.count() - 1
        rowContent.title =  "BLOCK " + arrJson.hits[i].countries
        rowItem = rowContent.createChild("ContentNode")
        rowItem.addFields({
            title: arrJson.hits[i].name
            HDPosterUrl: arrJson.hits[i].logo + "?ops=fit(80,80)"
        })
    end for
    return rowContent
end function