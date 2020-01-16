//
//  NumGeneratorView.swift
//  Generators
//
//  Created by Slavik on 11.01.2020.
//  Copyright © 2020 Slavik. All rights reserved.
//

import SwiftUI

struct NumGeneratorView: View {
    @State var randNum = "0"
    @State var min: String = "1"
    @State var max: String = "100"
    
    var body: some View {
        
        ScrollView {
            NumberArea(text: randNum)
            Text("")
            VStack (spacing: 30) {
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
                    if Int(self.min)! <= Int(self.max)! {
                        var timerLimit = 5
                        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
                            let number = Int.random(in: Int(self.min)! ... Int(self.max)!)
                            self.randNum = String(number)
                            timerLimit -= 1
                            
                            if (timerLimit == 0) {
                                timer.invalidate()
                            }
                        }
                    } else {
                        self.randNum = "error"
                    }
                    
                    
                    
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

struct NumberArea: View {
    let text: String
    
    var body: some View {
            Text(text)
                .font(.system(size: getSize() ))
                .frame(width: 350, height: 200)
        
    }
    
    func getSize() -> CGFloat {
        return CGFloat(260 - text.count*30)
    }
}
