//
//  MyApp.swift
//  StudySwiftProject
//
//  Created by 심관혁 on 12/1/23.
//  Ch 3. 04. 여러개의 화면을 이어서 만든 앱

import SwiftUI

struct MyApp: View {
    
    @State var showModal: Bool = false
    
    var body: some View {
        TabView{
            FirstList()
                .tabItem {
                    Label("투데이",
                          systemImage: "doc.text.image.fill")}
            Text("두 번째 페이지")
                .tabItem {
                    Label("게임",
                          systemImage: "gamecontroller")
                }
            Text("세 번째 페이지")
                .tabItem {
                    Label("앱",
                          systemImage: "square.stack.3d.up.fill")
                }
            Text("네 번째 페이지")
                .tabItem {
                    Label("Arcade",
                          systemImage: "arcade.stick")
                }
            Text("다섯 번째 페이지")
                .tabItem {
                    Label("검색",
                          systemImage: "magnifyingglass")
                }
            
            
        }
        .sheet(isPresented: $showModal, content: {
            TabView{
                Onboarding1(onboardingTitle: "온보딩 1", backgroungColor: .blue,isButtonTrue: false,showModal: $showModal)
                
                Onboarding1(onboardingTitle: "온보딩 2", backgroungColor: .green,isButtonTrue: false,showModal: $showModal)
                
                Onboarding1(onboardingTitle: "온보딩 3", backgroungColor: .red, isButtonTrue: true, showModal: $showModal)
            }
            .tabViewStyle(.page)
        })
        .onAppear{
            showModal = true
        }
    }
}

#Preview {
    MyApp()
}
