//
//  OnboardingCollectionViewCell.swift
//  NRCOnboarding
//
//  Created by 심관혁 on 2/27/24.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var onboardingImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desciptionLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        onboardingImage.image = nil
    }
    
    func configure(_ data: OnboardingMessage){
        onboardingImage.image = UIImage(named: data.imageName)
        title.text = data.title
        desciptionLabel.text = data.description
    }
}
