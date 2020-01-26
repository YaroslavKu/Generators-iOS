//
//  FlipCoinView.swift
//  Generators
//
//  Created by Slavik on 13.01.2020.
//  Copyright © 2020 Slavik. All rights reserved.
//

import SwiftUI


struct FlipCoinView: View {
    @State private var isFlipped = false
    @State private var flipAmount = 0.0
    @State private var side = "It's tails!"
    
    var body: some View {
        ScrollView {
            
            VStack(spacing: 30) {
                
                VStack(spacing: 15) {
                    
                    // show coin's side depend on random boolean value
                    Image(isFlipped ? "coinHead" : "coinTail")
                        .resizable()
                        .frame(width: 250, height: 250)
                        .rotation3DEffect(.degrees(flipAmount), axis: (x: 1.0, y: 0.0, z: 0.0))
                        .shadow(radius: 4)
                    
                    
                    Text(self.side)
                        .font(.system(size: 25))
                    }
                
                Button(action: {
                    playSound(sound: "Sounds/coinflip", format: "mp3")
                    
                    // rotete coin 3 times
                    withAnimation(Animation.easeIn(duration: 0.9)) {
                        self.flipAmount += 1080
                    }
                    
                    // change heads and tails 6 times (onse every 180 degrees)
                    var flipTimerLimit = 4
                    Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
                        self.isFlipped.toggle()
                        flipTimerLimit -= 1
                        
                        // random side of coin
                        if (flipTimerLimit == 0) {
                            self.isFlipped = Bool.random()
                            if (self.isFlipped) {
                                self.side = "It's heads!"
                            } else {
                                self.side = "Ir's tails!"
                            }
                            
                            timer.invalidate()
                        }
                    }
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
