//
//  SwiftUIView.swift
//  
//
//  Created by Gustavo Assis on 07/04/23.
//

import SwiftUI

// MARK: - GameView
/* Creates the game view */

struct GameView: View {
    private let padsGameView = PadsGame()
    @Binding var modeFree: Bool
    @State var showCounter: Bool = false
    @StateObject var padsViewModel = PadsClass.shared
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                if padsViewModel.playerCanplay {
                    Color(uiColor: UIColor(red: 0.179, green: 0.356, blue: 0.512, alpha: 1))
                } else {
                    Color(uiColor: UIColor(red: 0.164, green: 0.233, blue: 0.292, alpha: 1))
                }
                
                Image("guitar-game")
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                
                HStack{
                    Spacer()
                    if !padsViewModel.modeFree{
                        Text("Score: \(padsViewModel.scoreClass.score)")
                            .font(.system(.title, design: .rounded).weight(.medium))
                    }
                }
                .padding(.all, geometry.size.width * 0.05)
                .foregroundColor(.white)
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .top)
                
                VStack {
                    padsGameView
                }
                .frame(width: geometry.size.width * 0.24, height: geometry.size.height * 0.75)
                
                HStack{
                    VStack{
                        if padsViewModel.startGame && !padsViewModel.modeFree {
                            padsViewModel.playerCanplay ?
                            Text("  You turn to play   ") : Text("  Memorize the sequence ")
                            
                        }
                    }
                    .foregroundColor(.white)
                    .background(.black)
                    .font(.system(.title, design: .rounded).weight(.light))
                }
                .frame(width: geometry.size.width, height: geometry.size.height * 0.9, alignment: .bottom)

                if showCounter {
                    CountView(showCounter: $showCounter, startGame: $padsViewModel.startGame)
                }
                
                if padsViewModel.gameOver{
                                        ZStack{
                                            Color(.black)
                                                .opacity(0.9)
                                            
                                            GameOverView(showCounter: $showCounter, gameOver: $padsViewModel.gameOver, hasHighScore: $padsViewModel.hasHighScore, currentScore: $padsViewModel.currentScore
                                            )
                                            .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.8)
                                            
                                        }  .frame(width: geometry.size.width, height: geometry.size.height)

                }
                
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
        }
        .ignoresSafeArea()
           
        .onAppear{
            showCounter = true
            padsViewModel.gameOver = false
        }
        
        .onDisappear{
            padsViewModel.currentScore = 0
            padsViewModel.resetAll()
        }
        
        .onChange(of: padsViewModel.startGame){ newValue in
            if modeFree {
                padsViewModel.startFree()
            } else if padsViewModel.startGame {
                padsGameView.padsViewModel.startChallenge()
            }
        }
    }
}
