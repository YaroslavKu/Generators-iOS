//
//  FlipCoinView.swift
//  Generators
//
//  Created by Slavik on 13.01.2020.
//  Copyright © 2020 Slavik. All rights reserved.
//

import SwiftUI

struct FlipCoinView: View {
    @ObservedObject private var flipCoinVM = FlipCoinViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                VStack(spacing: 15) {
                    // show coin's side depend on random boolean value
                    Image(flipCoinVM.isFlipped ? "coinHead" : "coinTail")
                        .resizable()
                        .frame(width: 250, height: 250)
                        .rotation3DEffect(.degrees(flipCoinVM.flipAmount), axis: (x: 1.0, y: 0.0, z: 0.0))
                        .shadow(radius: 4)
                    
                    
                    Text(self.flipCoinVM.side)
                        .font(.system(size: 25))
                    }
                
                Button(action: {
                    self.flipCoinVM.runRotateCoinAmimation()
                }) {
                    ButtonView(text: "Flip")
                }.buttonStyle(PlainButtonStyle())
                
            }.padding()
        }
    }
}

struct FlipCoinView_Previews: PreviewProvider {
    static var previews: some View {
        FlipCoinView()
    }
}
