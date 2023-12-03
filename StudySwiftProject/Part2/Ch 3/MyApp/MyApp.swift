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
                ZStack{
                    Color.blue.ignoresSafeArea()
                    Text("온보딩1")
                }
                ZStack{
                    Color.green.ignoresSafeArea()
                    Text("온보딩2")
                }
                ZStack{
                    Color.red.ignoresSafeArea()
                    VStack{
                        Text("온보딩3")
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
