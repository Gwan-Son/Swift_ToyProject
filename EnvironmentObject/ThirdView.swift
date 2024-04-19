//
//  ThirdView.swift
//  EnvironmentObject
//
//  Created by 심관혁 on 4/19/24.
//

import SwiftUI

struct ThirdView: View {
    
    @EnvironmentObject var person: UserProfileSettings
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Current Age: \(person.age)")
            Text("Third View")
            Button(action: {
                person.havingBirthdayParty()
            }, label: {
                Text("Having Birthday Party")
            })
            .navigationTitle("Third View")
        }
    }
}

#Preview {
    ThirdView().environmentObject(UserProfileSettings())
}
