sub init()
    m.aboutLabel = m.top.findNode("aboutLabel")
    m.descriptionAbout = m.top.findNode("descriptionAbout")
    m.bgAboutPoster = m.top.findNode("bgAboutPoster")
    m.bgAboutPoster.uri = "https://www.wkbn.com/wp-content/uploads/sites/48/2022/07/perseid-meteor-shower.jpg?w=1280"
    m.bgAboutPoster.opacity = 0.5
    m.aboutLabel.font.size = 48
    m.descriptionAbout.font.size = 24
    m.descriptionAbout.text = "In the winter of 2011, while serving as working members at ADX, Portland’s Makerspace, Zach and Josh met and became friends, sharing a love of art, punk, and burritos. With the help of their friends at ADX, they formed Band, a diverse, draw-it-by-hand, make-it-from-scratch, do-it-together creative studio, in a room they built above the shop’s kitchen. In the years since, Band has worked on a wide array of unique projects with some of the best people from the Pacific Northwest and beyond. We strive to keep our work unique and smart, with room for a little magic. You can find us anywhere, and if the project is the right fit, we’d love to work with you. Feel free to drop us a line, here."
end sub
