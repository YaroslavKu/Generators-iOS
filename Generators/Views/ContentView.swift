//
//  ContentView.swift
//  Generators
//
//  Created by Slavik on 11.01.2020.
//  Copyright © 2020 Slavik. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack (spacing: 18) {
                    
                    NavigationLink(destination: NumGeneratorView()) {
                        ButtonView(text: "Numbers")
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    NavigationLink(destination: FlipCoinView()) {
                        ButtonView(text: "Flip a coin")
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    NavigationLink(destination: PasswordGeneratorView()) {
                        ButtonView(text: "Passwords")
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    NavigationLink(destination: LoremGeneratorView()) {
                        ButtonView(text: "Lorem Ipsum")
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                }.padding()
                
            }.navigationBarTitle(Text("Generators"), displayMode: .automatic)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
