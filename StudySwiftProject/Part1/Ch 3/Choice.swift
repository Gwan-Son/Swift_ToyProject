//
//  Choice.swift
//  StudySwiftProject
//
//  Created by 심관혁 on 11/28/23.
//  Ch 3. 04. 열거형

import SwiftUI

struct Choice: View {
    
    var direction: Direction = .north
    var member: Member = .gwanson
    var menu: Menu = .steak("미디움")
    
    var body: some View {
        Text("방향은 \(direction.rawValue)쪽 입니다")
    }
}

enum Member: String{
    case gwanson = "관슨"
    case tom = "톰"
    case bami = "바미"
    case koko = "코코"
}

enum Menu{
    case pasta
    case pizza
    case steak(String)
}

enum Direction: String{
    case north = "북"
    case south = "남"
    case west = "서"
    case east = "동"
}


#Preview {
    Choice()
}
