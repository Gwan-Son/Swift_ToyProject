//
//  Nil.swift
//  StudySwiftProject
//
//  Created by 심관혁 on 11/28/23.
//  Ch 3. 06. 옵셔널

import SwiftUI

struct Nil: View {
    
    var name: String = "GwanSon"
    var petName: String? = "coco"
    
    var bami: String = "Bami"
    var petName2: String = "coco"
    
    var body: some View {
        VStack{
            //Text("이름은 \(name) 펫 이름은 \(petName)입니다.")
            Text("이름은 \(bami) 펫 이름은 \(petName2)입니다.")
        }
        .onAppear{
            print("이름은 \(name) 펫 이름은 \(petName!)입니다.")
        }
    }
}


#Preview {
    Nil()
}
