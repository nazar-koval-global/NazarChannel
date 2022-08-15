sub Show(args as Object)
    m.grid = CreateObject("roSGNode", "GridView")   
    m.grid.ObserveField("rowItemSelected", "OnGridItemSelected")    
     
    'Setup the UI of the view    
     
    m.grid.SetFields({        
        style: "standard"        
        posterShape: "16x9"      
    })

    'This is the root content that describes how to populate rest of the rows
 
    content = CreateObject("roSGNode", "ContentNode")
 
    content.AddFields({
        HandlerConfigGrid: {
           name: "CGRoot"
           fields : { param : "123" }
        }
    })
    m.grid.content = content
 
    'Triggers a job to show the view
 
    m.top.ComponentController.CallFunc("show", {
        view: m.grid
    })
end sub