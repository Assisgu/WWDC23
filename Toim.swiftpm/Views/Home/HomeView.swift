//
//  SwiftUIView.swift
//  
//
//  Created by Gustavo Assis on 06/04/23.
//

import SwiftUI

struct HomeView: View {
    @State var highScore: Bool = false
    @State var modeFree: Bool = false
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
                        Spacer()
                        Button {
                            showInfoSheet.toggle()
                        } label: {
                            Image(systemName: "info.circle")
                                .font(.system(size: geometry.size.width * 0.03))
                        }
                        .sheet(isPresented: $showInfoSheet) {
                            InfoView(videoName: "memoji")
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
                        
                        NavigationLink(destination: GameView( modeFree: $modeFree)) {
                            Text("START")
                                .font(.system(size: geometry.size.width * 0.07).weight(.bold))
                                .foregroundColor(.green)
                        }
                        .padding(.bottom, geometry.size.height * 0.02)
                        
                        VStack(spacing: 0) {
                            
                            HStack {
                                Button {
                                    self.modeFree = true
                                } label: {
                                    !modeFree ? Text("Free") : Text("Free")
                                            .fontWeight(.bold)
                                            .foregroundColor(.yellow)
                                }
                                .frame(width: geometry.size.width * 0.11)
                                
                                    Text("Mode")
                                    .fontWeight(.bold)
                                    .frame(width: geometry.size.width * 0.08)
                                    
                                Button{
                                    self.modeFree = false
                                } label: {
                                    modeFree ? Text("Challenge") : Text("Challenge")
                                            .fontWeight(.bold)
                                            .foregroundColor(.yellow)
                                }
                                .frame(width: geometry.size.width * 0.11)
                                
                            }
                            .frame(width: geometry.size.width * 0.3)
                            .foregroundColor(.white)
                        }
                  
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
