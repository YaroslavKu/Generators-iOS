//
//  PasswordGeneratorViewModel.swift
//  Generators
//
//  Created by Slavik on 29.01.2020.
//  Copyright © 2020 Slavik. All rights reserved.
//

import Foundation
import SwiftUI

class PasswordGeneratorViewModel: ObservableObject {
    @Published var passLen: Double = 12.0
    @Published var password = "password"
    @Published var letters  = true
    @Published var digits   = true
    @Published var symbols  = true
    
    // scale text lown to fit in fixed width
    func getSize() -> CGFloat {
        if passLen > 12 {
            return CGFloat(36 - 36*Float(self.password.count)/50)
        } else {
            return 36
        }
    }
    
    func generatePassword() {
        if !self.letters && !self.digits && !self.symbols {
            self.password = "error"
        } else {
            var availableSymbols = ""
            var password = ""
            
            if letters {
                availableSymbols += "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM"
            }
            if digits {
                availableSymbols += "12345678909876543210"
            }
            if symbols {
                availableSymbols += "!@#$%^&*()-+=_{}[]:;/?.,><"
            }
            
            for _ in 0 ..< Int(passLen) {
                //  random index of avaivable symbols
                let index = availableSymbols.index(availableSymbols.startIndex, offsetBy: Int.random(in: 0 ..< availableSymbols.count))

                password.append(availableSymbols[index])
            }
            
            self.password = password
        }
        
    }
}
