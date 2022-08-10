sub init()
    m.top.FunctionName = "getContent"
end sub

sub getContent()
    request = CreateObject("roUrlTransfer")
    request.SetUrl("https://us.api.iheart.com/api/v2/content/liveStations?countryCode=us")
    html = request.GetToString()
    print FormatJson(html)
end sub