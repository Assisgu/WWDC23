//
//  SwiftUIView.swift
//  
//
//  Created by Gustavo Assis on 07/04/23.
//

import SwiftUI

struct GameView: View {
    
    @State var showCounter: Bool = false
    @State var startGame: Bool = false
    @State var playerCan: Bool = false
    
    private let padsGameView = PadsGame()
    
//    @ObservedObject var padsViewModel = PadsClass()
  

    
    
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
                    Text("Score: 13")
                }
                .padding(.all, geometry.size.width * 0.05)
                .foregroundColor(.white)
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .top)
                
                
                VStack {
                    padsGameView
//                    PadsGame()
                }
                .frame(width: geometry.size.width * 0.24, height: geometry.size.height * 0.85)
//                .frame(width: geometry.size.width * 0.24)
                
                HStack{
                    if startGame {
//                        messageView
//                        if padsGameView.padsViewModel.playerCanplay {
//                            Text("  Pode jogar amigao   ")
//                                .font(.system(.title, design: .rounded) .weight(.semibold))
//                                .foregroundColor(.white)
//                                .background(.black)
//                                .opacity(0.85)
//                        }
                        
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height * 0.9, alignment: .bottom)
                
                
                
                
                // Para aparecer em cima da view principal
                if showCounter {
                    CountView(showCounter: $showCounter, startGame: $startGame)
                }
                
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            
        }
        .ignoresSafeArea()
        .onAppear{
            showCounter = true
            
        }
        
        .onChange(of: startGame){ newValue in
            //Aqui é so para modo desafio
            padsGameView.padsViewModel.getSequence()
            
            
            //            print("\(padsGame.padsViewModel.gameSequence)")
        }
    }
    
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
