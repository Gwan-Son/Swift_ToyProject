//
//  Modal.swift
//  StudySwiftProject
//
//  Created by 심관혁 on 12/1/23.
//  Ch 3. 01. 여러 화면을 이동하기

import SwiftUI

struct Modal: View {
    
    @State var showModal: Bool = false
    
    var body: some View {
        VStack{
            Text("메인 페이지입니다.")
            Button(action: {
                showModal = true
            }, label: {
                Text("Modal 화면 전환")
            })
        }
        .sheet(isPresented: $showModal, content: {
            Detail(isPresented: $showModal)
        })
        
    }
}

#Preview {
    Modal()
}
