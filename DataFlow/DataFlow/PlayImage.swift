//
//  PlayImage.swift
//  DataFlow
//
//  Created by 심관혁 on 4/17/24.
//

import SwiftUI

struct PlayImage: View {
    @Binding var isPlaying: Bool
    var body: some View {
        Image(systemName: isPlaying ? "sun.max.fill" : "sun.max")
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fit)
            .frame(width: 80, height: 80)
    }
}
