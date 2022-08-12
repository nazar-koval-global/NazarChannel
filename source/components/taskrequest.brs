sub init()
    m.top.FunctionName = "getContent"
end sub

sub getContent()
    ' print m.top.url
        res = requets(m.top.url)
        parseJson = ParseJSON (res)
        ' resultArray.push(parseJson)
    
    m.top.result = parseJson
end sub

function requets(url, method = "GET")
    request = CreateObject("roUrlTransfer")
    request.SetCertificatesFile("common:/certs/ca-bundle.crt")
    request.AddHeader("X-Roku-Reserved-Dev-Id", "")
    request.InitClientCertificates()

    request.SetUrl(url)

    return request.GetToString()
end function

