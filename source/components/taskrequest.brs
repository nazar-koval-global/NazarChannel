sub init()
    m.top.FunctionName = "getContent"
end sub

sub getContent()
    country = m.top.country
    resultArray = []

    for countryItem = 0 to country.Count() - 1
        res = requets("http://" + country[countryItem].toStr() + ".api.iheart.com/api/v2/content/liveStations?countryCode=" + country[countryItem].toStr())
        parseJson = ParseJSON (res)
        resultArray.push(parseJson)
    end for
    
    m.top.result = prepareContentTree(resultArray)
end sub

function requets(url, method = "GET")
    request = CreateObject("roUrlTransfer")
    request.SetCertificatesFile("common:/certs/ca-bundle.crt")
    request.AddHeader("X-Roku-Reserved-Dev-Id", "")
    request.InitClientCertificates()

    request.SetUrl(url)

    return request.GetToString()
end function

function prepareContentTree(arrJson)
    root = CreateObject("roSGNode", "ContentNode")

    for x = 0 to arrJson.Count() - 1
        rowContent = root.createChild("ContentNode")
        rowContent.title =  "BLOCK " + (x+1).toStr()
        
        for i = 0 to arrJson[x].hits.count() - 1
            rowItem = rowContent.createChild("ContentNode")
            rowItem.addFields({
                title: arrJson[x].hits[i].name
                HDPosterUrl: arrJson[x].hits[i].logo + "?ops=fit(100,100)"
            })
        end for
    end for

    return root
end function
