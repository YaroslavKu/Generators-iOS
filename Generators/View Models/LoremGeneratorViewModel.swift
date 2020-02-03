//
//  LoremGeneratorViewModel.swift
//  Generators
//
//  Created by Slavik on 03.02.2020.
//  Copyright © 2020 Slavik. All rights reserved.
//

import Foundation
import LoremSwiftum

class LoremGeneratorViewModel: ObservableObject {
    //MARK: - Variables
    @Published var generatedText: String = "Lorem Ipsum"
    @Published var chosenType: String = "Coose"  // Chosen type to generate (words, sentences etc)
    @Published var numOf: String = "3"
    
    
    //MARK: - Methods
    func generateLorem() {
        switch chosenType {
        case "Words":
            generatedText = Lorem.words(Int(numOf)!)
        case "Sentences":
            generatedText = Lorem.sentences(Int(numOf)!)
        case "Paragraphs":
            generatedText = Lorem.paragraphs(Int(numOf)!)
        case "Tweet":
            generatedText = Lorem.tweet
        case "Title":
            generatedText = Lorem.title
        case "Name":
            generatedText = Lorem.fullName
        case "Email":
            generatedText = Lorem.emailAddress
        default:
            generatedText = "Error"
        }
    }
    
}
