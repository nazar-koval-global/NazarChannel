sub init()
    m.titleText = m.top.findNode("titleText")
    m.subtitleText = m.top.findNode("subtitleText")
    m.bgHomePoster = m.top.findNode("bgHomePoster")
    m.titleText.font.size = 48
    m.subtitleText.font.size = 24
    m.bgHomePoster.uri = "https://www.emc-imc.org/fileadmin/_processed_/e/5/csm_thomas-kelley-78865-unsplash_d8f03abfad.jpg"
    m.bgHomePoster.opacity = 0.75

end sub
