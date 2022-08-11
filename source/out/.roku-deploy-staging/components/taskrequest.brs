sub init()
    m.top.FunctionName = "infoAmount"
end sub

sub infoAmount()

    ' urlArr = ["us", "mx" , "ca"]

    ' for j=0 to urlArr.Count()-1
        request = CreateObject("roUrlTransfer")
        request.SetCertificatesFile("common:/certs/ca-bundle.crt")
        request.AddHeader("X-Roku-Reserved-Dev-Id", "")
        request.InitClientCertificates()

        request.SetUrl("http://us.api.iheart.com/api/v2/content/liveStations?countryCode=us")
        m.response = request.GetToString()
        getContent()
        ' print "http://us.api.iheart.com/api/v2/content/liveStations?countryCode=" + urlArr[j].toStr()
    ' end for
end sub

sub getContent()
    
    m.parseJson = ParseJSON (m.response)
    root = CreateObject("roSGNode", "ContentNode")

        rowContent = root.createChild("ContentNode")
        rowContent.title = "BLOCK 1"
        for i = 0 to m.parseJson.hits.count()-1
            rowItem = rowContent.createChild("ContentNode")
            rowItem.addFields({
                title: m.parseJson.hits[i].name
                HDPosterUrl: m.parseJson.hits[i].logo
            })
        end for
        
        m.top.result = root
    end sub