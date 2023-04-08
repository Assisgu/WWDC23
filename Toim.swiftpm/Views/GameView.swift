//
//  SwiftUIView.swift
//  
//
//  Created by Gustavo Assis on 07/04/23.
//

import SwiftUI

struct GameView: View {
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
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.black)
                            .opacity(0.74)
                        VStack(spacing: geometry.size.height * 0.03) {
                            PadButton(color: .green)
                            PadButton(color: .yellow)
                            PadButton(color: .red)
                            PadButton(color: .blue)
                        }
                        .frame(width: geometry.size.width * 0.2, height: geometry.size.height * 0.7)
                        
                    }
                }.frame(width: geometry.size.width * 0.24, height: geometry.size.height * 0.75)
                    
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            
        }
        .ignoresSafeArea()

    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
