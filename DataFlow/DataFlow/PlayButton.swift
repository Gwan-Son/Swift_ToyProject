//
//  PlayButton.swift
//  DataFlow
//
//  Created by 심관혁 on 4/17/24.
//

import SwiftUI

struct PlayButton: View {
    @Binding var isPlaying: Bool
    var body: some View {
        Button {
            self.isPlaying.toggle()
        } label: {
            Image(systemName: isPlaying ? "pause.circle": "play.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 80)
                .foregroundColor(.primary)
        }
    }
}
