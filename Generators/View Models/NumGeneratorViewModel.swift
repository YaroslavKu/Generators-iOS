//
//  NumGeneratorViewModel.swift
//  Generators
//
//  Created by Slavik on 29.01.2020.
//  Copyright © 2020 Slavik. All rights reserved.
//

import Foundation
import SwiftUI

class NumGeneratorViewModel: ObservableObject {
    //MARK: - Variables
    @Published var randNum: String = UserDefaults.standard.string(forKey: "randNum") ?? "47" {
        didSet {
            UserDefaults.standard.set(self.randNum, forKey: "randNum")
        }
    }
    
    @Published var min: String = UserDefaults.standard.string(forKey: "min") ?? "1" {
        didSet {
            UserDefaults.standard.set(self.min, forKey: "min")
        }
    }
    
    @Published var max: String = UserDefaults.standard.string(forKey: "max") ?? "100" {
        didSet {
            UserDefaults.standard.set(self.max, forKey: "max")
        }
    }
    
    
    //MARK: - Public Methods
    func runGenerateAnimation() {
        var timerLimit = 8
        
        // generate ramdom numbers 8 times in order to simulate a iterate
        Timer.scheduledTimer(withTimeInterval: 0.06, repeats: true) { timer in
            self.generateRandomNumber()
            timerLimit -= 1
                
            if (timerLimit == 0) {
                timer.invalidate()
            }
        }
    }
        
    
    //MARK: - Private Methods
    private func generateRandomNumber() {
        if min.count == 0 || max.count == 0 {
            randNum = "Error"
        }
        else if Int(min)! > Int(max)! {
            randNum = "Error"
        } else {
           randNum = String(Int.random(in: Int(min)! ... Int(max)!))
        }
    }
}
