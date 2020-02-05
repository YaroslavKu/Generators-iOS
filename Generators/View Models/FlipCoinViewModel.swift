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
    //MARK: - Variables
    @Published var isFlipped = false
    @Published var flipAmount = 0.0
    @Published var side = "It's tails!"
    
    @Published var statHeads: Int = UserDefaults.standard.integer(forKey: "statHeads") {
        didSet {
            UserDefaults.standard.set(self.statHeads, forKey: "statHeads")
        }
    }
    
    @Published var statTails: Int = UserDefaults.standard.integer(forKey: "statTails") {
        didSet {
            UserDefaults.standard.set(self.statTails, forKey: "statTails")
        }
    }
    
    
    //MARK: - Public Methods
    func runRotateCoinAmimation() {
        playSound(sound: "Sounds/coinflip", format: "mp3")
        rotateCoin()
        changeSide()
    }
    
    //MARK: - Private Methods
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
                    self.statHeads += 1
                } else {
                    self.side = "Ir's tails!"
                    self.statTails += 1
                }
                
                timer.invalidate()
            }
        }
    }
}
