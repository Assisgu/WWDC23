//
//  File.swift
//  
//
//  Created by Gustavo Assis on 09/04/23.
//

import Foundation

class Score {
    
    var score: Int = 0
    var highScore: Int {
        get { return UserDefaults.standard.integer(forKey: "highScore")}
        set { UserDefaults.standard.set(newValue, forKey: "highScore")}
    }
    
    func addScore(){
        score += 1
    }
    
    func saveHighScore() -> Bool{
        if score > highScore {
            highScore = score
            return true
        }
        return false
    }
    
    func resetScore(){
        score = 0
    }

}
