//
//  SwiftUIView.swift
//  
//
//  Created by Gustavo Assis on 06/04/23.
//

import SwiftUI

struct HomeView: View {
    @State var highScore: Bool = false
    @State var bestScore: Int = 0
    @State private var showInfoSheet = false
    @State private var showConfigSheet = false
    @StateObject var padsViewModel = PadsClass.shared
    
    var body: some View {
            GeometryReader { geometry in
                ZStack{
                    Color(uiColor: UIColor(red: 0.164, green: 0.233, blue: 0.292, alpha: 1))

                    Image("guitar")
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                    
                    HStack{
                        
                        Button {
                            showInfoSheet.toggle()
                        } label: {
                            Image(systemName: "info.circle")
                                .font(.system(size: geometry.size.width * 0.03))
                        }
                        .sheet(isPresented: $showInfoSheet) {
                            InfoView(videoName: "memoji")
                        }

                        Spacer()
                        
                        NavigationLink {
                            ConfigView()
                        } label: {
                            Image(systemName: "gearshape")
                                .font(.system(size: geometry.size.width * 0.03))
                        }
                        
                    }
                    .padding(.all, geometry.size.width * 0.05)
                    .foregroundColor(.white)
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .top)
                    
                    VStack{
                        if bestScore > 0 {
                            Text ("High Score: \(bestScore)")
                                .font(.system(.title3).weight(.medium))
                                .foregroundColor(.white)
                                .frame(alignment: .bottomLeading)
                        }
                        
                        NavigationLink(destination: GameView()) {
                            Text("START")
                                .font(.system(size: geometry.size.width * 0.07).weight(.bold))
                                .foregroundColor(.green)
                            
                                
                        }
                        .padding(.bottom, geometry.size.height * 0.02)
                        
                    }
                    .frame(height: geometry.size.height * 0.4)
                    
                }
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
        
            .onAppear{
                self.bestScore = padsViewModel.scoreClass.highScore
            }

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
