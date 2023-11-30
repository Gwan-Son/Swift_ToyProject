//
//  MyCar.swift
//  StudySwiftProject
//
//  Created by 심관혁 on 11/29/23.
//  Ch 4. 02. 프로토콜

import SwiftUI

struct MyCar: View {
    
    var myCar: KIA = KIA()
    var broCar: Hyundai = Hyundai()
    let cars: [Driveable] = [KIA(), Hyundai()]
    @State var speed: Int = 0
    
    var body: some View {
        VStack{
            Text("speed: \(speed)")
            Button(action: {
                speed = myCar.speedDown(with: speed)
                cars.randomElement()?.speedDown(with: speed)
            }, label: {
                Text("감속!")
            })
        }
    }
}

struct KIA: Driveable{
    func speedDown(with speed: Int) -> Int {
        print("속도가 5씩 줄어듭니다.")
        return speed - 5
    }
}

struct Hyundai: Driveable{
    func speedDown(with speed: Int) -> Int {
        print("속도가 촤촤촤 줄어들어요.")
        return speed - 9
    }
    
    
}

protocol Driveable{
    func speedDown(with speed: Int) -> Int
}

#Preview {
    MyCar()
}
