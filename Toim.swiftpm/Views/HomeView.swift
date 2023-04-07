//
//  SwiftUIView.swift
//  
//
//  Created by Gustavo Assis on 06/04/23.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack{
                Color(.systemCyan)
                
                Image("guitar")
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                
                HStack{
                    Button {
                        print("teste")
                    } label: {
                        Image(systemName: "info.circle")
                            .font(.system(size: geometry.size.width * 0.03))
                    }
                    Spacer()
                    Button {
                        print("config")
                    } label: {
                        Image(systemName: "gearshape")
                            .font(.system(size: geometry.size.width * 0.03))
                    }
                    
                }
                .padding(.all, geometry.size.width * 0.05)
                .foregroundColor(.white)
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .top)
                
                VStack{
                    Text ("High Score: 77")
                        .foregroundColor(.white)
                        .frame(alignment: .bottomLeading)
                    
                    Button {
                        print("oii")
                    } label: {
                        Text("START")
                            .font(.system(size: geometry.size.width * 0.07).weight(.bold))
                    }
                    .padding(.bottom, geometry.size.height * 0.02)
                    
                }
                .frame(height: geometry.size.height * 0.4)
                
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            
        }
        .ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
