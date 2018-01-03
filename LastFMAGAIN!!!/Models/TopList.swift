//
//  TopList.swift
//  LastFMAGAIN!!!
//
//  Created by Adrien Meyer on 03/01/2018.
//  Copyright © 2018 Developer.Institute. All rights reserved.
//

import Foundation

class TopList: NSObject
{
    var name: String
    var images: [ArtistImages]
    var listeners: String
    
    
    init( result: [String:AnyObject])
    {
        
        let name = result["name"] as! String
        
        let listeners = result["listeners"] as? String ?? ""
        
        var images : [ArtistImages] = []
        if let imageDicts : [[String : Any]] = result["image"] as? [[String : Any]]
        {
            for imageDict : [String : Any] in imageDicts
            {
                let artistImage = ArtistImages(json: imageDict)
                images.append(artistImage!)
            }
        }
        
        self.name = name
        
        self.listeners = listeners
        self.images = images
    }
    
}
