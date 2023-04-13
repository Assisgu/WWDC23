//
//  SwiftUIView.swift
//  
//
//  Created by Gustavo Assis on 09/04/23.
//

import SwiftUI

struct CountView: View {
    
    @State private var timeRemaning: Int = 3
    @Binding var showCounter: Bool
    @Binding var startGame: Bool
    
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack {
                    Color(.black)
                        .opacity(0.6)
                    Text("\(timeRemaning)")
                        .font(.system(size: geometry.size.width * 0.3) .weight(.ultraLight))
                        .foregroundColor(.white)
                }
                .ignoresSafeArea()
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)

        
        }
        
        .onReceive(timer) { time in
            if showCounter {
                if timeRemaning > 0 {
                    timeRemaning -= 1
                } else if timeRemaning == 0 {
                    self.showCounter = false
                    self.startGame = true
                    
                }
            
            }
        }
    }
    
    
}

//struct CountView_Previews: PreviewProvider {
//    static var previews: some View {
//        CountView()
//    }
//}
