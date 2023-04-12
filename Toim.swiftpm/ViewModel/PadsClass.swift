//
//  File.swift
//  
//
//  Created by Gustavo Assis on 09/04/23.
//

import Foundation
import SwiftUI

class PadsClass: ObservableObject {
    
    @Published var lightGreen: Bool = false
    @Published var lightYellow: Bool = false
    @Published var lightRed: Bool = false
    @Published var lightBlue: Bool = false
    @Published var playerCanplay: Bool = false
    @Published var gameOver: Bool = false
    @Published var startGame: Bool = false
    @Published var hasHighScore: Bool = false
    @Published var currentScore: Int = 0
    
    var playerSequence = [String]()
    var gameSequence = [String]()
    var countTouchs: Int = 0
    
    let scoreClass = ScoreClass()
    static let shared = PadsClass()
    
    
    func turnOnLight(color: Int){
        switch color {
        case 1:
            lightGreen = true
            delay(0.8){
                withAnimation{
                    self.lightGreen = false
                }
            }
            if playerCanplay {
                self.playerSequence.append("green")
                self.countTouchs += 1
                checkTouchs(amountTouchs: countTouchs)
            }
            
        case 2:
            lightYellow = true
            delay(0.8){
                withAnimation{
                    self.lightYellow = false
                }
            }
            if playerCanplay {
                self.playerSequence.append("yellow")
                self.countTouchs += 1
                checkTouchs(amountTouchs: countTouchs)
            }
            
        case 3:
            lightRed = true
            delay(0.8){
                withAnimation{
                    self.lightRed = false
                }
            }
            if playerCanplay {
                self.playerSequence.append("red")
                self.countTouchs += 1
                checkTouchs(amountTouchs: countTouchs)
            }
            
        case 4:
            lightBlue = true
            delay(0.8){
                withAnimation{
                    self.lightBlue = false
                }
            }
            if playerCanplay {
                self.playerSequence.append("blue")
                self.countTouchs += 1
                checkTouchs(amountTouchs: countTouchs)
            }

        default:
            break
        }
    }
    
    func walksSequence(seq: [String]){
        let sequence = seq
        var count = 0.0
        
        for i in sequence {
            self.playerCanplay = false
            
            switch i {
            case "green":
                delay(count){
                    self.turnOnLight(color: 1)
                }
                count += 1.5
                
            case "yellow":
                delay(count){
                    self.turnOnLight(color: 2)
                }
                count += 1.5
                
            case "red":
                delay(count){
                    self.turnOnLight(color: 3)
                }
                count += 1.5
                
            case "blue":
                delay(count){
                    self.turnOnLight(color: 4)
                }
                count += 1.5
                
            default:
                print("default")
            }
        }
        
        delay(count){
            self.playerCanplay = true
            print("pode jogar agora")
        }
    }
    
    func generateSequence(seq: [String]) -> [String]{
        let number = Int.random(in: 1...4)
        var newSequence = seq
        var atualColor: String
        
        switch number {
        case 1:
            atualColor = "green"
        case 2:
            atualColor = "yellow"
        case 3:
            atualColor = "red"
        case 4:
            atualColor = "blue"
        default:
            atualColor = "undefined"
        }
        newSequence.append(atualColor)
        print("sequencia \(newSequence)")
        return newSequence
        
    }
    
    func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
    
    func getSequence(){
        self.gameSequence = generateSequence(seq: gameSequence)
        walksSequence(seq: gameSequence)
    }
    
    func starttGame(){
        getSequence()
    }
    
    func startFree(){
        
    }
    
    func checkTouchs(amountTouchs: Int){
        if amountTouchs >= self.gameSequence.count{
            self.playerCanplay = false
            
            if checkAnswer(sequence: gameSequence, playerSequence: self.playerSequence){
                delay(1.2){
                    self.getSequence()
                }
            } else {
                print("fim da linha 🕳️")
                self.playerSequence.removeAll()
                self.gameSequence.removeAll()

            }
        }
    }
    
    func checkAnswer(sequence: [String], playerSequence: [String]) -> Bool {
        if sequence == playerSequence {
            print("Acertou 🥶")
            self.playerSequence.removeAll()
            self.countTouchs = 0
            self.scoreClass.addScore()
            if self.scoreClass.saveHighScore() {
                self.hasHighScore = true
            }
            self.currentScore = self.scoreClass.score
            return true
        } else {
            print("Errou 😦")
            self.playerSequence.removeAll()
            self.gameSequence.removeAll()
            self.countTouchs = 0
            self.startGame = false
            self.gameOver = true
            self.scoreClass.resetScore()
            return false
        }
    }
    
}
