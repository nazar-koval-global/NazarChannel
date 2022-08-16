sub GetContent()
    titleNode = CreateObject("roSGNode", "ContentNode")
    titleNode.addFields({
        title: "Welcome to Nazar`s Radio Channel"
        subtitle: "This is most popular channel for me and my trainee program in this new project. Please support me in my difficult startup and I`ll show you results very soon!"
    })

    m.top.ComponentController.callFunc("show", {
        view: titleNode
    })
end sub