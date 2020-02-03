//
//  LoremGeneratorView.swift
//  Generators
//
//  Created by Slavik on 03.02.2020.
//  Copyright © 2020 Slavik. All rights reserved.
//

import SwiftUI

struct LoremGeneratorView: View {
    @ObservedObject private var loremVM = LoremGeneratorViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack (alignment: .leading, spacing: 50) {
                ZStack(alignment: .topTrailing) {
                    ScrollView{
                        Text(self.loremVM.generatedText)
                            .font(.system(size: 22))
                            .frame(width: geometry.size.width-60, alignment: .leading)
                            .foregroundColor(Color.black)
                    }

                    // Copy text button
                    Button (action: {
                        print("link pressed")
                        UIPasteboard.general.string = self.loremVM.generatedText
                    }) {
                        Image("copyIcon2")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .cornerRadius(8)
                            .shadow(color: .init(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)), radius: 2)
                    
                    }.buttonStyle(PlainButtonStyle())
                    
                }.padding()
                 .background(Color.init(#colorLiteral(red: 0.87648068, green: 0.87648068, blue: 0.87648068, alpha: 1)))
                 .cornerRadius(20)
                 .shadow(radius: 3)

                VStack (spacing: 20) {
                    HStack {
                        TextField("numOF", text: self.$loremVM.numOf)
                            .frame(width: 100)
                            .multilineTextAlignment(.center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.decimalPad)
                        
                        Spacer()
                        
                        HStack (spacing: 2){
                            Text("\(self.loremVM.chosenType)")
                                .font(.system(size: 24))
                            Image("leftArrow")
                                .resizable()
                                .frame(width: 13, height: 17)
                            
                        }.contextMenu {
                            Button(action: {self.loremVM.chosenType = "Words"}) {Text("Words")}
                            Button(action: {self.loremVM.chosenType = "Sentences"}) {Text("Sentences")}
                            Button(action: {self.loremVM.chosenType = "Paragraphs"}) {Text("Paragraphs")}
                            Button(action: {self.loremVM.chosenType = "Tweet"}) {Text("Tweet")}
                            Button(action: {self.loremVM.chosenType = "Name"}) {Text("Name")}
                            Button(action: {self.loremVM.chosenType = "Email"}) {Text("Email")}
                        }
                        
                    }.padding()
                     .background(Color.init(#colorLiteral(red: 0.87648068, green: 0.87648068, blue: 0.87648068, alpha: 1)))
                     .cornerRadius(20)
                
                    Button (action: {
                        self.loremVM.generateLorem()
                        
                    }) {
                        ButtonView(text: "Generate")
                    }.buttonStyle(PlainButtonStyle())
                }
                
            }.padding()
        }
    }
}

struct LoremGeneratorView_Previews: PreviewProvider {
    static var previews: some View {
        LoremGeneratorView()
    }
}
