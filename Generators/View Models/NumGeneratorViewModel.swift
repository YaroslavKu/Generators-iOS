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
    @Published var randNum = "46"
    @Published var min: String = "1"
    @Published var max: String = "100"
    
    func getSize() -> CGFloat {
        return CGFloat(260 - randNum.count*30)
    }
    
    func generateRandomNumber() {
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
