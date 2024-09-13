//
//  Onboarding.swift
//  StudySwiftProject
//
//  Created by 심관혁 on 11/30/23.
//  Part 2. Ch 1. 04. 실제 간단한 화면 하나만 그리기

import SwiftUI

struct Onboarding: View {
    var body: some View {
        VStack{
            Text("What's New in Photos")
                .font(.system(size: 35))
                .bold()
                .padding()
                .padding(.top,50)
            
            HStack{
                Image(systemName: "person.2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35)
                    .padding(.leading, 10)
                    .foregroundColor(.blue)

                VStack(alignment: .leading){
                    Text("Shared Library")
                        .font(.headline)
                    Text("Combine photos and videios with the people closest to you and automatically share new photos from Camera.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal,15)
            }
            .padding()
            
            HStack{
                Image(systemName: "arrow.left.arrow.right.square")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35)
                    .padding(.leading, 10)
                    .foregroundColor(.blue)
                
                VStack(alignment: .leading){
                    Text("Copy & Paste Edits")
                        .font(.headline)
                    Text("Save time by making edits to one photo, then applying the changes to other photos with tap.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal,15)
            }
            .padding()
            
            HStack{
                Image(systemName: "square.on.square")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35)
                    .padding(.leading, 10)
                    .foregroundColor(.blue)

                
                VStack(alignment: .leading){
                    Text("Merge Duplicates")
                        .font(.headline)
                    Text("Quickly find and merge all your duplicate photos and videos from one central place in the Albums tab.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal,15)
            }
            .padding()
            
            Spacer()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Continue")
                    .padding()
                    .frame(width: 350)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
            .padding(.bottom,60)
        }
    }
}

#Preview {
    Onboarding()
}
