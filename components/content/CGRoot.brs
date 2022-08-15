sub GetContent()
    'This is only a sample. Usually the feed is retrieved from an url using roUrlTransfer
 
    feed = ReadAsciiFile("pkg:/components/content/feed.json")
 
    if feed.Len() > 0
        json = ParseJson(feed)
        if json <> invalid AND json.rows <> invalid AND json.rows.Count() > 0
            rootChildren = {
                children: []
            }
 
            for each row in json.rows
                if row.items <> invalid
                    rowAA = {
                       children: []
                    }
 
                    for childIndex = 0 to 3
                        for each item in row.items
                            rowAA.children.Push(itemNode)
                        end for
                    end for
                    
                    rowAA.Append({ title: row.title })
 
                    rootChildren.children.Push(rowAA)
                end if
            end for
 
            m.top.content.Update(rootChildren)
        end if
    end if
end sub