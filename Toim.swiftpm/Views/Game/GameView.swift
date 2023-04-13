//
//  SwiftUIView.swift
//  
//
//  Created by Gustavo Assis on 07/04/23.
//

import SwiftUI

struct GameView: View {
    
    @State var showCounter: Bool = false
    //    @State var startGame: Bool = false
    //    @State var gameOver: Bool = false
    //    @State var buttonPressed = false
    
    @StateObject var padsViewModel = PadsClass.shared
    
    private let padsGameView = PadsGame()
    
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Color(red: 89/255, green: 111/255, blue: 130/255)
                
                Image("guitar-game")
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                
                HStack{
                    Spacer()
                    if !padsViewModel.modeFree{
                        Text("Score: \(padsViewModel.scoreClass.score)")
                    }
                }
                .padding(.all, geometry.size.width * 0.05)
                .foregroundColor(.white)
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .top)
                
                
                VStack {
                    padsGameView
                }
                .frame(width: geometry.size.width * 0.24, height: geometry.size.height * 0.75)
                //                .frame(width: geometry.size.width * 0.24)
                
                HStack{
                    if padsViewModel.startGame && !padsViewModel.modeFree {
                        padsViewModel.playerCanplay ?
                        Text("  Sua vez amigo   ").background(.black) : Text("  Espera um pouco ").background(.red)
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height * 0.9, alignment: .bottom)
                .foregroundColor(.white)
                .font(.title)
                
                // Para aparecer em cima da view principal
                if showCounter {
                    CountView(showCounter: $showCounter, startGame: $padsViewModel.startGame)
                }
                
                if padsViewModel.gameOver{
                    //                    ZStack{
                    //                        Color(.black)
                    //                            .opacity(0.7)
                    //                    }  .frame(width: geometry.size.width, height: geometry.size.height)
                    
                    GameOverView(showCounter: $showCounter, gameOver: $padsViewModel.gameOver, hasHighScore: $padsViewModel.hasHighScore, currentScore: $padsViewModel.currentScore
                    )
                    
                    .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.8)
                }
                
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
        }
        .ignoresSafeArea()
        
        //        .navigationBarItems(
        //            trailing:
        //                Button("Quit") {
        //                    dismiss()
        //                }
        //        )
        
        .onAppear{
            showCounter = true
        }
        
        .onDisappear{
            //Criar funcao de zerar tudo
            padsViewModel.gameSequence.removeAll()
            padsViewModel.startGame = false
        }
        
        
        
        .onChange(of: padsViewModel.startGame){ newValue in
            //Modo desafio
            if padsViewModel.startGame {
                padsGameView.padsViewModel.getSequence()
            }
            
            // Modo free
            // padsViewModel.playerCanplay = true
            // padsViewModel.modeFree = true

        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
