' There are two functions depending on whether or not a focus index and isContentList are provided
function OpenVideoPlayer(content as Object) as Object
    ' Create MediaView Object and set its fields
    video = CreateObject("roSGNode", "MediaView")


    ' video2 = CreateObject("roSGNode", "Video")



    video.content = content
    ' ?video
    ' ?video.content
    ?video.content.getChild(0)
    ' video2.content = content
    ' ' ' Set it to start playing, it wont begin playback until show() is called
    video.control = "play"
    ' ' Show the media view

    m.top.componentController.CallFunc("show", {
        view: video
    })
    return video
end function
