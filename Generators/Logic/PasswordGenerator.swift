//
//  PasswordGenerator.swift
//  Generators
//
//  Created by Slavik on 20.01.2020.
//  Copyright © 2020 Slavik. All rights reserved.
//

import Foundation

func generatePassword(letters: Bool, digits: Bool, symbols: Bool, len: Int) -> String {
    if !letters && !digits && !symbols {
        return "error"
    }
    
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
    
    for _ in 0 ..< len {
        //  random index of avaivable symbols
        let index = availableSymbols.index(availableSymbols.startIndex, offsetBy: Int.random(in: 0 ..< availableSymbols.count))

        password.append(availableSymbols[index])
    }
    
    return password
}
