//
//  Option.swift
//  StudySwiftProject
//
//  Created by 심관혁 on 11/28/23.
//  Ch 3. 07. 옵셔널 바인딩, 체이닝

import SwiftUI

struct Option: View {
    
    var gwanson:People? = People(name: "GwanSon", mbti: MBTI(name: "ENTJ"))
    var bami = People(name: "bami", petName: "coco")
    var berry = People(name: "berry", petName: "cookie")
    
    var body: some View {
        VStack{
            if let gwansonMbtiName = gwanson?.mbti?.name{
                Text(gwansonMbtiName)
            } else{
                Text("No MBTI name")
            }
            
//            if let petName = gwanson.petName{
//                Text("이름은 \(gwanson.name) 애완동물 이름은 \(petName)")
//            } else{
//                Text("이름은 \(gwanson.name) 애완동물 이름은 없어요")
//            }
            if let petName = bami.petName{
                Text("이름은 \(bami.name) 애완동물 이름은 \(petName)")
            }
            if let petName = berry.petName{
                Text("이름은 \(berry.name) 애완동물 이름은 \(petName)")
            }
            
        }
    }
}

struct People{
    let name: String
    var petName: String?
    var mbti: MBTI?
}

struct MBTI{
    let name: String?
}

#Preview {
    Option()
}
