//
//  LoginView.swift
//  LMessenger
//
//  Created by 심관혁 on 1/30/24.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    var body: some View {
        VStack(alignment: .leading) {
            Group{
                Text("로그인")
                    .font(.system(size: 28,weight: .bold))
                    .foregroundColor(.bkText)
                    .padding(.top, 80)
                
                Text("아래 제공되는 서비스로 로그인을 해주세요.")
                    .font(.system(size: 14))
                    .foregroundColor(.greyDeep)
            }
            .padding(.horizontal, 30)
            
            Spacer()
            
            Button{
                // TODO: - google login
            } label: {
                Text("Google로 로그인")
            }.buttonStyle(LoginButtonStyle(textColor: .bkText, borderColor: .greyLight))
            
            Button{
                // TODO: - apple login
            } label: {
                Text("Apple로 로그인")
            }.buttonStyle(LoginButtonStyle(textColor: .bkText,  borderColor: .greyLight))
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading){
                Button(action: {
                    dismiss()
                }, label: {
                    Image("back")
                })
            }
        }
    }
}

#Preview {
    LoginView()
}
