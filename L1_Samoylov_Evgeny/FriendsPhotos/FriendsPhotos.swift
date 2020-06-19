//
//  FriendsPhotos.swift
//  L1_Samoylov_Evgeny
//
//  Created by Evgen on 02.04.2020.
//  Copyright © 2020 XXX. All rights reserved.
//

import UIKit
import Alamofire

private let reuseIdentifier = "Cell"

class FriendsPhotos: UICollectionViewController {
    var ownerId = Int()
    var friendsPhotos = [UIImage] ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let parameters : Parameters = [
            "owner_id" : ownerId,
            "access_token" : Session.instance.token,
            "v" : "5.103"
        ]
        AF.request("https://api.vk.com/method/photos.getAll", parameters: parameters).responseJSON { response in
            
            print(response.value)
            self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
            
        }
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friendsPhotos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendPhotoCell", for: indexPath) as! FriendPhotoCell
        let photo = friendsPhotos[indexPath.row]
        cell.friendPhoto.image = photo
        return cell
    }
    
    
}
