sub Show(args as Object)
    ' Init bar
    buttonBarContent = CreateObject("roSGNode", "ContentNode")
    buttonBarContent.Update({
        children: [{
            title: "Home"
            id: "home"
        }, {
            title: "Stations"
            id: "stations"
        }, {
            title: "About"
            id: "about"
        }]
    })
    m.top.buttonBar.content = buttonBarContent
    m.top.buttonBar.theme = {
        backgroundColor: "0x000080"
        buttonColor: "0xff0000"
        footprintButtonColor: "0xff000073"
    }

    m.top.buttonBar.visible = true
    ' selection style for footprint representation
    m.top.buttonBar.footprintStyle = "selection"

    ' Add more stacks for each button
    m.top.componentController.selectStack = "home"
    m.top.componentController.addStack = "stations"
    m.top.componentController.addStack = "about"

    ' Show first screen
    gridConfig = GetButtonBarScreensConfig()["home"]
    ShowNewScreenFromConfig(gridConfig)
end sub

' Set up and show a new view
sub ShowNewScreenFromConfig(config as Object)
    newScreen = CreateObject("roSGNode", config.screenName)
    content = CreateObject("roSGNode", "ContentNode")

    content.AddFields(config.handlerConfig)
    if config.fieldsToSet <> invalid
        newScreen.SetFields(config.fieldsToSet)
    end if
    newScreen.content = content

    if config.screenName = "GridView"
        ShowGridView(newScreen)
    end if
end sub

' Retrieve config for corresponding stack and view using button ID
function GetButtonBarScreensConfig() as Object
    config = {
        home: {
            stackName: "home"
            screenName: "GridView"
            handlerConfig: {
                HandlerConfigGrid: {
                    name: "CGRoot"
                    fields: {
                        contentType: "series"
                    }
                }
            }
        }
        stations: {
            stackName: "stations"
            screenName: "GridView"
            handlerConfig: {
                HandlerConfigGrid: {
                    name: "CGRoot"
                    fields: {
                        contentType: "series"
                    }
                }
            }
        }
        about: {
            stackName: "about"
            screenName: "GridView"
            handlerConfig: {
                HandlerConfigGrid: {
                    name: "CGRoot"
                    fields: {
                        contentType: "series"
                    }
                }
            }
        }
    }
    return config
end function