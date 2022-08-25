function OpenVideoPlayer(content as Object) as Object
    ' Create MediaView Object and set its fields
    ?content.getChild(0)
    video = CreateObject("roSGNode", "MediaView")


    ' video2 = CreateObject("roSGNode", "Video")

    video.content = content
    video.jumpToItem = 0
    video.isContentList = false

    ' ?video
    ' ?video.content
    ' ?content.getChild(0)
    ' ' ' Set it to start playing, it wont begin playback until show() is called
    video.control = "play"
    ' ' Show the media view

    m.top.componentController.CallFunc("show", {
        view: video
    })
    return video
end function

function OpenVideoPlayerItem(contentItem as Object) as Object
    ' Create MediaView Object and set its fields
    video = CreateObject("roSGNode", "MediaView")
    video.content = contentItem
    ' print(video.content.getParent())
    stop
    video.isContentList = false
    ' Set it to start playing, it wont begin playback until show() is called
    video.control = "play"
    ' print(video.media)
    ' Show the media view
    m.top.ComponentController.CallFunc("show", {
        view: video
    })
    return video
end function
