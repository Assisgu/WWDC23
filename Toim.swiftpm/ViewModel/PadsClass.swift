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
    
    func turnOnLight(color: Int){
        switch color {
        case 1:
            self.lightGreen = true
            delay(0.8){
                withAnimation{
                    self.lightGreen = false
                }
            }
            
        case 2:
            self.lightYellow = true
            delay(0.8){
                withAnimation{
                    self.lightYellow = false
                }
            }
            
        case 3:
            self.lightRed = true
            delay(0.8){
                withAnimation{
                    self.lightRed = false
                }
            }
            
        case 4:
            self.lightBlue = true
            delay(0.8){
                withAnimation{
                    self.lightBlue = false
                }
            }
            
        default:
            break
        }
    }
    
    func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
}
