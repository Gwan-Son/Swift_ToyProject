//
//  PlayerView.swift
//  DataFlow
//
//  Created by 심관혁 on 4/17/24.
//

import SwiftUI

struct PlayerView: View {
    
    let episode: Episode
    @State private var isPlaying: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text(episode.title)
                .font(.largeTitle)
            Text(episode.showTitle)
                .font(.title3)
                .foregroundColor(.gray)
            
            PlayButton(isPlaying: $isPlaying)
            
            PlayImage(isPlaying: $isPlaying)
        }
    }
}

#Preview {
    PlayerView(episode: Episode.list[0])
}
