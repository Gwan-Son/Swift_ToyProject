//
//  FocusCell.swift
//  HeadSpaceFocus
//
//  Created by 심관혁 on 2/28/24.
//

import UIKit

class FocusCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var image: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = UIColor.systemIndigo
        contentView.layer.cornerRadius = 10
    }
    
    func configure(_ focus: Focus){
        title.text = focus.title
        content.text = focus.description
        image.image = UIImage(systemName: "\(focus.imageName)")?.withRenderingMode(.alwaysOriginal)
    }
}
