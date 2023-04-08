//
//  SwiftUIView.swift
//  
//
//  Created by Gustavo Assis on 08/04/23.
//

import SwiftUI

struct GameOverView: View {
    var body: some View {
        GeometryReader { geometry in

           //Buttons
            ZStack{
                VStack {
                    RoundedRectangle(cornerRadius: 30)
                        .padding(.top, 100)
                }
                .frame(width: geometry.size.width * 0.8)
            }
            .frame(width: geometry.size.width, height: geometry.size.height * 0.45)
            
            //Image
            ZStack{
                VStack{
                    Image("record")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height * 0.15)
            
            VStack {
                //Image
                ZStack{
                        VStack{
                            Image("toim-record")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                }
                .frame(height: geometry.size.height * 0.6 )
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .bottom)
        } .ignoresSafeArea()
    }
}

struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView()
    }
}
