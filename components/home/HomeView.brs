sub init()
    m.titleText = m.top.findNode("titleText")
    m.subtitleText = m.top.findNode("subtitleText")
    m.bgHomePoster = m.top.findNode("bgHomePoster")
    m.rowlist = m.top.findNode("HomeList")
    m.titleText.font.size = 44
    m.subtitleText.font.size = 20
    m.bgHomePoster.uri = "https://www.emc-imc.org/fileadmin/_processed_/e/5/csm_thomas-kelley-78865-unsplash_d8f03abfad.jpg"
    m.bgHomePoster.opacity = 0.75
    m.countryList = ["", "us", "mx", "ca"]
    initTask()
end sub

function prepareUrl(countryCode = "")
    return "http://" + countryCode + ".api.iheart.com/api/v2/content/liveStations?countryCode=" + countryCode
end function

function createCountryUrl(list)
    resultCountryUrlList = []
    for each country in list
        resultCountryUrlList.push(prepareUrl(country))
    end for
    return resultCountryUrlList[Rnd(3)]
end function

sub initTask()
    ' initSpinner()
    m.content = CreateObject("roSGNode", "ContentNode")
        homeTaskRequest = createObject("roSGNode", "HomeTaskRequest")
        homeTaskRequest.url = createCountryUrl(m.countryList)
        homeTaskRequest.observeField("result", "onResultChanged")
        homeTaskRequest.control = "RUN"
end sub

sub onResultChanged(event as Object)
    result = event.getData()
    taskRequest = event.getRoSGNode()
    rowContent = prepareContentTree(taskRequest.result)
    m.content.appendChild(rowContent)
    m.rowList.content = m.content
    ' m.top.endStatus = "done"
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

function onKeyEvent(key as String, press as Boolean) as Boolean  
    if press then
        if (key = "down") then
            if m.top.hasFocus()
                m.rowlist.setFocus(true)
            end if
        
        end if
    end if
end function