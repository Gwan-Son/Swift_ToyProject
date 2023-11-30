//
//  Selection.swift
//  StudySwiftProject
//
//  Created by 심관혁 on 11/28/23.
//  Ch 3. 05. 스위치

import SwiftUI

struct Selection: View {
    @State var myDirection: Direction2 = .south
    
    var body: some View {
        
        VStack{
            
            switch myDirection{
            case .north:
                Text("북쪽은 추워요")
            case .south:
                Text("남쪽으로 쉬러가요!")
            case .east:
                Text("동쪽으로 해 보러 갈래요?")
            case .west:
                Text("서쪽은 석양이 이뻐요")
            }
            
            Button(action: {
                switch myDirection {
                case .north:
                    myDirection = .east
                case .south:
                    myDirection = .west
                case .west:
                    myDirection = .north
                case .east:
                    myDirection = .south
                }
            }, label: {
                Text("돌리기")
            })
        }
    }
}

enum Direction2: String{
    case north = "북"
    case south = "남"
    case west = "서"
    case east = "동"
}

#Preview {
    Selection()
}
