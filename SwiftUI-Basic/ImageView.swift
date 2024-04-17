//
//  ImageView.swift
//  SwiftUI-Basic
//
//  Created by 심관혁 on 4/17/24.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        Image(systemName: "sun.max.fill")
            .renderingMode(.original)
            .resizable()
            .scaledToFit()
    }
}

#Preview {
    ImageView()
}
