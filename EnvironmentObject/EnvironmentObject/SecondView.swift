//
//  SecondView.swift
//  EnvironmentObject
//
//  Created by 심관혁 on 4/19/24.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        VStack {
            NavigationLink {
                ThirdView()
            } label: {
                Text("Third View")
            }
            .navigationTitle("Second View")
        }

    }
}

#Preview {
    SecondView()
}
