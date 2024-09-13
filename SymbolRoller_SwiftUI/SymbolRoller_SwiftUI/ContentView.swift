//
//  ContentView.swift
//  SymbolRoller_SwiftUI
//
//  Created by 심관혁 on 4/17/24.
//

import SwiftUI

struct ContentView: View {
    let symbols: [String] = ["sun.min", "moon", "cloud", "wind", "snowflake"]
    
    @State var symbol: String = "sun.min"
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Image(systemName: symbol)
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .padding()
            Spacer()
            Text(symbol)
                .font(.system(size: 40, weight: .bold))
            
            Button(action: {
                reloadButtonTapped()
            }, label: {
                HStack{
                    Image(systemName: "arrow.3.trianglepath")
                        .renderingMode(.template)
                    VStack {
                        Text("Reload")
                            .font(.system(size: 30,weight: .bold))
                        Text("click me to reload")
                    }
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity,minHeight: 80)
                .background(.pink)
                .cornerRadius(40)
            })
            .padding(.bottom, 10)
        }
    }
    
    func reloadButtonTapped() {
        symbol = symbols.randomElement()!
    }
}

#Preview {
    ContentView()
}
