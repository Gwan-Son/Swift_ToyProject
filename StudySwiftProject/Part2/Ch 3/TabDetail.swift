//
//  TabDetail.swift
//  StudySwiftProject
//
//  Created by 심관혁 on 12/1/23.
//  Ch 3. 03. 탭뷰로 그려보기

import SwiftUI

struct TabDetail: View {
    var body: some View {
        ZStack{
            Color.gray.ignoresSafeArea()
            Text("this is detail")
        }
        
    }
}

struct TabDetail2: View {
    var body: some View {
        ZStack{
            Color.blue.ignoresSafeArea()
            VStack {
                Text("this is detail")
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Continue")
                        .padding()
                        .background(.green)
                        .cornerRadius(10)
                })
            }
        }
        
    }
}

struct TabDetail3: View {
    var body: some View {
        ZStack{
            Color.green.ignoresSafeArea()
            Text("this is detail")
        }
        
    }
}

#Preview {
    TabDetail()
}
