//
//  SearchCollectionViewCell.swift
//  InstaSearchView
//
//  Created by 심관혁 on 2/26/24.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var ThumbnailImageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        ThumbnailImageView.image = nil
    }
    
    func configure(_ imageName: String){
        ThumbnailImageView.image = UIImage(named: imageName)
    }
}
