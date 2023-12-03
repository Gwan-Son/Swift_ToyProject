//
//  Elevator.swift
//  StudySwiftProject
//
//  Created by 심관혁 on 11/27/23.
//  Ch 3. 02. 클래스

import SwiftUI

struct Elevator: View {
    
    @State var myElevator = Elevators()
    
    var body: some View {
        VStack{
            Text("층수 : \(myElevator.level)")
            
            HStack{
                Button(action: {
                    myElevator.goDown()
                }, label: {
                    Text("Down")
                })
                Button(action: {
                    myElevator.goUp()
                }, label: {
                    Text("Up")
                })
            }
        }
    }
}

struct Elevators{
    var level: Int = 1
    mutating func goDown(){
        level = level - 1
    }
    mutating func goUp(){
        level = level + 1
    }
}

#Preview {
    Elevator()
}
