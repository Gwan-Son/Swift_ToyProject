//
//  Detail.swift
//  StudySwiftProject
//
//  Created by 심관혁 on 12/1/23.
//  Ch 3. 01. 여러 화면을 이동하기

import SwiftUI

struct Detail: View {
    
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack{
            Text("모달 페이지입니다.")
            Button(action: {
                isPresented = false
            }, label: {
                Text("닫기")
            })
        }
    }
}

#Preview {
    Detail(isPresented: .constant(true))
}
