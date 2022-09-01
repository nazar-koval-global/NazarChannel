sub init()
    m.itemposter = m.top.findNode("homeItemPoster")
    m.itemmask = m.top.findNode("homeItemMask")
    m.itemlabel = m.top.findNode("homeItemLabel")
    m.itemmask.opacity = 0.4
    m.top.observeField("focusPercent", "showfocus")
end sub

function getRandomColor()
  colorArray = ["#ffffff", "#f5da42", "#4242f5", "#f54242", "#f54242"]
  return colorArray[Rnd(5)]
end function

sub showcontent()
  itemcontent = m.top.itemContent
  m.itemposter.uri = itemcontent.HDPosterUrl
  m.itemlabel.text = itemcontent.title
  m.itemlabel.font.size = 10
  m.itemlabel.color = getRandomColor()
  m.itemmask.opacity = 0.4
end sub

sub showfocus()
  scale = 1 + (m.top.focusPercent * 0.09)
  m.itemposter.scale = [scale, scale]
  m.itemmask.opacity = 0.4
  m.itemmask.opacity = 0.4 - (m.top.focusPercent * 0.5)
end sub
