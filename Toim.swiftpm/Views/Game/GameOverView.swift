//
//  SwiftUIView.swift
//  
//
//  Created by Gustavo Assis on 08/04/23.
//

import SwiftUI

struct GameOverView: View {

    
    @Binding var showCounter: Bool
    @Binding var gameOver: Bool
    @Binding var hasHighScore: Bool
    @Binding var currentScore: Int
    @State var classSound = SoundClass()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        GeometryReader { geometry in
            //Buttons
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(.white)
                        .opacity(0.75)
                    
                    VStack(spacing: 0) {
                        HStack {
                            Text("You scored \(currentScore) points")
                                .fontWeight(.light)
                        }.frame(height: geometry.size.height * 0.1)
                        Divider()
                        HStack {
                            Button {
                                self.gameOver = false
                                self.showCounter = true
                            } label: {
                                Text("Try again")
                                    .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.1)
                            }
                            
                        }.frame(height: geometry.size.height * 0.1)
                        Divider()
                        HStack {
                            Button {
                                self.gameOver = false
                                dismiss()
                            } label: {
                                Text("Quit")
                                    .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.1)
                            }
                            
                        }.frame(height: geometry.size.height * 0.1)
                    }.font(.system(.title) .weight(.medium))
                        .foregroundColor(.black)
                    
                }
                .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.3)
                .padding(.top, geometry.size.height * 0.1)
                
            }
            .frame(width: geometry.size.width)
            
            //Image banner
            VStack(){
                if hasHighScore {
                    Image("record")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.18)
                } else {
                    Image("gameOver")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.18)
                }
                
            }
            .padding(.top, -20)
            
            //Image person
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
            self.gameOver = false
        }
        .onAppear{
            if hasHighScore {
                classSound.playSounds("record")
            } else {
                classSound.playSounds("error")
            }
        }
    }
}
