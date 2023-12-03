//
//  Diff.swift
//  StudySwiftProject
//
//  Created by 심관혁 on 11/27/23.
//  Ch 3. 03. ObserableObject

import SwiftUI

struct Diff: View {
    
    let myCar = Car(name: "관슨카", owner: "관슨")
    let myKar = Kar(name: "관슨카2", owner: "관슨2")
    
    var body: some View {
        VStack{
            Text("\(myCar.name)의 주인은 \(myCar.owner)입니다.")
            Button(action: myCar.sayHi, label: {
                Text("출발")
            })
        }
    }
}

struct Car{
    var name: String
    var owner: String
    
    func sayHi(){
        print("hi \(owner)")
    }
}

class Kar{
    var name: String
    var owner: String
    
    func sayHi(){
        print("hi \(owner)")
    }
    
    init(name: String, owner: String) {
        self.name = name
        self.owner = owner
    }
}

#Preview {
    Diff()
}
