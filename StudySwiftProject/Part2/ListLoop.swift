//
//  ListLoop.swift
//  StudySwiftProject
//
//  Created by 심관혁 on 11/30/23.
//  Part 2. Ch 2. 01. 리스트와 반복
//  Part 2. Ch 2. 02. 데이터 모델링
//  Part 2. Ch 2. 03. 리스트의 추가와 삭제

import SwiftUI

struct Fruit: Hashable{
    let name: String
    let matchFruitName: String
    let price: Int
}

struct ListLoop: View {
    
    @State var favoriteFruits = [
        Fruit(name: "Apple", matchFruitName: "Banana", price: 1000),
        
        Fruit(name: "Banana", matchFruitName: "Banana", price: 3000),
        
        Fruit(name: "Cherry", matchFruitName: "Date", price: 4000),
        
        Fruit(name: "Date", matchFruitName: "Elderberry", price: 2400),
        
        Fruit(name: "Elderberry", matchFruitName: "Cherry", price: 8000),
    ]
    
    @State var fruitName: String = ""
    
    var body: some View {
        NavigationStack{
            
            VStack{
                HStack{
                    TextField("insert fruit name", text:$fruitName)
                    Button(action: {
                        favoriteFruits.append(Fruit(name: fruitName, matchFruitName: "Apple", price: 1000))
                    }, label: {
                        Text("Insert")
                            .padding()
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    })
                }
                .padding()
                List {
                    ForEach(favoriteFruits,id: \.self){ fruit in
                        VStack(alignment: .leading){
                            Text("name: \(fruit.name)")
                            Text("matchFruitName: \(fruit.matchFruitName)")
                            Text("price: \(fruit.price)")
                        }
                    }.onDelete(perform: { indexSet in
                        favoriteFruits.remove(atOffsets: indexSet)
                    })
                }
                .navigationTitle("Fruit List")
            }
            
        }
    }
}

#Preview {
    ListLoop()
}

