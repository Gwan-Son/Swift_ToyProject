//
//  FrameworkCell.swift
//  AppleFramework_SwiftUI
//
//  Created by 심관혁 on 4/17/24.
//

import SwiftUI

struct FrameworkCell: View {
    
    @Binding var framework: AppleFramework
    
    var body: some View {
        VStack {
            Image(framework.imageName)
                .resizable()
                .scaledToFit()
            
            Spacer()
            
            Text(framework.name)
                .font(.system(size: 16,weight: .bold))
            
            Spacer()
        }
    }
}

#Preview {
    FrameworkCell(framework: .constant(AppleFramework.list[0]))
}
