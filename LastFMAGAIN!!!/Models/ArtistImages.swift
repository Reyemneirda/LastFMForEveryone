//
//  ArtistImages.swift
//  LastFMAGAIN!!!
//
//  Created by Adrien Meyer on 03/01/2018.
//  Copyright © 2018 Developer.Institute. All rights reserved.
//

import Foundation
class ArtistImages: NSObject
{
    var size : String = ""
    var imageUrl : URL
    
    init(size: String, imageUrl: URL){
        self.size = size
        self.imageUrl = imageUrl
    }
    
    convenience init?(json : [String : Any] )
    {
        
        
        guard let imageString = json["#text"] as? String else {
            return nil
        }
        guard  let imageURL: URL = URL(string:imageString)  else {
            return nil
        }
        
        guard let size = json["size"] as? String else {
            return nil
        }
        
        self.init(size: size, imageUrl: imageURL)
    }
    
    
}
