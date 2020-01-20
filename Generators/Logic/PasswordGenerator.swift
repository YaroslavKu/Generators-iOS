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
    
    var availableChars = ""
    var password = ""
    
    if letters {
        availableChars += "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM"
    }
    if digits {
        availableChars += "12345678909876543210"
    }
    if symbols {
        availableChars += "!@#$%^&*()-+=_{}[]:;/?.,><"
    }
    
    for _ in 0 ..< len {
        let index = availableChars.index(availableChars.startIndex, offsetBy: Int.random(in: 0 ..< availableChars.count))
        password.append(availableChars[index])
    }
    
    return password
}
