//
//  Navigation.swift
//  StudySwiftProject
//
//  Created by 심관혁 on 12/1/23.
//  Ch 3. 02. 네비게이션 써보기

import SwiftUI

struct Navigation: View {
    
    let titles = ["디테일뷰", "디테일뷰2"]
    let descriptions = ["데스티네이션","데스티네이션2"]
    
    @State var showModal: Bool = false
    
    var body: some View {
        NavigationStack{
            List{
                ForEach([0,1], id: \.self){ index in
                    NavigationLink(
                        destination: Text(descriptions[index]),
                        label: {
                            Text(titles[index])
                        })
                }
            }
            .toolbar{
                ToolbarItem(placement: .bottomBar){
                    Button(action: {
                        showModal = true
                    }, label: {
                        Text("Add")
                    })
                }
            }
            .sheet(isPresented: $showModal, content: {
                Text("아이템 추가 페이지입니다.")
            })
            .navigationTitle("네비게이션")
                
        }
    }
}

#Preview {
    Navigation()
}
