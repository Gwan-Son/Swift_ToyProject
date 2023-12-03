//
//  Sample.swift
//  StudySwiftProject
//
//  Created by 심관혁 on 11/28/23.
//  Ch 3. 08. 실제 만들면서 배운 것들 활용해보기

import SwiftUI

struct Sample: View {
    
    let data = [
        Destination(direction3: .north, food: "파스타맛집", image: Image(systemName: "carrot")),
        Destination(direction3: .east, food: nil, image: Image(systemName: "sunrise")),
        Destination(direction3: .west, food: nil, image: Image(systemName: "balloon")),
        Destination(direction3: .south, food: "순대맛집", image: Image(systemName: "cursor.rays"))
    ]
    
    @State var selectedDestination: Destination?
    
    var body: some View {
        VStack{
            selectedDestination?.image
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
            if let destination = selectedDestination{
                Text(destination.direction3.rawValue)
                if let food = destination.food{
                    Text(food)
                }
            }
            
            Button{
                selectedDestination = data.randomElement()
            } label:{
                Text("돌려요!")
            }
        }
    }
}

struct Destination{
    let direction3: Direction3
    let food: String?
    let image: Image
}

enum Direction3: String{
    case north = "북"
    case west = "서"
    case east = "동"
    case south = "남"
}

#Preview {
    Sample()
}
