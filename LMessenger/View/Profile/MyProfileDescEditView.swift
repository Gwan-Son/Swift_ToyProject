//
//  MyProfileDescEditView.swift
//  LMessenger
//
//  Created by 심관혁 on 2/7/24.
//

import SwiftUI

struct MyProfileDescEditView: View {
    @State var description: String
    
    var onCompleted: (String) -> Void
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("상태메시지를 입력해주세요.", text: $description)
                    .multilineTextAlignment(.center)
            }
            .toolbar {
                Button("완료") {
                    onCompleted(description)
                }
            }
        }
    }
}

#Preview {
    MyProfileDescEditView(description: "")
}
