//
//  FrieindsPhotos.swift
//  L1_Samoylov_Evgeny
//
//  Created by Evgen on 01.04.2020.
//  Copyright © 2020 XXX. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class FrieindsPhotos: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
  self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendPhotoCell", for: indexPath) as! FriendPhotoCell

        return cell
    }
}
