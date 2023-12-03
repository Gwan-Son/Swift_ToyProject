//
//  Exception.swift
//  StudySwiftProject
//
//  Created by 심관혁 on 11/28/23.
//  Ch 4. 01. 예외처리

import SwiftUI

struct Exception: View {
    
    @State var inputNumber = ""
    @State var resultNumber: Float = 0
    
    var body: some View {
        VStack{
            TextField("나눌 숫자를 입력해주세요", text: $inputNumber)
            Text("나눈 결과는 다음과 같아요 \(resultNumber)")
            Button(action: {
                do{
                    try resultNumber = devideTen(with: Float(inputNumber) ?? 1.0)
                } catch DivideError.dividedZero{
                    print("0으로 나누었대요.")
                    resultNumber = -1
                }
                catch{
                    print(error.localizedDescription)
                }
            }, label: {
                Text("나누기")
            })
        }
    }
    
    func devideTen(with inputNumber: Float) throws -> Float{
        var result: Float = 0
        
        if(inputNumber == 0){
            throw DivideError.dividedZero
        } else{
            result = 10 / inputNumber
        }
        
        return result
    }
}

enum DivideError: Error{
    case dividedZero
}

#Preview {
    Exception()
}
