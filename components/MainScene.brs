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
    m.top.buttonBar.translation = [114, 6]
    m.top.buttonBar.setFocus(true)

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

    'Init title
    titleContent = CreateObject("roSGNode", "ContentNode")
    titleContent.AddFields({
        HandlerConfigGrid: {
            name: "HomePage"
        }
    })
    ' m.top.content = titleContent
    print(m.top)
end sub

' Set up and show a new view
sub ShowNewScreenFromConfig(config as Object)
    newScreen = CreateObject("roSGNode", config.screenName)
    content = CreateObject("roSGNode", "ContentNode")
    newScreen.overhang.height = 0

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
            screenName: "ParagraphView"
            handlerConfig: {
                HandlerConfigGrid: {
                    name: "HomePage"
                    fields: {
                        contentType: "welcome"
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