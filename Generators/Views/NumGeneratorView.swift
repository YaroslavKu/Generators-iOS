//
//  NumGeneratorView.swift
//  Generators
//
//  Created by Slavik on 11.01.2020.
//  Copyright © 2020 Slavik. All rights reserved.
//

import SwiftUI

struct NumGeneratorView: View {
    @ObservedObject private var numGeneratorVM = NumGeneratorViewModel()
    
    var body: some View {
        ScrollView {
            Text(numGeneratorVM.randNum)
                .frame(width: 350, height: 200)
                .lineLimit(1)
                .font(.system(size: 230))
                .minimumScaleFactor(CGFloat(200) / (CGFloat(numGeneratorVM.randNum.count * 100)))


            VStack (spacing: 35) {
                
                // min & max field
                HStack (spacing: 40) {
                    VStack(alignment: .leading, spacing: 1) {
                        Text("min")
                            .fontWeight(.light)
                            .foregroundColor(Color.gray)
                            .font(.system(size: 20))
                        TextField("min", text: $numGeneratorVM.min)
                            .multilineTextAlignment(.center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.decimalPad)
                    }
                    VStack (alignment: .leading, spacing: 1) {
                        Text("max")
                        .fontWeight(.light)
                        .foregroundColor(Color.gray)
                        .font(.system(size: 20))
                        TextField("max", text: $numGeneratorVM.max)
                            .multilineTextAlignment(.center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.decimalPad)
                    }
                }
                
                Button(action: {
                    self.numGeneratorVM.runGenerateAnimation()
                }) {
                    ButtonView(text: "Generate")
                }.buttonStyle(PlainButtonStyle())
                
            }.padding()
            
        }
        
    }
}

struct NumGeneratorView_Previews: PreviewProvider {
    static var previews: some View {
        NumGeneratorView()
    }
}
