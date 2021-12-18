//
//  AlbumTableViewCell.swift
//  Typicode
//
//  Created by Reynaldo Cristinus Hutahaean on 18/12/21.
//

import UIKit
import MBProgressHUD

class AlbumTableViewCell: UITableViewCell {

    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    var photoList = [Photo]()
    var albumId = 0
    var hud:MBProgressHUD = MBProgressHUD()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setContent(album: Album) {
        getPhoto()
        
        photoCollectionView.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCollectionViewCell")
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
        albumTitleLabel.text = album.title.capitalized
    }
    
    func getPhoto() {
        PhotoService().getPhoto(albumId: albumId) { success, photos in
            self.photoList = photos
            self.photoCollectionView.reloadData()
        } errorBlock: { errString in
            print(errString)
        }

    }
}

extension AlbumTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = photoCollectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
        cell.setContent(photo: photoList[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UserPhotoViewController()
        vc.photo = photoList[indexPath.row]
        photoCollectionView.deselectItem(at: indexPath, animated: true)
        TheAppController.mainNavigationController?.pushViewController(vc, animated: true)
    }
}
