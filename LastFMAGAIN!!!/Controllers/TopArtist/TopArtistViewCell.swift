//
//  TopArtistViewCell.swift
//  LastFMAGAIN!!!
//
//  Created by Adrien Meyer on 03/01/2018.
//  Copyright © 2018 Developer.Institute. All rights reserved.
//

import UIKit
import SDWebImage



protocol TopListDelegate: NSObjectProtocol {
    
      func updateCell(artist: TopList?)
}

class TopArtistViewCell: UICollectionViewCell {

    @IBOutlet weak var artistImage: UIImageView!
    @IBOutlet weak var nbOfListeners: UILabel!
    @IBOutlet weak var artistName: UILabel!
    
    weak var delegate: TopListDelegate?
    
    var artist: TopList?
    
    
    func updateCell(artist: TopList)
    {
        self.artist = artist
        self.artistName.text = self.artist?.name
        self.nbOfListeners.text = "(\(String(describing: (self.artist?.listeners)!)) listeners)"
        
        for i in artist.images{
            loadImage(imageUrl: i)
        }
    }
    
    func loadImage(imageUrl: ArtistImages?)
    {
        if ((imageUrl?.size = "medium") != nil){
            artistImage.sd_setImage(with: imageUrl?.imageUrl)
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
