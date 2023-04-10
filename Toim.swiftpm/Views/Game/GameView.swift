//
//  SwiftUIView.swift
//  
//
//  Created by Gustavo Assis on 07/04/23.
//

import SwiftUI

struct GameView: View {
    
    @State var showCounter: Bool = false
    
    
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
                    PadsGame()
                }
                .frame(width: geometry.size.width * 0.24, height: geometry.size.height * 0.75)
                
                // Para aparecer em cima da view principal
                if showCounter {
                    CountView(showCounter: $showCounter)
                }
                
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            
        }
        .ignoresSafeArea()
        .onAppear{
            showCounter = true
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}