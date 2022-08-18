sub init()
    m.itemposter = m.top.findNode("itemPoster")
    m.itemmask = m.top.findNode("itemMask")
    m.itemlabel = m.top.findNode("itemLabel")
end sub

function getRandomColor()
  colorArray = ["#ffffff", "#f5da42", "#4242f5", "#f54242", "#f54242"]
  return colorArray[Rnd(5)]
end function

sub showcontent()
  itemcontent = m.top.itemContent
  ' print itemcontent.getParent().getParent().getParent()
  m.itemposter.uri = itemcontent.HDPosterUrl
  m.itemlabel.text = itemcontent.title
  m.itemlabel.font.size = 10
  m.itemlabel.color = getRandomColor()
end sub

sub showfocus()
  scale = 1 + (m.top.focusPercent * 0.09)
  m.itemposter.scale = [scale, scale]
end sub

sub showrowfocus()
  m.itemmask.opacity = 0.75 - (m.top.rowFocusPercent * 0.85)
end sub