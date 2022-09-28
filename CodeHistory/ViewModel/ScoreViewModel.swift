//
//  ScoreViewModel.swift
//  CodeHistory
//
//  Created by cecily li on 9/23/22.
//

import Foundation

struct ScoreViewModel {
    let correctGuesses: Int
    let incorrectGuesses: Int
    
    var percentage: Int {
        (correctGuesses * 100 / (correctGuesses + incorrectGuesses))
    }
}
