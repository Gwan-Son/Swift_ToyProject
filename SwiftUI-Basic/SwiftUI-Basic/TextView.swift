//
//  TextView.swift
//  SwiftUI-Basic
//
//  Created by 심관혁 on 4/17/24.
//

import SwiftUI

struct TextView: View {
    var body: some View {
        Text("SwiftUI")
            .font(.system(size: 40, weight: .bold, design: .default))
    }
}

#Preview {
    TextView()
}
