//
//  ContentView.swift
//  EnvironmentObject
//
//  Created by 심관혁 on 4/19/24.
//

import SwiftUI

struct FirstView: View {
    
    @EnvironmentObject var person: UserProfileSettings
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Text("Current Age: \(person.age)")
                NavigationLink {
                    SecondView()
                } label: {
                    Text("Second View")
                }

                Button(action: {
                    person.havingBirthdayParty()
                }, label: {
                    Text("Having Birthday Party")
                })
            }
            .navigationTitle("First View")
        }
    }
}

#Preview {
    FirstView().environmentObject(UserProfileSettings())
}
