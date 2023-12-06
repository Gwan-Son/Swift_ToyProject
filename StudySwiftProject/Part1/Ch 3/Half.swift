//
//  Half.swift
//  StudySwiftProject
//
//  Created by 심관혁 on 11/27/23.
//  Ch 3. 01. 구조체

import SwiftUI

struct Half: View {
    
    var name:[String] = ["관슨","상은","유진"]
    var body: some View {
        List{
            ForEach(name, id: \.self) { names in
                let welcome = sayHi(to: names)
                if(names == "관슨"){
                    Text("기다렸어요. \(welcome)")
                }
                else{
                    Text(welcome)
                }
            }
        }
    }
    func sayHi(to names:String) -> String{
        return "\(names)님 반갑습니다."
    }
}

#Preview {
    Half()
}
