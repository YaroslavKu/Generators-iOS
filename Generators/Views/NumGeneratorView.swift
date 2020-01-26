//
//  NumGeneratorView.swift
//  Generators
//
//  Created by Slavik on 11.01.2020.
//  Copyright © 2020 Slavik. All rights reserved.
//

import SwiftUI

struct NumGeneratorView: View {
    @State var randNum = "47"
    @State var min: String = "1"
    @State var max: String = "100"
    
    var body: some View {
        
        ScrollView {
            NumberArea(text: randNum)

            VStack (spacing: 35) {
                
                // min & max field
                HStack (spacing: 40) {
                    VStack(alignment: .leading, spacing: 1) {
                        Text("min")
                            .fontWeight(.light)
                            .foregroundColor(Color.gray)
                            .font(.system(size: 20))
                        TextField("min", text: $min)
                            .multilineTextAlignment(.center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.decimalPad)
                    }
                    VStack (alignment: .leading, spacing: 1) {
                        Text("max")
                        .fontWeight(.light)
                        .foregroundColor(Color.gray)
                        .font(.system(size: 20))
                        TextField("max", text: $max)
                            .multilineTextAlignment(.center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.decimalPad)
                    }
                }
                
                Button(action: {
                    
                    // generate ramdom numbers 8 times in order to simulate a iterate
                    var timerLimit = 8
                    Timer.scheduledTimer(withTimeInterval: 0.06, repeats: true) { timer in
                        
                        self.randNum = generateRandomNumber(min: self.min, max: self.max)
                        timerLimit -= 1
                            
                        if (timerLimit == 0) {
                            timer.invalidate()
                        }
                    }
                    
                }) {
                    ButtonView(text: "Generate")
                }.buttonStyle(PlainButtonStyle())
            }.padding()
            
        }
        
    }
}

struct NumberArea: View {
    let text: String
    
    var body: some View {
            Text(text)
                .font(.system(size: getSize() ))
                .frame(width: 350, height: 200)
        
    }
    
    // scale text lown to fit in fixed width
    func getSize() -> CGFloat {
        return CGFloat(260 - text.count*30)
    }
}

struct NumGeneratorView_Previews: PreviewProvider {
    static var previews: some View {
        NumGeneratorView()
    }
}
