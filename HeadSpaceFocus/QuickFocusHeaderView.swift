//
//  QuickFocusHeaderView.swift
//  HeadSpaceFocus
//
//  Created by 심관혁 on 3/5/24.
//

import UIKit

class QuickFocusHeaderView: UICollectionReusableView {
    @IBOutlet weak var startLabel: UILabel!
    
    func configure(_ title: String){
        startLabel.text = title
    }
}
