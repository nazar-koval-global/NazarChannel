function OpenVideoPlayer(content as Object) as Object
    ' Create MediaView Object and set its fields
    ' video = CreateObject("roSGNode", "MediaView")

    videoContent = createObject("RoSGNode", "ContentNode")
    videoContent.url = "https://roku.s.cpl.delvenetworks.com/media/59021fabe3b645968e382ac726cd6c7b/60b4a471ffb74809beb2f7d5a15b3193/roku_ep_111_segment_1_final-cc_mix_033015-a7ec8a288c4bcec001c118181c668de321108861.m3u8"
    videoContent.title = "Test Video"
    videoContent.streamformat = "hls"
  
    m.video = m.top.findNode("musicvideos")
    m.video.content = videoContent
    m.video.control = "play"
  

    m.top.componentController.CallFunc("show", {
        view: videoContent
    })
    return videoContent
end function

' function OpenVideoPlayerItem(contentItem as Object) as Object
'     ' Create MediaView Object and set its fields
'     video = CreateObject("roSGNode", "MediaView")
'     video.content = contentItem
'     ' print(video.content.getParent())
'     stop
'     video.isContentList = false
'     ' Set it to start playing, it wont begin playback until show() is called
'     video.control = "play"
'     ' print(video.media)
'     ' Show the media view
'     m.top.ComponentController.CallFunc("show", {
'         view: video
'     })
'     return video
' end function
