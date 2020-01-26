//
//  GenerateRandomNumber.swift
//  Generators
//
//  Created by Slavik on 17.01.2020.
//  Copyright © 2020 Slavik. All rights reserved.
//

import Foundation

func generateRandomNumber(min: String, max: String) -> String {
    
    if min.count == 0 || max.count == 0 {
        return "error"
    }
    else if min > max  {
        return "error"
    } else {
       return String(Int.random(in: Int(min)! ... Int(max)!))
    }
}
