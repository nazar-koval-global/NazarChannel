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
    m.top.buttonBar.translation = [400, 0]
    m.top.buttonBar.setFocus(true)

    m.top.buttonBar.ObserveField("itemSelected", "OnButtonBarItemSelected")
    

    m.top.buttonBar.theme = {
        backgroundColor: "0x000080"
        buttonColor: "0xff0000"
        footprintButtonColor: "0xff000073"
    }

    m.top.buttonBar.visible = true
    ' selection style for footprint representation
    m.top.buttonBar.footprintStyle = "selection"

    ' Add more stacks for each button
    m.top.componentController.selectStack = "default"
    m.top.componentController.addStack = "home"
    m.top.componentController.addStack = "stations"
    m.top.componentController.addStack = "about"

    ' Show first screen
    gridConfig = GetButtonBarScreensConfig()["home"]
    ShowNewScreenFromConfig(gridConfig)

    end sub


sub OnButtonBarItemSelected(event as Object)
    itemSelected = event.GetData()
    RetrieveScreenFromItem(itemSelected)
end sub

sub RetrieveScreenFromItem(item as Object)
    button = m.top.buttonBar.content.GetChild(item)
    screenConfig = GetButtonBarScreensConfig()[button.id]
    activeStack = m.top.componentController.activeStack
    activeView = m.top.componentController.currentView

    if screenConfig.stackName = activeStack
        ' user selected the active stack, thus move focus back on view
        ' to prevent view reloading
        if activeView <> invalid then activeView.SetFocus(true)
    else
        ' Select certain stack
        m.top.componentController.selectStack = screenConfig.stackName

        if m.top.ComponentController.currentView = invalid ' this stack hasn't been used yet
            ShowNewScreenFromConfig(screenConfig)
        else
            ' view has been already shown, therefore just move focus on it
            currentView = m.top.componentController.currentView
            if currentView <> invalid then currentView.SetFocus(true)
        end if
    end if
end sub

' Set up and show a new view
sub ShowNewScreenFromConfig(config as Object)
    newScreen = CreateObject("roSGNode", config.screenName)
    content = CreateObject("roSGNode", "ContentNode")

    content.AddFields(config.handlerConfig)
    if config.fieldsToSet <> invalid
        newScreen.SetFields(config.fieldsToSet)
    end if
    ' newScreen.content = content
    ' if config.screenName = "SearchView"
    '     ShowSearchView(newScreen)
    if config.screenName = "HomeView"
        ShowHomeView(newScreen)
    else if config.screenName = "StationView"
        ShowStationView(newScreen)
    else if config.screenName = "AboutView"
        ShowAboutView(newScreen)
    end if
end sub



' Retrieve config for corresponding stack and view using button ID
function GetButtonBarScreensConfig() as Object
    config = {
        home: {
            stackName: "home"
            screenName: "HomeView"
        }
        stations: {
            stackName: "stations"
            screenName: "StationView"
        }
        about: {
            stackName: "about"
            screenName: "AboutView"
        }
    }
    return config
end function