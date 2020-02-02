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
    @Published var chosenType: String = "words"  // Chosen type to generate (words, sentences etc)
    @Published var types: [String] = ["words", "sentences", "paragraphs", "tweet", "title", "name", "email"]
    @Published var numOf: Int = 3
    
    
    //MARK: - Methods
    func generateLorem() {
        switch chosenType {
        case "words":
            generatedText = Lorem.words(numOf)
        case "sentences":
            generatedText = Lorem.sentences(numOf)
        case "paragraphs":
            generatedText = Lorem.paragraphs(numOf)
        case "tweet":
            generatedText = Lorem.tweet
        case "title":
            generatedText = Lorem.title
        case "name":
            generatedText = Lorem.fullName
        case "email":
            generatedText = Lorem.emailAddress
        default:
            generatedText = "error"
        }
    }
    
}
