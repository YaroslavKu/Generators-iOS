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
                VStack (spacing: 15) {
                    NavigationLink(destination: NumGeneratorView()) {
                        ButtonView(imgName: "gradient2", text: "Numbers")
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    NavigationLink(destination: FlipCoinView()) {
                        ButtonView(imgName: "gradient2", text: "Flip a coin")
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    NavigationLink(destination: Text("Test")) {
                        ButtonView(imgName: "gradient2", text: "Roll the dice (x)")
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    NavigationLink(destination: Text("Test")) {
                        ButtonView(imgName: "gradient2", text: "Passwords (x)")
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    NavigationLink(destination: Text("Test")) {
                        ButtonView(imgName: "gradient2", text: "Words (x)")
                    }
                    .buttonStyle(PlainButtonStyle())
                }.padding()
            }
                
            .navigationBarTitle(Text("Generators"), displayMode: .automatic)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
