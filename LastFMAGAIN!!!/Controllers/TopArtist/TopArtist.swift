//
//  ViewController.swift
//  LastFMAGAIN!!!
//
//  Created by Adrien Meyer on 03/01/2018.
//  Copyright © 2018 Developer.Institute. All rights reserved.
//

import UIKit

let jsonString = "http://ws.audioscrobbler.com/2.0/?method=geo.gettopartists&limit=35&country=israel&api_key=9c0cbfb76c4b7e2b3e4e559d8d0ff13c&format=json"

class TopArtist: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource, TopListDelegate {
    
    func updateCell(artist: TopList?) {
        print("Update")
    }
    


    var topList: [TopList] = []
    
    @IBOutlet weak var artistCollection: UICollectionView!
    
    
    
    
    override func viewDidLoad() {
        AccessData()
        super.viewDidLoad()
        self.artistCollection.register(UINib(nibName: "TopArtistViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "Cell")
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : TopArtistViewCell = artistCollection.dequeueReusableCell(withReuseIdentifier:"Cell", for: indexPath) as! TopArtistViewCell
        
        let list : TopList = self.topList[indexPath.row]

//        cell.delegate = self

        cell.updateCell(artist: list)

        
        return cell
    }
    

    
    func AccessData()
    {
        guard let url = URL(string: jsonString) else { return }
        
       
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            print(data)
            DispatchQueue.main.async {
                do {
                    if let json = try? JSONSerialization.jsonObject(with: data){
                        if let dict = json as? [String:AnyObject] {
                            print(json)
                            if let topartists = dict["topartists"] as? [String:AnyObject] {
                                print(topartists)
                                
                                if let artists = topartists["artist"] as? [[String:AnyObject]]{
                                    for result in artists
                                    {
                                        let artist = TopList(result: result)
                                        self.topList.append(artist)
                                        
                                    }
                                    
                                    
                                    
                                    
                                    self.artistCollection.reloadData()
                                }
                                
                                
                            }
                        }
                    }
                }
            }
            }.resume()
        //    self.topArtists.reloadData()
    }

    
    
}

