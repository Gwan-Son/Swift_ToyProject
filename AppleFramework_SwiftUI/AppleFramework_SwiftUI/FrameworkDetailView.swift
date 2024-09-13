//
//  FrameworkDetailView.swift
//  AppleFramework_SwiftUI
//
//  Created by 심관혁 on 4/19/24.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    @StateObject var viewModel: FrameworkDetailViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            Image(viewModel.framework.imageName)
                .resizable()
                .frame(width: 90, height: 90)
            Text(viewModel.framework.name)
                .font(.system(size: 24, weight: .bold))
            Text(viewModel.framework.description)
                .font(.system(size: 16))
            
            Spacer()
            
            Button(action: {
                viewModel.isPresented = true
            }, label: {
                Text("Learn More")
                    .font(.system(size: 20,weight: .bold))
                    .foregroundColor(.white)
            })
            .frame(maxWidth: .infinity, minHeight: 80)
            .background(.pink)
            .cornerRadius(40)
        }
        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
        .sheet(isPresented: $viewModel.isPresented, content: {
            SafariView(url: URL(string: viewModel.framework.urlString)!)
        })
    }
}

#Preview {
    FrameworkDetailView(viewModel: FrameworkDetailViewModel(framework: AppleFramework.list[0]))
}
