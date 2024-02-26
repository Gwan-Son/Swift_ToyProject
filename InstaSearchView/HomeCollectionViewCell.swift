//
//  HomeCollectionViewCell.swift
//  InstaSearchView
//
//  Created by 심관혁 on 2/27/24.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
        
    @IBOutlet weak var homeImage: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        homeImage.image = nil
    }
    
    func configure(_ imageName: String) {
        homeImage.image = UIImage(named: imageName)
    }
}
