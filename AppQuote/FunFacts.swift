//
//  FunFacts.swift
//  AppQuote
//
//  Created by Patrice white on 10/16/16.
//  Copyright © 2016 Patrice white. All rights reserved.
//

import Foundation

struct Facts{
    
    //store quotes in array
    
    let factsArray = [
        
    "There is no sincerer love than the love of food.",
    
    "One cannot think well, love well, sleep well, if one has not dined well.",
    
    "Eating is not merely a material pleasure. Eating well gives a spectacular joy to life and contributes immensely to goodwill and happy companionship. It is of great importance to the morale.",
    
    "Anything is good if it's made of chocolate.",
    
    "Life expectancy would grow by leaps and bounds if green vegetables smelled as good as bacon.",
    
    "So long as you have food in your mouth, you have solved all questions for the time being."
    
    ]
    
    // make a random quote
    
    func randomFact() -> String {
        
        let arrayCount = UInt32(factsArray.count)
        let randomNumberCount = arc4random_uniform(arrayCount)
        let randomNumber = Int(randomNumberCount)
        
        return factsArray[randomNumber]
    }
    
}
