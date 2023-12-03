//
//  MyYab.swift
//  StudySwiftProject
//
//  Created by 심관혁 on 12/1/23.
//  Ch 3. 03. 탭뷰로 그려보기

import SwiftUI

struct MyTab: View {
    var body: some View {
        TabView {
            TabDetail()
                .tabItem {
                    Label("Received",
                          systemImage: "tray.and.arrow.down.fill") }
                .tag(1)
            
            TabDetail2()
                .tabItem {
                    Label("Sent",
                          systemImage: "tray.and.arrow.up.fill") }
                .tag(2)
            
            TabDetail3()
                .tabItem {
                    Label("Account",
                          systemImage: "tray.and.arrow.up.fill") }
                .tag(3)
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

#Preview {
    MyTab()
}
