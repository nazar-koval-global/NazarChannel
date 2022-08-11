sub init()
    m.top.backgroundURI = "pkg:/images/rsgde_bg_hd.jpg"
    m.rowlist = m.top.findNode("exampleRowList")
    m.top.setFocus(true)

    initTask()
end sub

sub initTask()
    m.taskRequest = createObject("roSGNode", "TaskRequest")
    m.taskRequest.country = ["us", "mx" , "ca"]
    m.taskRequest.observeField("result", "onResultChanged")
    m.taskRequest.control = "RUN"
end sub

sub onResultChanged()
    ' print "___PRINT___"
    ' print m.taskRequest.result
    m.rowList.content = m.taskRequest.result
end sub