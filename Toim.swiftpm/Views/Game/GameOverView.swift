//
//  SwiftUIView.swift
//  
//
//  Created by Gustavo Assis on 08/04/23.
//

import SwiftUI

struct GameOverView: View {
//    @State var highScore: Bool = false
    
    @Binding var showCounter: Bool
    @Binding var gameOver: Bool
    @Binding var hasHighScore: Bool
    @Binding var currentScore: Int
//    @Binding var startGame: Bool
    
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Color(.black)
                    .opacity(0.6)
            }
            //Buttons
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(.white)
                        .opacity(0.6)
                    
                    VStack(spacing: 0) {
                        HStack {
                            Text("Você fez \(currentScore) pontos")
                        }.frame(height: geometry.size.height * 0.1)
                        Divider()
                        HStack {
                            Button {
                                self.gameOver = false
                                self.showCounter = true
//                                self.startGame = false
//                                self.currentScore = 0
//                                self.highScore = false

                            } label: {
                                Text("Try again")
                                    .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.1)
                            }
                            
                        }.frame(height: geometry.size.height * 0.1)
                        Divider()
                        HStack {
                            Button {
                                self.gameOver = false
//                                self.currentScore = 0
//                                self.highScore = false
                                dismiss()
                            } label: {
                                Text("Quit")
                                    .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.1)
                            }
                            
                        }.frame(height: geometry.size.height * 0.1)
                    }.font(.system(.title))
                        .foregroundColor(.black)
                    
                }
                .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.3)
                .padding(.top, geometry.size.height * 0.1)
                
            }
            .frame(width: geometry.size.width)
            
            //Image
            VStack{
                if hasHighScore {
                    Image("record")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.15)
                } else {
                    Image("gameOver")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.15)
                }
                
            }
            .padding(.top, 30)
            
            //Image
            VStack {
                VStack{
                    if hasHighScore {
                        Image("toim-record")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else {
                        Image("toim-gameOver")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
                .frame(height: geometry.size.height * 0.6)
                
            }
            .frame(width: geometry.size.width, height: geometry.size.height * 0.98, alignment: .bottom)
        }
        .ignoresSafeArea()
        
        .onDisappear{
            self.currentScore = 0
            self.hasHighScore = false
        }
    }
}

//struct GameOverView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameOverView()
//    }
//}
