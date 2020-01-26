//
//  PasswordGeneratorView.swift
//  Generators
//
//  Created by Slavik on 16.01.2020.
//  Copyright © 2020 Slavik. All rights reserved.
//

import SwiftUI

struct PasswordGeneratorView: View {
    @State var passLen: Double = 12.0
    @State var password = "password"
    @State var letters  = true
    @State var digits   = true
    @State var symbols  = true
    
    
    var body: some View {
        ScrollView {
            VStack (spacing: 25) {
                HStack {
                    
                    Text(self.password)
                        // scale text lown to fit in fixed width
                        .font(.system(size: self.password.count > 12 ?
                            CGFloat(36 - 36*Float(self.password.count)/50) : 36))
                    
                    Spacer()
                    
                    // Copy password button
                    Button (action: {
                        print("link pressed")
                        UIPasteboard.general.string = self.password
                    }) {
                        Image("copyIcon2")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .cornerRadius(8)
                            .shadow(color: .init(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), radius: 2.5)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .frame(height: 100)
                
                VStack {
                    Toggle(isOn: $letters) {
                        Text("Letters")
                    }

                        
                    Toggle(isOn: $digits) {
                        Text("Digits")
                    }
                        
                    Toggle(isOn: $symbols) {
                        Text("Symbols")
                    }
                    
                    VStack (alignment: .leading) {
                        Text("Password length: \(Int(passLen))")
                            .font(.system(size: 24))
                        Slider(value: $passLen, in: 6...24, step: 1.0)
                            // change color of slider depend on chosen length
                            .accentColor(passLen < 12 ? .red : .green)
                    }
                    .padding(.top, 10.0)
                }.padding(.vertical)
                
                // Generate password
                Button (action: {
                    print("generate pressed")
                    self.password = generatePassword(letters: self.letters, digits: self.digits,
                                                     symbols: self.symbols, len: Int(self.passLen))
                }) {
                    ButtonView(text: "Generate")
                }
            }.padding()
        }
    }
}

struct PasswordGeneratorView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordGeneratorView()
    }
}
