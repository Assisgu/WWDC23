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
                    Spacer()
                    RoundedRectangle(cornerRadius: 30)
                        .padding(.top, 100)
                }
                .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.45)
            }
            .frame(width: geometry.size.width)
            
            //Image

                VStack{
                    Image("record")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.15)
                }
                .padding(.top, 30)

            
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
            .frame(width: geometry.size.width, height: geometry.size.height * 0.98, alignment: .bottom)
        } .ignoresSafeArea()
    }
}

struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView()
    }
}
