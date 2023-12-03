//
//  Onboarding1.swift
//  StudySwiftProject
//
//  Created by 심관혁 on 12/4/23.
//

import SwiftUI

struct Onboarding1: View {
    
    let onboardingTitle: String
    let backgroungColor: Color
    let isButtonTrue: Bool
    @Binding var showModal: Bool
    
    var body: some View {
        ZStack{
            backgroungColor.ignoresSafeArea()
            VStack{
                Text(onboardingTitle)
                if(isButtonTrue){
                    Button(action: {
                        showModal = false
                    }, label: {
                        Text("Start")
                            .padding()
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    })
                }
            }
        }
    }
}

#Preview {
    Onboarding1(onboardingTitle: "온보딩 테스트", backgroungColor: .blue, isButtonTrue: false, showModal: .constant(true))
}
