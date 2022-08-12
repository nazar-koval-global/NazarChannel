sub init()
    m.top.backgroundURI = "pkg:/images/rsgde_bg_hd.jpg"
    m.rowlist = m.top.findNode("exampleRowList")
    m.top.setFocus(true)
    m.countryList = ["us", "mx" , "ca"]
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
    for each link in createCountryUrlList(m.countryList)
        m.taskRequest = createObject("roSGNode", "TaskRequest")
        m.taskRequest.url = link
        print m.taskRequest.url
    end for
    m.taskRequest.observeField("result", "onResultChanged")
    m.taskRequest.control = "RUN"
    print createCountryUrlList(m.countryList)
end sub

sub onResultChanged(event as Object)
    print "_____onResultChanged____"
    print m.taskRequest.url
    result = event.getData()
    taskRequest = event.getRoSGNode()
    content = prepareContentTree(result)
    ' print "___PRINT___"
    ' print m.taskRequest.result
    ' m.rowList.content = m.taskRequest.result
end sub

function prepareContentTree(arrJson)
    ' root = CreateObject("roSGNode", "ContentNode")

    ' for x = 0 to arrJson.Count() - 1
    '     rowContent = root.createChild("ContentNode")
    '     rowContent.title =  "BLOCK " + (x+1).toStr()
        
    '     for i = 0 to arrJson[x].hits.count() - 1
    '         rowItem = rowContent.createChild("ContentNode")
    '         rowItem.addFields({
    '             title: arrJson[x].hits[i].name
    '             HDPosterUrl: arrJson[x].hits[i].logo + "?ops=fit(100,100)"
    '         })
    '     end for
    ' end for

    ' return root
end function
