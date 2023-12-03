//
//  FirstList.swift
//  StudySwiftProject
//
//  Created by 심관혁 on 12/4/23.
//

import SwiftUI

struct FirstList: View {
    var body: some View {
        NavigationStack{
            List{
                NavigationLink(
                    destination: Text("첫 번째 하위페이지입니다."),
                    label: {
                        Text("첫 번째 하위페이지")
                    })
                
                NavigationLink(
                    destination: Text("두 번째 하위페이지입니다."),
                    label: {
                        Text("두 번째 하위페이지")
                    })
                
                NavigationLink(
                    destination: Text("세 번째 하위페이지입니다."),
                    label: {
                        Text("세 번째 하위페이지")
                    })
                
                NavigationLink(
                    destination: Text("네 번째 하위페이지입니다."),
                    label: {
                        Text("네 번째 하위페이지")
                    })
            }
            .navigationTitle("리스트")
        }
    }
}

#Preview {
    FirstList()
}
