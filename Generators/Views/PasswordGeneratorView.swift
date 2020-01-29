//
//  PasswordGeneratorView.swift
//  Generators
//
//  Created by Slavik on 16.01.2020.
//  Copyright © 2020 Slavik. All rights reserved.
//

import SwiftUI

struct PasswordGeneratorView: View {
    @ObservedObject private var passGeneratorVM = PasswordGeneratorViewModel()
    
    
    var body: some View {
        ScrollView {
            VStack (spacing: 25) {
                HStack {
                    
                    Text(self.passGeneratorVM.password)
                        .font(.system(size: passGeneratorVM.getSize()))
                    
                    Spacer()
                    
                    // Copy password button
                    Button (action: {
                        print("link pressed")
                        UIPasteboard.general.string = self.passGeneratorVM.password
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
                    Toggle(isOn: $passGeneratorVM.letters) {
                        Text("Letters")
                    }

                        
                    Toggle(isOn: $passGeneratorVM.digits) {
                        Text("Digits")
                    }
                        
                    Toggle(isOn: $passGeneratorVM.symbols) {
                        Text("Symbols")
                    }
                    
                    VStack (alignment: .leading) {
                        Text("Password length: \(Int(passGeneratorVM.passLen))")
                            .font(.system(size: 24))
                        Slider(value: $passGeneratorVM.passLen, in: 6...24, step: 1.0)
                            // change color of slider depend on chosen length
                            .accentColor(passGeneratorVM.passLen < 12 ? .red : .green)
                    }
                    .padding(.top, 10.0)
                }.padding(.vertical)
                
                // Generate password button
                Button (action: {
                    print("generate pressed")
                    self.passGeneratorVM.generatePassword()
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
