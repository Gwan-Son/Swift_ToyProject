//
//  ListLoop.swift
//  StudySwiftProject
//
//  Created by 심관혁 on 11/30/23.
//  Part 2. Ch 2. 01. 리스트와 반복

import SwiftUI

struct Fruit{
    let name: String
    let matchFruitName: String
    let price: Int
}

struct ListLoop: View {
    
    var favoriteFruits = [
        Fruit(name: "Apple", matchFruitName: "Banana", price: 1000),
        
        Fruit(name: "Banana", matchFruitName: "Banana", price: 3000),
        
        Fruit(name: "Cherry", matchFruitName: "Date", price: 4000),
        
        Fruit(name: "Date", matchFruitName: "Elderberry", price: 2400),
        
        Fruit(name: "Elderberry", matchFruitName: "Cherry", price: 8000),
    ]
    
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(favoriteFruits,id: \.self){ fruit in
                    HStack{
                        Text(fruit.name)
                        Text(fruit.price)
                    }
                }
            }
            .navigationTitle("Fruit List")
        }
    }
}

#Preview {
    ListLoop()
}

