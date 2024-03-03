//
//  BannerCell.swift
//  SpotifyPaywall
//
//  Created by 심관혁 on 2/28/24.
//

import UIKit

class BannerCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 16
    }
    
    func configure(_ banner: BannerInfo) {
        titleLabel.text = banner.title
        descriptionLabel.text = banner.description
        imageView.image = UIImage(named: banner.imageName)
    }
}
