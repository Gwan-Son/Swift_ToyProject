//
//  ContentView.swift
//  DataFlow
//
//  Created by 심관혁 on 4/17/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PlayerView(episode: Episode.list[0])
    }
}

#Preview {
    ContentView()
}
