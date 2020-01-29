//
//  FlipCoinViewModel.swift
//  Generators
//
//  Created by Slavik on 29.01.2020.
//  Copyright © 2020 Slavik. All rights reserved.
//

import Foundation
import SwiftUI

class FlipCoinViewModel: ObservableObject {
    @Published var isFlipped = false
    @Published var flipAmount = 0.0
    @Published var side = "It's tails!"
    
    func runRotateCoinAmimation() {
        playSound(sound: "Sounds/coinflip", format: "mp3")
        rotateCoin()
        changeSide()
    }
    
    private func rotateCoin() {
        withAnimation(Animation.easeIn(duration: 0.9)) {
            self.flipAmount += 1080     // rotete coin 3 times
        }
    }
    
    private func changeSide() {
        var flipTimerLimit = 4
        
        // change heads and tails 6 times (onse every 180 degrees)
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
    }
}
