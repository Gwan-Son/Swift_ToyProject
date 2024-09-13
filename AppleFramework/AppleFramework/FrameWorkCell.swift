//
//  FrameWorkCell.swift
//  AppleFramework
//
//  Created by 심관혁 on 2/26/24.
//

import UIKit

class FrameWorkCell: UICollectionViewCell {
    
    @IBOutlet weak var FrameworkImage: UIImageView!
    @IBOutlet weak var FrameworkLabel: UILabel!
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        FrameworkLabel.numberOfLines = 1
        FrameworkLabel.adjustsFontSizeToFitWidth = true
    }
    
    func configure(_ data: AppleFramework){
        FrameworkImage.image = UIImage(named: data.imageName)
        FrameworkLabel.text = data.name
    }
}
