sub init()
    m.top.FunctionName = "infoAmount"
end sub

sub infoAmount()
    urlArr = ["us", "mx" , "ca"]
    arrJson=[]

    for j=0 to urlArr.Count()-1

        request = CreateObject("roUrlTransfer")
        request.SetCertificatesFile("common:/certs/ca-bundle.crt")
        request.AddHeader("X-Roku-Reserved-Dev-Id", "")
        request.InitClientCertificates()

        request.SetUrl("http://us.api.iheart.com/api/v2/content/liveStations?countryCode=" + urlArr[j].toStr())
        m.response = request.GetToString()

        m.parseJson = ParseJSON (m.response)
        arrJson.push(m.parseJson)
        ' countrylink = "http://us.api.iheart.com/api/v2/content/liveStations?countryCode=us" '+ urlArr[j].toStr()
        ' print "http://us.api.iheart.com/api/v2/content/liveStations?countryCode=" + urlArr[j].toStr()
    end for
    getContent(arrJson, arrJson.Count()-1)
end sub

sub getContent(arrJson, linksAmount)
    root = CreateObject("roSGNode", "ContentNode")

    for x=0 to linksAmount-1
        rowContent = root.createChild("ContentNode")
        rowContent.title =  "BLOCK " + (x+1).toStr()
        for i = 0 to arrJson[x].hits.count()-1
            rowItem = rowContent.createChild("ContentNode")
            rowItem.addFields({
                title: arrJson[x].hits[i].name
                HDPosterUrl: arrJson[x].hits[i].logo
            })
        end for
    end for

        ' rowContent = root.createChild("ContentNode")
        ' rowContent.title = "BLOCK 2"
        ' for i = 0 to arrJson[1].hits.count()-1
        '     rowItem = rowContent.createChild("ContentNode")
        '     rowItem.addFields({
        '         title: arrJson[1].hits[i].name
        '         HDPosterUrl: arrJson[1].hits[i].logo
        '     })
        ' end for
        
        ' rowContent = root.createChild("ContentNode")
        ' rowContent.title = "BLOCK 3"
        ' for i = 0 to arrJson[2].hits.count()-1
        '     rowItem = rowContent.createChild("ContentNode")
        '     rowItem.addFields({
        '         title: arrJson[2].hits[i].name
        '         HDPosterUrl: arrJson[2].hits[i].logo
        '     })
        ' end for
        
        m.top.result = root
        ' print arrJson
    end sub