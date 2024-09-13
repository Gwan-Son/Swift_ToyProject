//
//  ChatListCollectionViewCell.swift
//  ChatList
//
//  Created by 심관혁 on 2/25/24.
//

import UIKit

class ChatListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var ProfileImage: UIImageView!
    @IBOutlet weak var ProfileName: UILabel!
    @IBOutlet weak var Message: UILabel!
    @IBOutlet weak var Date: UILabel!
    
    // StoryBoard에서 Cell을 꺼내는 함수
    override func awakeFromNib() {
        super.awakeFromNib()
        ProfileImage.layer.cornerRadius = 40
    }
    
    func configure(_ chat: Chat) {
        ProfileImage.image = UIImage(named: chat.name)
        ProfileName.text = chat.name
        Message.text = chat.chat
        Date.text = changeDateFormat(dateString: chat.date)
    }
    
    func changeDateFormat(dateString: String) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        if let date = formatter.date(from: dateString) {
            formatter.dateFormat = "M/d"
            return formatter.string(from: date)
        } else{
            return ""
        }
    }
}
